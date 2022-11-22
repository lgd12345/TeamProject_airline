package com.airline.a1.board2;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.airline.a1.board2Util.Pager2;
import com.airline.a1.board2Util.FilePathGenerator2;
import com.airline.a1.board2Util.FileSaver2;

@Transactional
@Service
public class Notice2Service {

	@Autowired
	private Notice2Mapper notice2Mapper;
	@Autowired
	private Notice2FilesMapper notice2FilesMapper;
	@Autowired
	private FileSaver2 fileSaver2;
	@Autowired
	private FilePathGenerator2 filePathGenerator2;

	/**** File ****/

	public boolean summerfileDelete2(String file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile2");
		return fileSaver2.fileDelete(realPath, file);
	}

	public String summerfile2(MultipartFile file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile2");
		return fileSaver2.save(realPath, file);
	}

	public Notice2FilesVO Notice2FileSelect(Notice2FilesVO notice2FilesVO) throws Exception {
		return notice2FilesMapper.notice2FileSelect(notice2FilesVO);
	}

	public int Notice2FileDelete(Notice2FilesVO notice2FilesVO) throws Exception {
		return notice2FilesMapper.notice2FileDelete(notice2FilesVO);
	}

	/**** noticeWrite ****/

	public int notice2Write(Notice2VO notice2VO, MultipartFile[] file) throws Exception {
		// file 유무검증
		int result = notice2Mapper.notice2Write(notice2VO);
		
		return result;
	}
	
	public int notice2Write1(Notice2VO notice2VO, MultipartFile[] file) throws Exception {
		// file 유무검증
		boolean check = false;
		int result = notice2Mapper.notice2Write1(notice2VO);
		if (file.length > 0) {

			for (MultipartFile multipartFile : file) {
				if (multipartFile.getSize() > 0) {
					check = true;
					break;
				}
			} // for끝

			if (check) {
				List<Notice2FilesVO> notice2FilesVOs = new ArrayList<>();
				File file2 = filePathGenerator2.getUseClassPathResource("board2");

				for (MultipartFile multipartFile : file) {
					if (multipartFile.getSize() > 0) {
						String fileName = fileSaver2.save2(file2, multipartFile);
						Notice2FilesVO notice2FilesVO = new Notice2FilesVO();
						notice2FilesVO.setNum(notice2VO.getNum());
						notice2FilesVO.setFname(fileName);
						notice2FilesVO.setOname(multipartFile.getOriginalFilename());
						notice2FilesVOs.add(notice2FilesVO);
					}
				}
				result = notice2FilesMapper.notice2FileWrite(notice2FilesVOs);
			}
		}
		return result;
	}


	/**** noticeList ****/

	public List<Board2VO> notice2List(Pager2 pager2) throws Exception {
		pager2.makeRow();
		pager2.makePage(notice2Mapper.notice2Count(pager2));
		return notice2Mapper.notice2List(pager2);
	}

	public List<Board2VO> subNotice2List(Pager2 pager2) throws Exception {
		pager2.makeRow();
		pager2.makePage(notice2Mapper.notice2Count2(pager2));
		return notice2Mapper.subNotice2List(pager2);
	}

	public List<Notice2VO> adminNotice2List() throws Exception {
		return notice2Mapper.adminNotice2List();
	}

	/* pager */
	public int notice2Count(Pager2 pager2) throws Exception {
		return notice2Mapper.notice2Count(pager2);
	}

	public int notice2Count2(Pager2 pager2) throws Exception {
		return notice2Mapper.notice2Count2(pager2);
	}

	/**** noticeSelect ****/

	public Notice2VO notice2Select(Notice2VO notice2VO) throws Exception {
		notice2Mapper.notice2Hit(notice2VO.getNum());
		return notice2Mapper.notice2Select(notice2VO);
	}
	
	public Notice2VO notice2Select1(Notice2VO notice2VO) throws Exception {
		notice2Mapper.notice2Hit(notice2VO.getNum());
		return notice2Mapper.notice2Select1(notice2VO);
	}

	/*
	 * public List<BoardVO> listView(NoticeVO noticeVO)throws Exception{ return
	 * noticeMapper.listView(noticeVO); }
	 */

	public Notice2VO prev2(Notice2VO notice2VO) throws Exception {
		return notice2Mapper.prev(notice2VO);
	}

	public Notice2VO next2(Notice2VO notice2VO) throws Exception {
		return notice2Mapper.next(notice2VO);
	}

	/**** noticeUpdate ****/

	public int notice2Update(Notice2VO notice2VO, MultipartFile[] file, HttpSession session) throws Exception {
		Notice2FilesVO notice2FilesVO = new Notice2FilesVO();
		notice2FilesVO.setNum(notice2VO.getNum());
		int result = notice2Mapper.notice2Update(notice2VO);

		return result;
	}
	
	public int notice2Update1(Notice2VO notice2VO, MultipartFile[] file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/notice2");
		Notice2FilesVO notice2FilesVO = new Notice2FilesVO();
		notice2FilesVO.setNum(notice2VO.getNum());
		boolean check = false;
		int result = notice2Mapper.notice2Update1(notice2VO);

		if (file.length > 0) {
			for (MultipartFile multipartFile : file) {
				if (multipartFile.getSize() > 0) {
					check = true;
					break;
				}
			} // for끝

			if (check) {
				List<Notice2FilesVO> notice2FilesVOs = new ArrayList<>();
				/* File file2 = filePathGenerator.getUseClassPathResource("board"); */

				for (MultipartFile multipartFile : file) {
					if (multipartFile.getSize() > 0) {
						String fileName = fileSaver2.save(realPath, multipartFile);
						/* NoticeFilesVO noticeFilesVO = new NoticeFilesVO(); */
						notice2FilesVO.setNum(notice2VO.getNum());
						notice2FilesVO.setFname(fileName);
						notice2FilesVO.setOname(multipartFile.getOriginalFilename());
						notice2FilesVOs.add(notice2FilesVO);
					}
				}
				result = notice2FilesMapper.notice2FileWrite(notice2FilesVOs);
			}
		}
		return result;
	}

	/**** noticeDelete ****/

	public int notice2Delete(Notice2VO notice2VO) throws Exception {
		return notice2Mapper.notice2Delete(notice2VO);
	}

}