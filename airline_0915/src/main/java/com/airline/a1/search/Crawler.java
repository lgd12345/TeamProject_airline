package com.airline.a1.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import com.airline.a1.search.CardProductsBoardVO;

@Controller
public class Crawler {
	private static Logger logger = LoggerFactory.getLogger(Crawler.class);

	@ResponseBody
	@RequestMapping(value = "crawling.do", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getCrawling() {
		logger.info("크롤리잉" + new Date());

		Document doc;
		String gson = "";

		String LOsite = "https://www.lottecard.co.kr/app/LPSCHBA_V200.lc?searchText="; // 검색키워드 : 대한항공, 아시아나항공

		String BCsite = "https://www.bccard.com/app/card/UnifSrch.do?retKey=Card&query=";

		try {
			// BC카드 = 'https://www.bccard.com/app/card/UnifSrch.do?retKey=Card&query=' +
			// '항공사'
			doc = Jsoup.connect(
					"https://www.lottecard.co.kr/app/LPSCHBA_V200.lc?searchText=%EB%8C%80%ED%95%9C%ED%95%AD%EA%B3%B5")
					.get();
			/* Elements */
			// 반복문
			Elements products = doc.select(
					"#container > div.inner.searchResult > div.searchResult > ul.resultList.card > li > div > a");
			logger.info("products" + products);

			Elements productExps = doc.select(
					"#container > div.inner.searchResult > div.searchResult > ul.resultList.card > li > div > p");
			logger.info("productExp" + productExps);

			Elements imgs = doc.select(
					"#container > div.inner.searchResult > div.searchResult > ul.resultList.card > li > span > a > img");
			logger.info("img" + imgs);

//			 에그 그레이트로 변경 되었음.
//			 Elements likes = doc.select(".count strong>i");
//			 logger.info("counts" + likes);

			/*
			 * Elements likes = doc.select(".egg-gage > span.percent");
			 * logger.info("egg great==================" + likes);
			 */
			List<CardProductsBoardVO> list = new ArrayList<CardProductsBoardVO>();

			CardProductsBoardVO vo = null;

			logger.info("products==================" + products.get(0).text());

			for (int i = 0; i < products.size(); i++) {
				/*
				 * vo = new CardProductListVO();
				 * 
				 * vo.setCardName("롯데카드"); vo.setAirlineName("대한항공");
				 * vo.setCardProduct(productText); vo.setCardProductExp(productExpText);
				 * vo.setFname(imgSrc);
				 * 
				 * list.add(vo);
				 */
				 

				String productText = products.get(i).text();
				String imgSrc = imgs.get(i).attr("src");
				String productExpText = productExps.get(i).text();
				
				
				/* String like = likes.get(i).text(); */
				int seq = i;
				CardProductsBoardVO productsList = new CardProductsBoardVO(seq + 1, "롯데카드", "대한항공", productText,
						productExpText, imgSrc);

				
				 logger.info("반복문안에 내용 들어가는지 확인중 ===================="+productsList.toString());
				list.add(productsList);
			}
			 logger.info("리스트 안에 내용 확인 중 =============" + list);
			gson = new Gson().toJson(list);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return gson;
	}
}
