package com.airline.a1.board2;




import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.airline.a1.board2Util.Pager2;

@Repository
@Mapper
public interface Notice2Mapper {
	
	public int notice2Write(Notice2VO notice2VO)throws Exception;
	
	public int notice2Write1(Notice2VO notice2VO)throws Exception;	
	
	public List<Board2VO> notice2List(Pager2 pager2)throws Exception;
	
	public List<Board2VO> subNotice2List(Pager2 pager2)throws Exception;
	
	public List<Notice2VO> adminNotice2List()throws Exception;
	
	public int notice2Count(Pager2 pager2)throws Exception;
	
	public int notice2Count2(Pager2 pager2)throws Exception;
	
	public Notice2VO notice2Select(Notice2VO notice2VO)throws Exception;
	
	public Notice2VO notice2Select1(Notice2VO notice2VO)throws Exception;
	
	public Notice2VO subNotice2Select(Notice2VO notice2VO)throws Exception;
	
	public void notice2Hit(int num)throws Exception;
	
	public int notice2Update(Board2VO board2VO)throws Exception;
	
	public int notice2Update1(Board2VO board2VO)throws Exception;
	
	public int notice2Delete(Notice2VO notice2VO)throws Exception;
	
	/* public List<Board2VO> listView(Notice2VO notice2VO)throws Exception; */
	
	public Notice2VO prev(Notice2VO notice2VO)throws Exception;
	
	public Notice2VO next(Notice2VO notice2VO)throws Exception;
	
	
}
