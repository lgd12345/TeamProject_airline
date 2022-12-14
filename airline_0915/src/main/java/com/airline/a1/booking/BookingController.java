package com.airline.a1.booking;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.zip.Adler32;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.airline.a1.member.MembersVO;

@Controller
@RequestMapping("/booking/**")
public class BookingController {

	@Autowired
	private BookingService bookingService;

	@PostMapping("airportDepList")
	public ModelAndView airportDepList(HttpServletRequest req) throws Exception {
		String depLoc = req.getParameter("depLoc");

		ModelAndView mv = new ModelAndView();

		List<BookingTicketVO> ar = bookingService.airportDepList(depLoc);

		mv.addObject("arrLoc", ar);
		mv.setViewName("booking/common/result");

		return mv;

	}

	@ResponseBody
	@GetMapping("airportCheck")
	public boolean airportCheck(BookingTicketVO bookingTicketVO) throws Exception {

		String depLoc = bookingTicketVO.getDepLoc();
		String arrLoc = bookingTicketVO.getArrLoc();
		List<String> ar = bookingService.airportList();
		List<BookingTicketVO> ar2 = bookingService.airportDepList(depLoc);

		boolean check = false;

		for (String airPort : ar) {
			if (depLoc.equals(airPort)) {
				for (BookingTicketVO bookingTicketVO2 : ar2) {
					if (arrLoc.equals(bookingTicketVO2.getArrAirportNm())) {
						check = true;
					}
				}
			}
		}

		return check;
	}

	@GetMapping("bookingMain")
	public void bookingMain(Model model) throws Exception {

		List<String> airport = bookingService.airportList();
		model.addAttribute("airportList", airport);

		// ???????????????
		// ????????????
		String today = null;
		Date date = new Date();

		SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMddHHmm");
		String now = sdformat.format(date); // ???????????? (????????? ?????????)

		// Java ?????? ?????????
		Calendar cal = Calendar.getInstance();

		cal.setTime(date); // 10??? ??????
		cal.add(Calendar.MINUTE, -10);
		today = sdformat.format(cal.getTime());

		FlightDataVO flightDataVO = new FlightDataVO();
		flightDataVO.setDepPlandTime(today);

		cal.setTime(date); // 10??? ?????????
		cal.add(Calendar.MINUTE, +10);
		String later = sdformat.format(cal.getTime());

		List<FlightDataVO> fList = bookingService.flightList(flightDataVO);
		model.addAttribute("flist", fList);

		model.addAttribute("ttime", now);
		model.addAttribute("later", later);
	}

