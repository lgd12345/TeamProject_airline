package com.airline.a1.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.airline.a1.booking.FlightDataVO;

import com.airline.a1.park.pInfoVO;
import com.airline.a1.park.pReservationVO;
import com.airline.a1.search.CardProductsBoardVO;
import com.airline.a1.search.CardProductsService;
import com.airline.a1.search.CardProductsVO;
import com.airline.a1.member.MembersVO;
import com.airline.a1.board.BoardVO;
import com.airline.a1.board.NoticeService;
import com.airline.a1.board.NoticeVO;
import com.airline.a1.board2.Notice2Service;
import com.airline.a1.board2.Notice2VO;
import com.airline.a1.boardUtil.Pager;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	/*
	 * @GetMapping public void main() throws Exception{
	 * 
	 * }
	 */
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private Notice2Service notice2Service;
	
	@Autowired
	private CardProductsService productService;
	
	
	@GetMapping("adminmain")
	public void adminmain(Model model) throws Exception{
		
		FlightDataVO flightDataVO = new FlightDataVO();
		
		flightDataVO.setAirlineNm("");
		
		  SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		  Date time = new Date(); 
		  String today = format1.format(time); //오늘 날짜
		
		  flightDataVO.setDepPlandTime(today);
		  flightDataVO.setArrPlandTime(today+" 23:59:59");
		  Integer tprice = adminService.tprice(flightDataVO);
		  model.addAttribute("tprice", tprice);
		  
		  flightDataVO.setDepPlandTime("2020-02-01");
		  flightDataVO.setArrPlandTime("2020-02-29 23:59:59");
		  Integer mprice = adminService.tprice(flightDataVO);
		  model.addAttribute("mprice", mprice);
		  
		  format1 = new SimpleDateFormat ("yyyyMMdd");
		  today = format1.format(time);
		  flightDataVO.setDepPlandTime(today);
		 
		  // flightDataVO.setDepPlandTime("20200120");
		  Double trate = adminService.trate(flightDataVO);
		  model.addAttribute("trate", trate);

		  Integer ftotal = adminService.ftotal(flightDataVO);
		  model.addAttribute("ftotal", ftotal);
	}
	
	
	
	
	@GetMapping("admin1_1")
	public void admin1_1(Model model) throws Exception{
		List<AirlineVO> airlineVOs = adminService.airlineList();
		model.addAttribute("alist", airlineVOs);
		
		List<FlightDataVO> flist = adminService.airallList();
		model.addAttribute("flist", flist);
	
	}
	
	@GetMapping("admin1_1_layout")
	public ModelAndView admin1_1_layout(FlightDataVO flightDataVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FlightDataVO> flist = adminService.airpartList(flightDataVO);
		mv.addObject("flist", flist);
		
		List<AirlineVO> airlineVOs = adminService.airlineList();
		mv.addObject("alist", airlineVOs);
		
		mv.setViewName("admin/common/admin1_1_layout");
		
		return mv;
	}
	
	
	@GetMapping("admin1_2")
	public void admin1_2(Model model) throws Exception{
		List<AirportVO> airlineVOs = adminService.airportList();
		model.addAttribute("alist", airlineVOs);
		
		List<FlightDataVO> flist = adminService.airallList();
		model.addAttribute("flist", flist);
		
	}
	
	@GetMapping("admin1_2_layout")
	public ModelAndView admin1_2_layout(FlightDataVO flightDataVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FlightDataVO> flist = adminService.airportpartList(flightDataVO);
		mv.addObject("flist", flist);
		
		List<AirlineVO> airlineVOs = adminService.airlineList();
		mv.addObject("alist", airlineVOs);
		
		
		
		
		mv.setViewName("admin/common/admin1_2_layout");
		
		return mv;
	}
	
	
	@GetMapping("admin2_1")
	public void admin2_1(Model model) throws Exception{
		List<NoticeVO> ar = noticeService.adminNoticeList();	
		/* model.addAttribute("board", "notice"); */
		model.addAttribute("list", ar);
	}
	
	
	//이용후기 관리자 쪽 게시판
	@GetMapping("admin3_1")
	public void admin3_1(Model model) throws Exception{
			List<Notice2VO> ar = notice2Service.adminNotice2List();	
//			model.addAttribute("board2", "notice2");
			model.addAttribute("list", ar);
	}


	@GetMapping("admin4_1")
	public void admin4_1(Model model) throws Exception{
		List<MembersVO> ar = adminService.getMemberList();
		for (MembersVO members : ar) {
			if (members.getPhone().length() ==11) {
				members.setPhone(members.getPhone().substring(0, 3)+"-"+members.getPhone().substring(3, 7)+"-"+members.getPhone().substring(7, 11));
			}else {
				members.setPhone(members.getPhone().substring(0, 3)+"-"+members.getPhone().substring(3, 6)+"-"+members.getPhone().substring(6, 10));
			}
		}
		model.addAttribute("list", ar);
	}
	

	@GetMapping("admin5_1")
	public void admin5_1(Model model) throws Exception{
		List<CardProductsVO> ar = productService.adminProductList();	
		/* model.addAttribute("board", "notice"); */
		model.addAttribute("list", ar);
	}
	
	
	
	@GetMapping("adminDelete2")
	public ModelAndView adminDelete2(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.noticeDelete(noticeVO);
		if(result>0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		}else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
			mv.addObject("path","../admin/admin2_1");
			mv.setViewName("board/common/result");
			
			return mv;
	}

}
