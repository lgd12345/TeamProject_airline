package com.airline.a1.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CardProductsFilesMapper {
	
	public int productFileWrite(List<CardProductsFilesVO> productsFilesVOs)throws Exception;
	
	public List<CardProductsFilesVO> productFileList(int num)throws Exception;
	
	public CardProductsFilesVO productFileSelect(CardProductsFilesVO productFilesVO)throws Exception;
	
	public int productFileDelete(CardProductsFilesVO productFilesVO)throws Exception;
	
	
	 
}
