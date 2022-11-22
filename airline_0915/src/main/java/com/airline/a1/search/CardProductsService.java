package com.airline.a1.search;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.airline.a1.boardUtil.FilePathGenerator;
import com.airline.a1.boardUtil.FileSaver;
import com.airline.a1.boardUtil.Pager;

@Transactional
@Service
public class CardProductsService {

	@Autowired
	private CardProductsMapper productMapper;
	@Autowired
	private CardProductsFilesMapper productfilesMapper;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private FilePathGenerator filePathGenerator;

	/**** File ****/

	public boolean summerfileDelete(String file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile_product");
		return fileSaver.fileDelete(realPath, file);
	}

	public String summerfile(MultipartFile file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile_product");
		return fileSaver.save(realPath, file);
	}

	public CardProductsFilesVO ProductFileSelect(CardProductsFilesVO productFilesVO) throws Exception {
		return productfilesMapper.productFileSelect(productFilesVO);
	}

	public int ProductFileDelete(CardProductsFilesVO productFilesVO) throws Exception {
		return productfilesMapper.productFileDelete(productFilesVO);
	}

	/**** noticeWrite ****/

	public int productWrite(CardProductsVO productVO, MultipartFile[] file) throws Exception {
		// file 유무검증
		boolean check = false;
		int result = productMapper.productWrite(productVO);
		
		return result;
	}

	/**** productList ****/

	public List<CardProductsBoardVO> productList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(productMapper.productCount(pager));
		return productMapper.productList(pager);
	}

	public List<CardProductsBoardVO> subProductList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(productMapper.productCount2(pager));
		return productMapper.subProductList(pager);
	}

	public List<CardProductsVO> adminProductList() throws Exception {
		return productMapper.adminProductList();
	}

	/* pager */
	public int productCount(Pager pager) throws Exception {
		return productMapper.productCount(pager);
	}

	public int productCount2(Pager pager) throws Exception {
		return productMapper.productCount2(pager);
	}

	/**** productSelect ****/

	public CardProductsVO productSelect(CardProductsVO productVO) throws Exception {
		productMapper.productHit(productVO.getNum()); 
		System.out.println("테스트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return productMapper.productSelect(productVO);
	}
	
	

	/*
	 * public List<BoardVO> listView(NoticeVO noticeVO)throws Exception{ return
	 * noticeMapper.listView(noticeVO); }
	 */

	public CardProductsVO prev(CardProductsVO productVO) throws Exception {
		return productMapper.prev(productVO);
	}

	public CardProductsVO next(CardProductsVO productVO) throws Exception {
		return productMapper.next(productVO);
	}

	/**** productUpdate ****/

	public int productUpdate(CardProductsVO productVO, MultipartFile[] file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/product");
		CardProductsFilesVO productFilesVO = new CardProductsFilesVO();
		productFilesVO.setNum(productVO.getNum());
		boolean check = false;
		int result = productMapper.productUpdate(productVO);

		if (file.length > 0) {
			for (MultipartFile multipartFile : file) {
				if (multipartFile.getSize() > 0) {
					check = true;
					break;
				}
			} // for끝

			if (check) {
				List<CardProductsFilesVO> productFilesVOs = new ArrayList<>();
				/* File file2 = filePathGenerator.getUseClassPathResource("board"); */

				for (MultipartFile multipartFile : file) {
					if (multipartFile.getSize() > 0) {
						String fileName = fileSaver.save(realPath, multipartFile);
						/* NoticeFilesVO noticeFilesVO = new NoticeFilesVO(); */
						productFilesVO.setNum(productVO.getNum());
						productFilesVO.setFname(fileName);
						productFilesVO.setOname(multipartFile.getOriginalFilename());
						productFilesVOs.add(productFilesVO);
					}
				}
				result = productfilesMapper.productFileWrite(productFilesVOs);
			}
		}
		return result;
	}

	/**** productDelete ****/

	public int productDelete(CardProductsVO productVO) throws Exception {
		return productMapper.productDelete(productVO);

	}

	
}
