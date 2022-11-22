package com.airline.a1.board2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface Notice2FilesMapper {

		public int notice2FileWrite(List<Notice2FilesVO> notice2FilesVOs)throws Exception;
		
		public List<Notice2FilesVO> notice2FileList(int num)throws Exception;
		
		public Notice2FilesVO notice2FileSelect(Notice2FilesVO notice2FilesVO)throws Exception;
		
		public int notice2FileDelete(Notice2FilesVO notice2FilesVO)throws Exception;
		 
		
}
