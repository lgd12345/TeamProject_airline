package com.airline.a1.search;

import java.sql.Date;

import org.jsoup.select.Elements;

import lombok.Data;

@Data
public class CardProductsBoardVO {
	private int num;
	private String cate;
	private String product;
	private String writer;
	private String contents;
	private Date regDate;
	private int hit;
	private String productExp;
	private String fix;


}
