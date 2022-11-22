package com.airline.a1.board2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.airline.a1.board2Util.Pager2;

@Controller
@RequestMapping("/notice2/**")
public class Notice2Controller {

	@Autowired
	private Notice2Service notice2Service;

	@ModelAttribute(name = "notice2")
	public Notice2VO getNotice() throws Exception {
		return new Notice2VO();
	}

	/**** 네이버 캡차 API ****/

	@RequestMapping("captchaKey.do")
	@ResponseBody
	// 뷰페이지로 인지하지말고 데이터 자체로 인지하라고 선언 web context 안에
	// response객체안에 이 데이터를 넣어서 보내주면 값 으로 인지해서 넘어감.
	public void APIExamCaptchaNkey(HttpServletResponse response) {
		String clientId = "1ZAkgnqL4cplyLpj4uMb";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "ADkTTIsKUp";// 애플리케이션 클라이언트 시크릿값";
		try {
			String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			System.out.println("키발급 호출 상태 : " + responseCode);

			String inputLine;
			StringBuffer resp = new StringBuffer();

			while ((inputLine = br.readLine()) != null) {
				resp.append(inputLine);
			}
			br.close();

			System.out.println("키발급 메소드 : " + resp.toString());
			System.out.println("키발급 메소드 밸류 : " + resp.toString().substring(8, 8 + 16));

			String key = resp.toString().substring(8, 8 + 16);

			PrintWriter out = response.getWriter();

			if (key != null) {
				out.append(key);
				out.flush();
			}
			// mv.addObject("key", key).setViewName("redirect:captchaImg.do");
		} catch (Exception e) {
			System.out.println(e);
		}
//				JSONObject job = new JSONObject();
//				job.put("no", 123);
//				job.put("title", "test json object");
//				job.put("writer", URLEncoder.encode("박신우","UTF-8"));
//				job.put("content", URLEncoder.encode("JSON객체를 뷰로 리턴하겠습니다.","UTF-8"));
//				
//				return job.toJSONString(); // 반환값이 원래는 기본적으로 String인데 JSON도 string으로 보내진다. 
//											//주소로 찾아가지않고 제이슨객체를 들고가게 설정하기위해 @ResponseBody를 써준다 
//								
		// return mv;
	}

	// 네이버 캡차 API 예제 - 캡차 이미지 수신
	@RequestMapping("captchaImg.do")
	public void APIExamCaptchaImage(@RequestParam("key") String key, HttpServletResponse response,
			HttpServletRequest request) {
		System.out.println("이미지 수신 메소드 : " + key);

		String clientId = "5UBafHl3pvkxVL8nbUOG";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "mBBrORfZyt";// 애플리케이션 클라이언트 시크릿값";
		try {
			// String key = "CAPTCHA_KEY"; // https://openapi.naver.com/v1/captcha/nkey 호출로
			// 받은 키값
			String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;

			if (responseCode == 200) { // 정상 호출

				String root = request.getSession().getServletContext().getRealPath("resources");
				System.out.println("캡차 루트 : " + root);
				String savePath = root + "/captchaImg";
				System.out.println("캡차 저장경로 : " + savePath);

				File folder = new File(savePath);

				if (!folder.exists()) {
					folder.mkdirs(); // buploadFiles folder가없으면 만들어준다.
				}
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 파일 생성
				String tempname = Long.valueOf(new Date().getTime()).toString();

				File f = new File(folder + "/" + tempname + ".jpg");
				f.createNewFile();

				OutputStream outputStream = new FileOutputStream(f);

				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				is.close();

				PrintWriter out = response.getWriter();

				out.append(tempname + ".jpg");
				out.flush();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));

				String inputLine;
				StringBuffer resp = new StringBuffer();

				while ((inputLine = br.readLine()) != null) {
					resp.append(inputLine);
				}
				br.close();
			}
			System.out.println("정상호출 : " + responseCode);
		} catch (Exception e) {
			System.out.println(e);
		}