	@PostMapping("bookingMain")
	public ModelAndView bookingMain(BookingTicketVO bookingTicketVO) throws Exception {

		String date = bookingTicketVO.getDate();
		String ddate = "";
		String adate = "";

		List<FlightDataVO> dairList = new ArrayList<FlightDataVO>();
		List<FlightDataVO> aairList = new ArrayList<FlightDataVO>();

		List<BookingTicketVO> ddates = new ArrayList<>();
		List<BookingTicketVO> adates = new ArrayList<>();

		// ?????? ??????
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy??? MM??? dd???");
		Calendar time = Calendar.getInstance();
		String today = format2.format(time.getTime());

		if (bookingTicketVO.getKind().equals("??????")) {
			ddate = date.substring(6) + date.substring(0, 2) + date.substring(3, 5);
			/* System.out.println(ddate); */
			bookingTicketVO.setDepStartTime(ddate);

			dairList = bookingService.airList(bookingTicketVO);

			for (FlightDataVO flightDataVO : dairList) {
				/* System.out.println(flightDataVO.getAirlineNm()); */
				flightDataVO.setDepTime(flightDataVO.getDepPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getDepPlandTime().substring(10));
				flightDataVO.setArrTime(flightDataVO.getArrPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getArrPlandTime().substring(10));
			}

			for (int i = -5; i < 6; i++) { // ????????? ??? -5??? ?????? 5??? ?????????
				LocalDateTime ofDateTime = LocalDateTime.of(Integer.parseInt(date.substring(6)),
						Integer.parseInt(date.substring(0, 2)), Integer.parseInt(date.substring(3, 5)), 00, 00);
				LocalDateTime tomorrow = ofDateTime.plusDays(i);
				String day = tomorrow.toString();

				BookingTicketVO dep = new BookingTicketVO();
				dep.setDay(day.substring(8, 10));
				dep.setMonth(day.substring(5, 7));
				dep.setYear(day.substring(0, 4));

				// 2020-01-15T00:00
				ddates.add(dep);
			}

		} else {

			ddate = date.substring(6, 10) + date.substring(0, 2) + date.substring(3, 5);
			bookingTicketVO.setDepStartTime(ddate);
			dairList = bookingService.airList(bookingTicketVO);

			for (FlightDataVO flightDataVO : dairList) {
				flightDataVO.setDepTime(flightDataVO.getDepPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getDepPlandTime().substring(10));
				flightDataVO.setArrTime(flightDataVO.getArrPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getArrPlandTime().substring(10));
			}

			//
			String depLoc = bookingTicketVO.getDepLoc();
			String arrLoc = bookingTicketVO.getArrLoc();

			bookingTicketVO.setDepLoc(arrLoc);
			bookingTicketVO.setArrLoc(depLoc);

			adate = date.substring(19) + date.substring(13, 15) + date.substring(16, 18);
			bookingTicketVO.setDepStartTime(adate);
			aairList = bookingService.airList(bookingTicketVO);

			for (FlightDataVO flightDataVO : aairList) {
				flightDataVO.setDepTime(flightDataVO.getDepPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getDepPlandTime().substring(10));
				flightDataVO.setArrTime(flightDataVO.getArrPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getArrPlandTime().substring(10));
			}

			for (int i = -5; i < 6; i++) { // ????????? ??? -5??? ?????? 5??? ?????????
				LocalDateTime ofDateTime = LocalDateTime.of(Integer.parseInt(date.substring(6, 10)),
						Integer.parseInt(date.substring(0, 2)), Integer.parseInt(date.substring(3, 5)), 00, 00);
				LocalDateTime tomorrow = ofDateTime.plusDays(i);
				String day = tomorrow.toString();

				BookingTicketVO dep = new BookingTicketVO();
				dep.setDay(day.substring(8, 10));
				dep.setMonth(day.substring(5, 7));
				dep.setYear(day.substring(0, 4));

				// 2020-01-15T00:00
				ddates.add(dep);

				LocalDateTime ofDateTime2 = LocalDateTime.of(Integer.parseInt(date.substring(19)),
						Integer.parseInt(date.substring(13, 15)), Integer.parseInt(date.substring(16, 18)), 00, 00);
				LocalDateTime tomorrow2 = ofDateTime2.plusDays(i);
				String day2 = tomorrow2.toString();

				BookingTicketVO arr = new BookingTicketVO();
				arr.setDay(day2.substring(8, 10));
				arr.setMonth(day2.substring(5, 7));
				arr.setYear(day2.substring(0, 4));

				// 2020-01-15T00:00
				adates.add(arr);
			}

			bookingTicketVO.setDepLoc(depLoc);
			bookingTicketVO.setArrLoc(arrLoc);

		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("bookingVO", bookingTicketVO);
		mv.addObject("Dlist", ddates);
		mv.addObject("Alist", adates);
		mv.addObject("DairList", dairList);
		mv.addObject("AairList", aairList);
		mv.addObject("today", today);
		mv.setViewName("booking/bookingList");

		return mv;
	}

	@GetMapping("dateSelect")
	public ModelAndView dateSelect(BookingTicketVO bookingTicketVO) throws Exception {

		List<FlightDataVO> dairList = new ArrayList<FlightDataVO>();
		List<FlightDataVO> aairList = new ArrayList<FlightDataVO>();

		String date = bookingTicketVO.getYear().substring(0, 4) + bookingTicketVO.getMonth().substring(0, 2)
				+ bookingTicketVO.getMonth().substring(4, 6); //
		bookingTicketVO.setDepStartTime(date);

		dairList = bookingService.airList(bookingTicketVO);
		for (FlightDataVO flightDataVO : dairList) {
			flightDataVO.setDepTime(flightDataVO.getDepPlandTime().substring(8, 10) + ":"
					+ flightDataVO.getDepPlandTime().substring(10));
			flightDataVO.setArrTime(flightDataVO.getArrPlandTime().substring(8, 10) + ":"
					+ flightDataVO.getArrPlandTime().substring(10));
		}

		if (bookingTicketVO.getKind().equals("??????")) {
			aairList = bookingService.airList(bookingTicketVO);
			for (FlightDataVO flightDataVO : aairList) {
				flightDataVO.setDepTime(flightDataVO.getDepPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getDepPlandTime().substring(10));
				flightDataVO.setArrTime(flightDataVO.getArrPlandTime().substring(8, 10) + ":"
						+ flightDataVO.getArrPlandTime().substring(10));
			}
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("bookingVO", bookingTicketVO);
		mv.addObject("DairList", dairList);
		mv.addObject("AairList", aairList);
		mv.setViewName("booking/common/dateList");

		return mv;
	}

	@GetMapping("bookingList")
	public void bookingList() throws Exception {

	}

	@PostMapping("bookingWritePre")
	public String bookingWritePre(BookingTicketVO bookingTicketVO) throws Exception {
		FlightDataVO flightDataVO = new FlightDataVO();
		flightDataVO.setFnum(bookingTicketVO.getDepFnum());
		bookingTicketVO.setDepInfo(bookingService.oneSelect(flightDataVO));

		System.out.println(bookingTicketVO.getDepInfo().getAirlineNm() + "(???)??? ???????????????.");
		switch (bookingTicketVO.getDepInfo().getAirlineNm()) {

		case "????????????":
			return "redirect:https://www.koreanair.com/kr/ko";
		case "??????????????????":
			return "redirect:https://flyasiana.com/C/KR/KO/index";
		case "????????????":
			return "redirect:https://www.airbusan.com/content/individual/?";
		case "????????????":
			return "redirect:https://flyairseoul.com/CW/ko/main.do";
		case "???????????????":
			return "redirect:https://www.eastarjet.com/newstar/PGWHC00001?lang=KR";
		case "????????????":
			return "redirect:https://www.jejuair.net/ko/main/base/index.do";
		case "??? ??????":
			return "redirect:https://www.jinair.com/booking/index";
		case "????????? ??????????????? ??????":
			return "redirect:http://www.keair.co.kr";
		case "???????????????":
			return "redirect:https://www.twayair.com/app/main";
		case "????????? ??????":
			return "redirect:https://flygangwon.com/ko/main/main.do";
		case "????????????":
			return "redirect:https://www.hi-airlines.com/";
		}
		return null;
	}

	/*
	 * @PostMapping("bookingWritePre") public ModelAndView
	 * bookingWritePre(BookingTicketVO bookingTicketVO) throws Exception {
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * FlightDataVO flightDataVO = new FlightDataVO();
	 * flightDataVO.setFnum(bookingTicketVO.getDepFnum());
	 * bookingTicketVO.setDepInfo(bookingService.oneSelect(flightDataVO));
	 * 
	 * if (bookingTicketVO.getKind().equals("??????")) {
	 * flightDataVO.setFnum(bookingTicketVO.getArrFnum());
	 * bookingTicketVO.setArrInfo(bookingService.oneSelect(flightDataVO)); }
	 * 
	 * 
	 * List<String> depTime = new ArrayList<String>();
	 * 
	 * String ddDate = bookingTicketVO.getDepInfo().getDepPlandTime(); String ddYear
	 * = ddDate.substring(0, 4); String ddMonth = ddDate.substring(4, 6); String
	 * ddDay = ddDate.substring(6, 8); String ddHour = ddDate.substring(8, 10);
	 * String ddMin = ddDate.substring(10);
	 * 
	 * String daDate = bookingTicketVO.getDepInfo().getArrPlandTime(); String daYear
	 * = daDate.substring(0, 4); String daMonth = daDate.substring(4, 6); String
	 * daDay = daDate.substring(6, 8); String daHour = daDate.substring(8, 10);
	 * String daMin = daDate.substring(10);
	 * 
	 * depTime.add(0, ddYear); depTime.add(1, ddMonth); depTime.add(2, ddDay);
	 * depTime.add(3, ddHour); depTime.add(4, ddMin);
	 * 
	 * depTime.add(5, daYear); depTime.add(6, daMonth); depTime.add(7, daDay);
	 * depTime.add(8, daHour); depTime.add(9, daMin);
	 * 
	 * if (bookingTicketVO.getKind().equals("??????")) { List<String> arrTime = new
	 * ArrayList<String>();
	 * 
	 * String adDate = bookingTicketVO.getArrInfo().getDepPlandTime(); String adYear
	 * = adDate.substring(0, 4); String adMonth = adDate.substring(4, 6); String
	 * adDay = adDate.substring(6, 8); String adHour = adDate.substring(8, 10);
	 * String adMin = adDate.substring(10);
	 * 
	 * String aaDate = bookingTicketVO.getArrInfo().getArrPlandTime(); String aaYear
	 * = aaDate.substring(0, 4); String aaMonth = aaDate.substring(4, 6); String
	 * aaDay = aaDate.substring(6, 8); String aaHour = aaDate.substring(8, 10);
	 * String aaMin = aaDate.substring(10);
	 * 
	 * arrTime.add(0, adYear); arrTime.add(1, adMonth); arrTime.add(2, adDay);
	 * arrTime.add(3, adHour); arrTime.add(4, adMin);
	 * 
	 * arrTime.add(5, aaYear); arrTime.add(6, aaMonth); arrTime.add(7, aaDay);
	 * arrTime.add(8, aaHour); arrTime.add(9, aaMin);
	 * 
	 * mv.addObject("arr", arrTime); }
	 * 
	 * mv.addObject("dep", depTime); mv.addObject("bTVO", bookingTicketVO);
	 * mv.setViewName("/booking/bookingWrite");
	 * 
	 * return mv; }
	 */

	@GetMapping("bookingWrite")
	public void bookingWrite() throws Exception {
	}

	@PostMapping("bookingWrite")
	public ModelAndView bookingWrite(BookingTicketVO bookingTicketVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		// bpnum ?????? ?????? List
		List<Integer> numList = new ArrayList<Integer>();

		MembersVO memberVO = new MembersVO();
		memberVO = (MembersVO) session.getAttribute("member");

		// id
		String id = memberVO.getId();

		/// bookingNum ?????????
		String bookingNum = "";
		bookingNum = bookingService.bookNum();
		bookingTicketVO.setBookingNum(bookingNum);

		//
		String flightBNum = "";

		for (BookingTicketVO a : bookingTicketVO.getAdultList()) {
			System.out.println(a.getMemberNum());
		}

		// ??????
		if (bookingTicketVO.getAdultList() != null) {
			for (BookingTicketVO adult : bookingTicketVO.getAdultList()) {
				System.out.println("dd");
				System.out.println(adult.getGender());
				System.out.println(adult.getMemberNum());

				adult.setBookingNum(bookingNum);
				adult.setId(id);
				/* adult.setMemberNum(adult.getMemberNum()); */

				System.out.println("????????????");
				System.out.println(adult.getMemberNum());

				String kind = "??????";
				if (bookingTicketVO.getKind().equals("??????")) {
					kind = "??????";
					adult.setArrFnum(bookingTicketVO.getArrFnum());
				}
				adult.setKind(kind);

				adult.setAdult(1);
				adult.setDepFnum(bookingTicketVO.getDepFnum());

				FlightDataVO flightDataVO = new FlightDataVO();
				flightDataVO.setFnum(bookingTicketVO.getDepFnum());
				adult.setDepInfo(bookingService.oneSelect(flightDataVO));

				bookingTicketVO.setDepInfo(bookingService.oneSelect(flightDataVO));

				adult.setResEmail(bookingTicketVO.getResEmail());
				adult.setResECheck(bookingTicketVO.getResECheck());

				// ???????????? ??????
				bookingTicketVO.setResPhone(bookingTicketVO.getResPhone().replace("-", ""));
				adult.setResPhone(bookingTicketVO.getResPhone());
				adult.setResPCheck(bookingTicketVO.getResPCheck());

				adult.setName(adult.getLastName().toUpperCase() + " " + adult.getFirstName().toUpperCase());

				if (adult.getMonth().length() == 1) {
					adult.setMonth("0" + adult.getMonth());
				}
				if (adult.getDay().length() == 1) {
					adult.setDay("0" + adult.getDay());
				}
				adult.setBirth(adult.getYear() + adult.getMonth() + adult.getDay());

				// booking insert
				bookingService.bookingInsert(adult);

				// ??????
				bookingService.priceCount(adult);
				adult = bookingService.priceCount(adult);

				// bookingPrice Insert
				adult.getDepPriceVO().setBookingNum(bookingNum);
				adult.getDepPriceVO().setBnum(adult.getBnum());

				adult.getDepPriceVO().setMemberNum(adult.getMemberNum());
				adult.getDepPriceVO().setId(id);

				bookingService.priceInsertOne(adult.getDepPriceVO());
				numList.add(adult.getDepPriceVO().getBpnum());

				if (bookingTicketVO.getKind().equals("??????")) {

					int dep = adult.getDepFnum();
					int arr = adult.getArrFnum();
					adult.setDepFnum(arr);
					adult.setArrFnum(dep);

					flightDataVO = new FlightDataVO();

					flightDataVO.setFnum(adult.getDepFnum());
					adult.setArrInfo(bookingService.oneSelect(flightDataVO));
					bookingTicketVO.setArrInfo(bookingService.oneSelect(flightDataVO));

					adult.setBnum(null);

					// booking insert
					bookingService.bookingInsert(adult);

					// ??????
					adult.setDepFnum(dep);
					adult.setArrFnum(arr);
					adult = bookingService.priceCount(adult);

					// bookingPrice Insert
					adult.getArrPriceVO().setBookingNum(bookingNum);
					adult.getArrPriceVO().setBnum(adult.getBnum());

					adult.getArrPriceVO().setMemberNum(adult.getMemberNum());
					adult.getArrPriceVO().setId(id);

					bookingService.priceInsertOne(adult.getArrPriceVO());
					numList.add(adult.getArrPriceVO().getBpnum());

				}
			} // ?????? ????????? ???
		} // ?????? ???

		// ?????????
		if (bookingTicketVO.getChildList() != null) {
			for (BookingTicketVO child : bookingTicketVO.getChildList()) {
				child.setBookingNum(bookingNum);
				child.setId(id);
				/* child.setMemberNum(child.getMemberNum()); */

				String kind = "??????";
				if (bookingTicketVO.getKind().equals("??????")) {
					kind = "??????";
					child.setArrFnum(bookingTicketVO.getArrFnum());
				}
				child.setKind(kind);

				child.setChild(1);
				child.setDepFnum(bookingTicketVO.getDepFnum());

				FlightDataVO flightDataVO = new FlightDataVO();
				flightDataVO.setFnum(bookingTicketVO.getDepFnum());
				child.setDepInfo(bookingService.oneSelect(flightDataVO));
				bookingTicketVO.setDepInfo(bookingService.oneSelect(flightDataVO));

				// flightnum ????????? ?????????
				child.setResEmail(bookingTicketVO.getResEmail());
				child.setResECheck(bookingTicketVO.getResECheck());

				// ???????????? ??????
				bookingTicketVO.setResPhone(bookingTicketVO.getResPhone().replace("-", ""));
				child.setResPhone(bookingTicketVO.getResPhone());
				child.setResPCheck(bookingTicketVO.getResPCheck());

				child.setName(child.getLastName().toUpperCase() + " " + child.getFirstName().toUpperCase());

				if (child.getMonth().length() == 1) {
					child.setMonth("0" + child.getMonth());
				}
				if (child.getDay().length() == 1) {
					child.setDay("0" + child.getDay());
				}
				child.setBirth(child.getYear() + child.getMonth() + child.getDay());

				// booking insert
				bookingService.bookingInsert(child);

				// ??????
				child = bookingService.priceCount(child);

				// bookingPrice Insert
				child.getDepPriceVO().setBookingNum(bookingNum);
				child.getDepPriceVO().setBnum(child.getBnum());

				child.getDepPriceVO().setMemberNum(child.getMemberNum());
				child.getDepPriceVO().setId(id);

				bookingService.priceInsertOne(child.getDepPriceVO());
				numList.add(child.getDepPriceVO().getBpnum());

				// ????????????
				if (bookingTicketVO.getKind().equals("??????")) {
					// flightnum ????????? ?????????
					int dep = child.getDepFnum();
					int arr = child.getArrFnum();
					child.setDepFnum(arr);
					child.setArrFnum(dep);

					flightDataVO = new FlightDataVO();

					flightDataVO.setFnum(child.getDepFnum());
					child.setArrInfo(bookingService.oneSelect(flightDataVO));
					bookingTicketVO.setArrInfo(bookingService.oneSelect(flightDataVO));

					child.setBnum(null);

					// booking insert
					bookingService.bookingInsert(child);

					// ??????
					child.setDepFnum(dep);
					child.setArrFnum(arr);
					child = bookingService.priceCount(child);

					// bookingPrice Insert
					child.getArrPriceVO().setBookingNum(bookingNum);
					child.getArrPriceVO().setBnum(child.getBnum());

					child.getArrPriceVO().setMemberNum(child.getMemberNum());
					child.getArrPriceVO().setId(id);

					bookingService.priceInsertOne(child.getArrPriceVO());
					numList.add(child.getArrPriceVO().getBpnum());
				}
			} // ????????? ????????? ???
		} // ????????? ???

		mv.addObject("bVO", bookingTicketVO);
		mv.addObject("alist", bookingTicketVO.getAdultList());
		mv.addObject("clist", bookingTicketVO.getChildList());
		mv.addObject("numList", numList);
		mv.addObject("milplus", bookingTicketVO.getAdultList().get(0).getDepPriceVO().getMileagePlus());
		mv.setViewName("booking/bookingCheck");

		return mv;
	}

	@GetMapping("bookingCheck")
	public void bookingCheck() {
	}

	// ???????????? ?????? : booking write?????? ??????
	@ResponseBody
	@GetMapping("searchm")
	public String searchm(MembersVO membersVO) throws Exception {

		membersVO = bookingService.searchMember(membersVO);

		if (membersVO != null) {
			return membersVO.getMemberNum();
		} else {
			return "0";
		}

	}

}