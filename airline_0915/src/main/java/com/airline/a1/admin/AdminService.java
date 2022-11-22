package com.airline.a1.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.a1.booking.FlightDataVO;
import com.airline.a1.checkIn.ETicketVO;
import com.airline.a1.member.MembersVO;
import com.airline.a1.limo.LimoVO;



@Service
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	
	public List<AirlineVO> airlineList() throws Exception {
		return adminMapper.airlineList();	
	}
	
	public List<AirportVO> airportList() throws Exception {
		return adminMapper.airportList();	
	}
	
	public List<FlightDataVO> airpartList(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.airpartList(flightDataVO);
	}
	
	public List<FlightDataVO> airallList() throws Exception {
		return adminMapper.airallList();
	}
	public List<ETicketVO> getBookingInfo() throws Exception {
		return adminMapper.getBookingInfo();
	}

	public List<MembersVO> getMemberList() throws Exception{
		return adminMapper.getMemberList();
	}
	
	public List<MembersVO> noticeDelete() throws Exception{
		return adminMapper.getMemberList();
	}
	
	// 새로 만든 메소드???

	public List<MembersVO> adminDelete() throws Exception{
		return adminMapper.getMemberList();
	}
	
	//전체매출
	public List<FlightDataVO> saleterm(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.saleterm(flightDataVO);
	}

	public List<FlightDataVO> saletermAir(FlightDataVO flightDataVO) throws Exception {

		return adminMapper.saletermAir(flightDataVO);
	}
	
	public List<FlightDataVO> airportpartList(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.airportpartList(flightDataVO);
	}
	
	public Integer tprice(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.tprice(flightDataVO);
	}
	
	public Double trate(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.trate(flightDataVO);
	}

	public Integer ftotal(FlightDataVO flightDataVO) throws Exception {
		return adminMapper.ftotal(flightDataVO);

	}
	
	public Integer limoSum(String airport) throws Exception{
		return adminMapper.limoSum(airport);
	}

	public Integer limoTotalSum()throws Exception{
		return adminMapper.limoTotalSum();
	}

	public Integer limoTotalPerson(String airport)throws Exception{
		return adminMapper.limoTotalPerson(airport);
	}

	public Integer personSum() throws Exception{
		return adminMapper.personSum();
	}

	public Integer todaySum(String airport)throws Exception{
		return adminMapper.todaySum(airport);
	}

	public Integer limoTodaySum() throws Exception{
		return adminMapper.limoTodaySum();
	}
	
	public List<LimoVO> limoMember()throws Exception{
		return adminMapper.limoMember();
	}
}
