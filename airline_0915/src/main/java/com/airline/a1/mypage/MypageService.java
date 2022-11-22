package com.airline.a1.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.a1.board2.Board2VO;
import com.airline.a1.board2.Notice2VO;
import com.airline.a1.board2Util.Pager2;
import com.airline.a1.booking.BookingPriceVO;
import com.airline.a1.booking.BookingTicketVO;
import com.airline.a1.checkIn.ETicketVO;
import com.airline.a1.checkIn.SeatVO;
import com.airline.a1.member.MembersVO;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mypageMapper;

	public List<ETicketVO> getBookingList(ETicketVO eTicketVO) throws Exception {
		return mypageMapper.getBookingList(eTicketVO);
	}

	public List<ETicketVO> getBookingMore(ETicketVO eTicketVO) throws Exception {
		return mypageMapper.getBookingMore(eTicketVO);
	}

	public List<SeatVO> getBookingMoreSeat(ETicketVO eTicketVO) throws Exception {
		return mypageMapper.getBookingMoreSeat(eTicketVO);
	}

	public int bookCancel(String bnum) throws Exception {
		return mypageMapper.bookCancel(bnum);
	}

	public List<BookingPriceVO> mtotal(MembersVO membersVO) throws Exception {
		return mypageMapper.mtotal(membersVO);
	}

	public int updateMember(MembersVO membersVO) throws Exception {
		return mypageMapper.updateMember(membersVO);
	}
	/* pager */
	public int notice22Count(Pager2 pager2) throws Exception {
		return mypageMapper.notice22Count(pager2);
	}

	/* 실패한것 */
	public List<Board2VO> notice22List(Pager2 pager2) throws Exception {
		pager2.makeRow();
		pager2.makePage(mypageMapper.notice22Count(pager2));
		return mypageMapper.notice22List(pager2);
	}
	/* 성공한것 */
	public List<Board2VO> notice33List(String id,Pager2 pager2) throws Exception {
		pager2.makeRow();
		pager2.makePage(mypageMapper.notice22Count(pager2));
		Map map = new HashMap();
		
		map.put("id", id); //가져온 데이터에 키와 벨류값을 지정
		map.put("page", pager2);
		System.out.println("notice2VO의 내용 ------============="+id);
		System.out.println("pager2의 내용 ------============="+pager2);

		
		return mypageMapper.notice44List(map);
	}
	/**** noticeSelect ****/

	public Notice2VO notice22Select(Notice2VO notice2VO) throws Exception {
		mypageMapper.notice22Hit(notice2VO.getNum());
		return mypageMapper.notice22Select(notice2VO);
	}
	public Notice2VO prev22(Notice2VO notice2VO) throws Exception {
		return mypageMapper.prev22(notice2VO);
	}

	public Notice2VO next22(Notice2VO notice2VO) throws Exception {
		return mypageMapper.next22(notice2VO);
	}

	public List<BookingTicketVO> bnumSearch(BookingTicketVO bookingTicketVO) throws Exception{
		return mypageMapper.bnumSearch(bookingTicketVO);
	}
	public List<BookingPriceVO> recentMileage(MembersVO membersVO) throws Exception {
		return mypageMapper.recentMileage(membersVO);
	}
}
