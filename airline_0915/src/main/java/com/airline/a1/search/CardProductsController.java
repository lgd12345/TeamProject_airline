package com.airline.a1.search;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.airline.a1.board.NoticeFilesVO;
import com.airline.a1.board.NoticeVO;
import com.airline.a1.boardUtil.Pager;

@Controller
@RequestMapping("cardProduct")
public class CardProductsController {

	@Autowired
	private CardProductsService productService;


	@ModelAttribute(name = "product")
	public CardProductsVO getProducts() throws Exception {
		return new CardProductsVO();
	}

	@RequestMapping(value = "/productList", method =  RequestMethod.POST)
	public String productlist(@RequestParam("cardTypeSelect") String cardName,
			@RequestParam("airlineTypeSelect") String arilineName, Model model)
	{ 	
		  System.out.println("테스트입니다."); 
		  System.out.println(arilineName+"arilineName@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		  System.out.println(model+"model@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		  System.out.println(cardName+"cardName@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 
		  
		
		model.addAttribute("cardName", cardName);
		model.addAttribute("arilineName", arilineName);

		return "/cardProduct/productList";
	}

	/*
	 * @PostMapping(value = "/productList") public String
	 * productlist(@RequestParam("cardTypeSelect") String
	 * cardName,@RequestParam("airlineTypeSelect") String arilineName, Model model)
	 * { System.out.println("테스트입니다."); System.out.println(arilineName+
	 * "arilineName@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	 * System.out.println(model+"model@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	 * System.out.println(cardName+
	 * "cardName@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	 * 
	 * 
	 * model.addAttribute("cardName", cardName); model.addAttribute("arilineName",
	 * arilineName);
	 * 
	 * return "/cardProduct/productList"; }
	 */
	
	
	// 메뉴에서 '카드조회' 클릭 시 페이지로 이동
	@RequestMapping(path = "/productPage", method = RequestMethod.GET)
	public Object productList() throws Exception {

		return "/cardProduct/productPage";
	}

	/*
	 * @GetMapping("productSearchPage") public void productSearchPage(Model model)
	 * throws Exception{ List<CardProductsVO> ar =
	 * productService.adminProductList(); model.addAttribute("board", "notice");
	 * model.addAttribute("list", ar); }
	 */

	/**** summerNote ****/

	@PostMapping(value = "summerfileDelete")
	public ModelAndView summerfileDelete(String file, HttpSession session) throws Exception {
		boolean check = productService.summerfileDelete(file, session);
		String result = "Delete Fail";
		if (check) {
			result = "Delete Success";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cardProduct/common/common_ajaxResult");
		mv.addObject("result", result);
		return mv;
	}

	@PostMapping(value = "summerFile")
	public ModelAndView summerFile(MultipartFile file, HttpSession session) throws Exception {
		System.out.println("ddd1123123213");
		String fileName = productService.summerfile(file, session);
		// System.out.println(file.getOriginalFilename()); test
		ModelAndView mv = new ModelAndView();

		mv.setViewName("cardProduct/common/common_ajaxResult");
		mv.addObject("result", fileName);
		return mv;
	}

	/**** File ****/
	@PostMapping(value = "productFileDelete")
	public ModelAndView productFileDelete(CardProductsFilesVO productFilesVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.ProductFileDelete(productFilesVO);
		mv.setViewName("board/common/common_ajaxResult");
		mv.addObject("result", result);

		return mv;
	}

	/**** ProductWrite ****/

	@GetMapping("productWrite")
	public ModelAndView noticeWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "product");
		mv.setViewName("cardProduct/productboardWrite");

		return mv;
	}

	@PostMapping("productWrite")
	public ModelAndView productWrite(CardProductsVO productVO, MultipartFile[] file) throws Exception {

		ModelAndView mv = new ModelAndView();
		int result = productService.productWrite(productVO, file);

		String msg = "작성에 실패하였습니다.다시 작성해주세요.";
		String path = "../admin/admin5_1";

		if (result > 0) {

			msg = "작성되었습니다.";
		}

		mv.setViewName("cardProduct/common/result");
		mv.addObject("message", msg);
		mv.addObject("path", path);

		return mv;
	}

	/**** ProductWrite ****/
	@GetMapping("productWrite2")
	public ModelAndView productWrite2() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "product");
		mv.setViewName("cardProduct/productboardWrite");
		return mv;
	}

	@PostMapping("productWrite2")
	public ModelAndView productWrite2(CardProductsVO productVO, MultipartFile[] file) throws Exception {

		ModelAndView mv = new ModelAndView();
		int result = productService.productWrite(productVO, file);
		String msg = "작성에 실패하였습니다.다시 작성해주세요.";
		String path = "./productList";

		if (result > 0) {

			msg = "작성되었습니다.";
		}
		mv.setViewName("cardProduct/common/result");
		mv.addObject("message", msg);
		mv.addObject("path", path);
		return mv;
	}

	/**** ProductList ****/

	@GetMapping("productList")
	public ModelAndView productList(Pager pager) throws Exception {
		List<CardProductsBoardVO> ar = productService.productList(pager);
		ModelAndView mv = new ModelAndView();
		int totalCount = productService.productCount(pager);

		mv.addObject("tc", totalCount);
		mv.addObject("board", "product");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("cardProduct/productList");

		return mv;
	}

	@GetMapping("productList1")
	public ModelAndView productList1(Pager pager) throws Exception {

		List<CardProductsBoardVO> ar = productService.subProductList(pager);
		ModelAndView mv = new ModelAndView();
		int totalCount = productService.productCount2(pager);

		mv.addObject("tc", totalCount);
		mv.addObject("board", "product");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/admin5_1");
		return mv;
	}

	/**** ProductSelect ****/

	@GetMapping("productSelect")
	public ModelAndView ProductSelect(CardProductsVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productVO = productService.productSelect(productVO);
		CardProductsVO productVO2 = productService.prev(productVO);
		CardProductsVO productVO3 = productService.next(productVO);
		/* List<BoardVO> ar =noticeService.listView(noticeVO); */

		productVO = productService.prev(productVO);

		mv.addObject("vo", productVO);
		mv.addObject("prev", productVO2);
		mv.addObject("next", productVO3);
		mv.addObject("board", "notice");
		mv.setViewName("cardProduct/productboardSelect");

		return mv;
	}

	/**** Product Update ****/

	@GetMapping("productUpdate")
	public ModelAndView productUpdate(CardProductsVO productVO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		productVO.setNum(productVO.getNum());
		productVO = productService.productSelect(productVO);

		mv.addObject("board", "product");
		mv.addObject("vo", productVO);
		mv.setViewName("cardProduct/productboardUpdate");

		return mv;
	}

	@PostMapping("productUpdate")
	public ModelAndView productUpdate(CardProductsVO productVO, MultipartFile[] file, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = productService.productUpdate(productVO, file, session);

		if (result > 0) {
			mv.addObject("message", "게시글이 수정되었습니다.");
		} else {
			mv.addObject("message", "수정에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "../admin/admin5_1");
		mv.setViewName("cardProduct/common/result");

		return mv;
	}

	/**** productDelete ****/

	@GetMapping("productDelete")
	public ModelAndView productDelete(CardProductsVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.productDelete(productVO);
		if (result > 0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		} else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "productList");
		mv.setViewName("cardProduct/common/result");

		return mv;
	}

	@GetMapping("productDelete2")
	public ModelAndView productDelete2(CardProductsVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.productDelete(productVO);
		if (result > 0) {
			mv.addObject("message", "게시글이 삭제되었습니다.");
		} else {
			mv.addObject("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
		}
		mv.addObject("path", "../admin/admin5_1");
		mv.setViewName("cardProduct/common/result");

		return mv;
	}

}
