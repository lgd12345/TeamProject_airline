package com.airline.a1.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.airline.a1.board2.Board2VO;
import com.airline.a1.board2.Notice2VO;
import com.airline.a1.board2Util.Pager2;
import com.airline.a1.booking.BookingPriceVO;
import com.airline.a1.booking.BookingTicketVO;
import com.airline.a1.checkIn.ETicketVO;
import com.airline.a1.checkIn.SeatVO;
import com.airline.a1.member.MembersVO;

@Mapper
public interface MypageMapper {
	// 예매리스트
	public List<ETicketVO> getBookingList(ETicketVO eTicketVO) throws Exception;

	// 예매리스트상세
	public List<ETicketVO> getBookingMore(ETicketVO eTicketVO) throws Exception;

	public List<SeatVO> getBookingMoreSeat(ETicketVO eTicketVO) throws Exception;

	public int bookCancel(String bnum) throws Exception;

	public List<BookingPriceVO> mtotal(MembersVO membersVO) throws Exception;

	public int updateMember(MembersVO membersVO) throws Exception;

	// 나의이용후기
	public List<Board2VO> notice22List(Pager2 pager2) throws Exception;

	public List<Board2VO> notice33List(String id, Pager2 pager2) throws Exception;

	public List<Board2VO> notice44List(Map map) throws Exception;

	public int notice22Count(Pager2 pager2) throws Exception;

	public void notice22Hit(int num) throws Exception;

	public Notice2VO notice22Select(Notice2VO notice2VO) throws Exception;

	public Notice2VO prev22(Notice2VO notice2VO) throws Exception;

	public Notice2VO next22(Notice2VO notice2VO) throws Exception;

	// 나의이용후기 끝

	public List<BookingTicketVO> bnumSearch(BookingTicketVO bookingTicketVO) throws Exception;

	public List<BookingPriceVO> recentMileage(MembersVO membersVO) throws Exception;

}