//				return "common/captchaApi/naverCaptcha";
	}

	// 네이버 캡차 API 예제 - 입력값 비교
	@RequestMapping("checkNo.do")
	@ResponseBody
	public String APIExamCaptchaNkeyResult(String key, String value) {
		String clientId = "5UBafHl3pvkxVL8nbUOG";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "mBBrORfZyt";// 애플리케이션 클라이언트 시크릿값";
		StringBuffer response = new StringBuffer();
		try {
			String code = "1"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			// String key = "CAPTCHA_KEY"; // 캡차 키 발급시 받은 키값
			// String value = "USER_VALUE"; // 사용자가 입력한 캡차 이미지 글자값
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value="
					+ value;

			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				// {"result":true,"responseTime":84.6}
				System.out.println("입력값 비교 정상 호출 : " + br);
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println("입력값 비교 메소드 : " + response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		return response.toString();
	}

	/**** summerNote ****/

	@PostMapping(value = "summerfileDelete2")
	public ModelAndView summerfileDelete2(String file, HttpSession session) throws Exception {
		boolean check = notice2Service.summerfileDelete2(file, session);
		String result = "Delete Fail2";
		if (check) {
			result = "Delete Success2";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board_r/common/common_ajaxResult");
		mv.addObject("result", result);
		return mv;
	}

	@PostMapping(value = "summerFile2")
	public ModelAndView summerFile2(MultipartFile file, HttpSession session) throws Exception {
		System.out.println("ddd1123123213");
		String fileName = notice2Service.summerfile2(file, session);
		// System.out.println(file.getOriginalFilename()); test
		ModelAndView mv = new ModelAndView();

		mv.setViewName("board_r/common/common_ajaxResult");
		mv.addObject("result", fileName);
		return mv;
	}

	/**** File ****/
	@PostMapping(value = "notice2FileDelete")
	public ModelAndView noticeFileDelete2(Notice2FilesVO noticeFiles2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = notice2Service.Notice2FileDelete(noticeFiles2VO);
		mv.setViewName("board_r/common/common_ajaxResult");
		mv.addObject("result", result);

		return mv;
	}

	/**** NoticeWrite 회원 처음 여기로 들어감 ****/

	@GetMapping("notice2Write")
	public ModelAndView notice2Write() throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("하");
		mv.addObject("board2", "notice2");
		mv.setViewName("board_r/board2Write");

		return mv;
	}

	@PostMapping("notice2Write")
	public ModelAndView notice2Write(Notice2VO notice2VO, MultipartFile[] file) throws Exception {

		ModelAndView mv = new ModelAndView();

		int result = notice2Service.notice2Write(notice2VO, file);

		String msg = "작성에 실패하였습니다.다시 작성해주세요.";
		String path = "./notice2List";

		if (result > 0) {

			msg = "작성되었습니다.";
		}
		System.out.println("하하");
		mv.setViewName("board_r/common/result");
		mv.addObject("message", msg);
		mv.addObject("path", path);

		return mv;
	}

	/**** NoticeWrite 관리자 적는 곳 이곳으로 들어감 ****/

	@GetMapping("notice2Write1")
	public ModelAndView notice2Write1() throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("흥흥");
		mv.addObject("board2", "notice2");
		mv.setViewName("board_r/board2Write1");

		return mv;
	}

	@PostMapping("notice2Write1")
	public ModelAndView notice2Write1(Notice2VO notice2VO, MultipartFile[] file) throws Exception {

		ModelAndView mv = new ModelAndView();
		int result = notice2Service.notice2Write1(notice2VO, file);

		String msg = "작성에 실패하였습니다.다시 작성해주세요.";
		String path = "../admin/admin3_1";

		if (result > 0) {

			msg = "작성되었습니다.";
		}
		System.out.println("흥흥흥");
		mv.setViewName("board_r/common/result");
		mv.addObject("message", msg);
		mv.addObject("path", path);

		return mv;
	}

	/**** NoticeList ****/
	// 회원
	@GetMapping("notice2List")
	public ModelAndView notice2List(Pager2 pager2) throws Exception {
		List<Board2VO> ar = notice2Service.notice2List(pager2);
		ModelAndView mv = new ModelAndView();
		int totalCount = notice2Service.notice2Count(pager2);
		System.out.println("pager2에 뭐가 있나요?==============" + pager2);
		System.out.println("pager2에 뭐가 있나요?==============" + pager2.toString());
		System.out.println("하하하");
		mv.addObject("tc", totalCount);
		mv.addObject("board2", "notice2");
		mv.addObject("list", ar);
		mv.addObject("pager", pager2);
		mv.setViewName("board_r/board2List");

		return mv;

	}

	// 관리자 바로 들어가는 곳은 아님
	@GetMapping("notice2List1")
	public ModelAndView notice2List1(Pager2 pager2) throws Exception {
		List<Board2VO> ar = notice2Service.subNotice2List(pager2);
		ModelAndView mv = new ModelAndView();
		int totalCount = notice2Service.notice2Count2(pager2);
		System.out.println("하하하하");

		mv.addObject("tc", totalCount);
		mv.addObject("board2", "notice2");
		mv.addObject("list", ar);
		mv.addObject("pager", pager2);

		mv.setViewName("admin/admin3_1");
		return mv;
	}

	/**** Notice2Select 회원 ****/

	@GetMapping("notice2Select")
	public ModelAndView Notice2Select(Notice2VO notice2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		Notice2VO notice2VO2 = notice2Service.notice2Select(notice2VO);
		Notice2VO notice2VO3 = notice2Service.next2(notice2VO);
		/* List<BoardVO> ar =noticeService.listView(noticeVO); */

		notice2VO = notice2Service.prev2(notice2VO);

		mv.addObject("vo", notice2VO2);
		mv.addObject("prev", notice2VO);
		mv.addObject("next", notice2VO3);
		mv.addObject("board2", "notice2");
		mv.setViewName("board_r/board2Select");

		return mv;

	}

	/**** Notice2Select 관리자 ****/

	@GetMapping("notice2Select1")
	public ModelAndView Notice2Select1(Notice2VO notice2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		Notice2VO notice2VO2 = notice2Service.notice2Select1(notice2VO);
		Notice2VO notice2VO3 = notice2Service.next2(notice2VO);
		/* List<BoardVO> ar =noticeService.listView(noticeVO); */

		notice2VO = notice2Service.prev2(notice2VO);

		mv.addObject("vo", notice2VO2);
		mv.addObject("prev", notice2VO);
		mv.addObject("next", notice2VO3);
		mv.addObject("board2", "notice2");
		mv.setViewName("board_r/board2Select1");

		return mv;

	}

	/**** Notice Update 회원 ****/

	@GetMapping("notice2Update")
	public ModelAndView notice2Update(Notice2VO notice2VO, Pager2 pager2) throws Exception {
		ModelAndView mv = new ModelAndView();
		notice2VO.setNum(notice2VO.getNum());
		notice2VO = notice2Service.notice2Select(notice2VO);

		mv.addObject("board2", "notice2");
		mv.addObject("vo", notice2VO);
		mv.setViewName("board_r/board2Update");

		return mv;
	}

	@PostMapping("notice2Update")
	public ModelAndView notice2Update(Notice2VO notice2VO, MultipartFile[] file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = notice2Service.notice2Update(notice2VO, file, session);

		if (result > 0) {
			mv.addObject("message", "게시글이 수정되었습니다.");
		} else {
			mv.addObject("message", "수정에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "./notice2List");
		mv.setViewName("board_r/common/result");

		return mv;
	}

	/**** Notice Update1 관리자 ****/
	@GetMapping("notice2Update1")
	public ModelAndView notice2Update1(Notice2VO notice2VO, Pager2 pager2) throws Exception {
		ModelAndView mv = new ModelAndView();
		notice2VO.setNum(notice2VO.getNum());
		notice2VO = notice2Service.notice2Select1(notice2VO);

		mv.addObject("board2", "notice2");
		mv.addObject("vo", notice2VO);
		mv.setViewName("board_r/board2Update1");

		return mv;
	}

	@PostMapping("notice2Update1")
	public ModelAndView noticeUpdate1(Notice2VO notice2VO, MultipartFile[] file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = notice2Service.notice2Update1(notice2VO, file, session);

		if (result > 0) {
			mv.addObject("message", "게시글이 수정되었습니다.");
		} else {
			mv.addObject("message", "수정에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "../admin/admin3_1");
		mv.setViewName("board_r/common/result");

		return mv;
	}

	/**** noticeDelete ****/

	@GetMapping("notice2Delete")
	public ModelAndView notice2Delete(Notice2VO notice2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = notice2Service.notice2Delete(notice2VO);
		if (result > 0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		} else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "notice2List");
		mv.setViewName("board_r/common/result");

		return mv;
	}
	@GetMapping("notice2Delete2")
	public ModelAndView notice2Delete2(Notice2VO notice2VO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = notice2Service.notice2Delete(notice2VO);
		if(result>0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		}else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
			mv.addObject("path","../admin/admin3_1");
			mv.setViewName("board/common/result");
			
			return mv;
	}
	 

	@GetMapping("notice22Delete")
	public ModelAndView notice22Delete(Notice2VO notice2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = notice2Service.notice2Delete(notice2VO);
		if (result > 0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		} else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "../mypage/notice22List");
		mv.setViewName("board_r/common/result");

		return mv;
	}

}
