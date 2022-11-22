package com.airline.a1.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.airline.a1.boardUtil.Pager;

@Repository
@Mapper
public interface CardProductsMapper {
	
public int productWrite(CardProductsVO productVO)throws Exception;	
	
	public List<CardProductsBoardVO> productList(Pager pager)throws Exception;
	
	public List<CardProductsBoardVO> subProductList(Pager pager)throws Exception;
	
	public List<CardProductsVO> adminProductList()throws Exception;

	public int productCount(Pager pager)throws Exception;
	
	public int productCount2(Pager pager)throws Exception;
	
	public CardProductsVO productSelect(CardProductsVO productVO)throws Exception;
	
	public CardProductsVO subProductSelect(CardProductsVO productVO)throws Exception;
	
	public void productHit(int num)throws Exception;
	
	public int productUpdate(CardProductsBoardVO cardprodutsboardVO)throws Exception;
	
	public int productDelete(CardProductsVO productVO)throws Exception;
	
	/* public List<BoardVO> listView(NoticeVO noticeVO)throws Exception; */
	
	public CardProductsVO prev(CardProductsVO productVO)throws Exception;
	
	public CardProductsVO next(CardProductsVO productVO)throws Exception;
	
	 
}
