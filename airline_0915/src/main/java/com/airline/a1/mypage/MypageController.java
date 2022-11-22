package com.airline.a1.mypage;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.airline.a1.board2.Board2VO;
import com.airline.a1.board2.Notice2Service;
import com.airline.a1.board2.Notice2VO;
import com.airline.a1.board2Util.Pager2;
import com.airline.a1.booking.BookingPriceVO;
import com.airline.a1.booking.BookingTicketVO;
import com.airline.a1.checkIn.ETicketVO;
import com.airline.a1.checkIn.SeatVO;
import com.airline.a1.limo.LimoService;
import com.airline.a1.limo.LimoVO;
import com.airline.a1.member.MembersVO;
import com.airline.a1.park.ParkService;
import com.airline.a1.park.pReservationVO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.airline.a1.member.MembersVO;
import com.airline.a1.park.ParkService;
import com.airline.a1.park.pInfoVO;
import com.airline.a1.park.pReservationVO;

@Controller
@RequestMapping("mypage/**")
public class MypageController {
	
	@Autowired
	private ParkService parkService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private Notice2Service notice2Service;
	@Autowired
	private LimoService limoService;
	
	@GetMapping("main")
	public ModelAndView main(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MembersVO membersVO = (MembersVO) session.getAttribute("member");
		List<BookingPriceVO> bookingPriceVOs = mypageService.recentMileage(membersVO);
		mv.addObject("mile",bookingPriceVOs);
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public void memberUpdate() {
	}
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MembersVO membersVO,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = mypageService.updateMember(membersVO);
		String msg = "정보수정 실패";
		String path = "./memberUpdate";
		if(result > 0) {
			MembersVO membersVO2 = (MembersVO) session.getAttribute("member");
			membersVO2.setName(membersVO.getName());
			membersVO2.setPhone(membersVO.getPhone());
			membersVO2.setEmail(membersVO.getEmail());
			msg = "정보수정 완료";
			session.setAttribute("member",membersVO2);
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_result");
		return mv;
	}
	
	/**** NoticeList ****/
	// 회원
	@GetMapping("notice22List")
	public ModelAndView notice22List(String id2, Pager2 pager2,HttpSession session) throws Exception {
		MembersVO membersVO = (MembersVO) session.getAttribute("member");
		String id = membersVO.getId();
		System.out.println("id 찍어보기. 멤버 찍어 보기====" + id);
		List<Board2VO> ar = mypageService.notice33List(id,pager2);
		ModelAndView mv = new ModelAndView();
		
		int totalCount = mypageService.notice22Count(pager2);
		System.out.println("pager2에 뭐가 있나요?====" + pager2);
		System.out.println("pager2에 뭐가 있나요?=====" + pager2.toString());
		System.out.println("하하하");
		mv.addObject("id", membersVO.getId());
		mv.addObject("tc", totalCount);
		mv.addObject("board2", "notice2");
		mv.addObject("list", ar);
		mv.addObject("pager", pager2);
		System.out.println("하하하==totalCount========"+totalCount);
		System.out.println("하하하===ar======="+ar);
		System.out.println("하하하==pager2========"+pager2);
		mv.setViewName("mypage/board22List");

		return mv;

	}
	/**** Notice2Select 회원 ****/

	@GetMapping("notice22Select")
	public ModelAndView Notice22Select(Notice2VO notice2VO) throws Exception {
		ModelAndView mv = new ModelAndView();
		Notice2VO notice2VO2 = mypageService.notice22Select(notice2VO);
		Notice2VO notice2VO3 = mypageService.next22(notice2VO);
		/* List<BoardVO> ar =noticeService.listView(noticeVO); */

		notice2VO = mypageService.prev22(notice2VO);

		mv.addObject("vo", notice2VO2);
		mv.addObject("prev", notice2VO);
		mv.addObject("next", notice2VO3);
		mv.addObject("board2", "notice2");
		mv.setViewName("board_r/board22Select");

		return mv;

	}
	
	@GetMapping("mileage")
	public void mileage(HttpSession session, Model model) throws Exception {
		MembersVO membersVO = (MembersVO)session.getAttribute("member");
		List<BookingPriceVO> bookingPriceVOs =  mypageService.mtotal(membersVO);
		model.addAttribute("blist", bookingPriceVOs);
	}
	
	@GetMapping("milplus")
	public ModelAndView milplus(BookingTicketVO bookingTicketVO) throws Exception {
		
		List<BookingTicketVO> nlist = mypageService.bnumSearch(bookingTicketVO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nlist", nlist);
		mv.setViewName("mypage/common/millayout");
		
		return mv;
	}
	@GetMapping("openQrcode")
	public void openQrcode() throws Exception{
		
	}
	@GetMapping("openBarcode")
	public void openBarcode() throws Exception{
		
	}
	@GetMapping("ticketCancel")
	public ModelAndView bookCancel(String bnum) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = mypageService.bookCancel(bnum);
		String msg = "예매 취소에 실패했습니다.";
		String path = "./ticketCheck";
		if(result > 0)
			msg = "예매가 취소되었습니다.";
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_result");
		return mv;
	}
	@GetMapping("bookingMore")
	public ModelAndView bookingMore(String bookingNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		ETicketVO eTicketVO = new ETicketVO();
		eTicketVO.setBookingNum(bookingNum);
		List<ETicketVO> eTicketVOs = mypageService.getBookingMore(eTicketVO);
		List<SeatVO> seatVOs = mypageService.getBookingMoreSeat(eTicketVO);
		String str = eTicketVOs.get(0).getDepPlandTime().substring(0,4) +"-"+eTicketVOs.get(0).getDepPlandTime().substring(4,6) + "-"
				+eTicketVOs.get(0).getDepPlandTime().substring(6,8) ;
		mv.addObject("bookingMore",eTicketVOs);
		mv.addObject("seats",seatVOs);
		mv.addObject("isCheckIn",seatVOs.size());
		mv.addObject("count", eTicketVOs.size());
		return mv;
	}
	
	@GetMapping("ticketCheck")
	public ModelAndView ticketCheck(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		ETicketVO eTicketVO = new ETicketVO();
		MembersVO member = (MembersVO)session.getAttribute("member");
		eTicketVO.setId(member.getId()); 
		List<ETicketVO> eTicketVOs = mypageService.getBookingList(eTicketVO);
		List<ETicketVO> eTicketVOs2 = new ArrayList<ETicketVO>();
		
		for(int i = 0; i < eTicketVOs.size(); i++) {
			// 왕복이어도 정보는 가지지만 리스트에는 하나만 출력하기 (distinct 해도 정보가 달라서 두개씩나옴)
			if (eTicketVOs.get(i).getKind().equals("왕복")) {
				if (i < eTicketVOs.size()-1 && eTicketVOs.get(i).getBookingNum().equals(eTicketVOs.get(i + 1).getBookingNum())) {
					eTicketVOs2.add(eTicketVOs.get(i));
				}
			}
			else {
				eTicketVOs2.add(eTicketVOs.get(i));
			}
		} 
		mv.addObject("bookList",eTicketVOs2);
		return mv;
	}
	
	@GetMapping("park")
	public void park(HttpSession session, pReservationVO pReservationVO,Model model) throws Exception {
		
		if(pReservationVO.getStartDate() == null) {
			Long today = System.currentTimeMillis();
			Long todaypast = today - 1296000000;
			Long todayafter = today + 1296000000;
			
			Date past = new Date(todaypast);
			Date after = new Date(todayafter);
			pReservationVO.setStartDate(past);
			pReservationVO.setEndDate(after);
		}
		MembersVO membersVO = (MembersVO)session.getAttribute("member");
		pReservationVO.setId(membersVO.getId());
		List<pReservationVO> ar = parkService.myReservation(pReservationVO);
		model.addAttribute("list", ar);
		model.addAttribute("VO", pReservationVO);
		
	}
	@GetMapping("parkSelect")
	public void parkSelect(pReservationVO pReservationVO, Model model) throws Exception {
		
		pReservationVO = parkService.resSelect(pReservationVO);
		pInfoVO pInfoVO = new pInfoVO();
		pInfoVO.setaName(pReservationVO.getAirport());
		pInfoVO = parkService.parkWhere(pInfoVO);
		model.addAttribute("VO", pReservationVO);
		model.addAttribute("park", pInfoVO);
		List<Integer> etc = new ArrayList<Integer>();
		if(pInfoVO.getEtc() !=null) {
			for (int i = 0; i < pInfoVO.getEtc().split(",").length; i++) {
				etc.add(Integer.parseInt(pInfoVO.getEtc().split(",")[i]));
			}
		}
		model.addAttribute("etc", etc);
		
	}
	
	@GetMapping("limo")
	public void limo(HttpSession session, LimoVO limoVO, Model model) throws Exception{
		MembersVO membersVO = (MembersVO)session.getAttribute("member");
		limoVO.setId(membersVO.getId());
		List<LimoVO> ar = limoService.myLimo(limoVO);
		model.addAttribute("limo", ar);
	}
	
	
	@GetMapping("test")
	public void test () {}
	
	@GetMapping("chart")
	public void chart() {}
	
}
