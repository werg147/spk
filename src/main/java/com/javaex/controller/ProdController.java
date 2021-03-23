package com.javaex.controller;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.javaex.service.ProdService;
import com.javaex.vo.ProductVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/mypage/prod")
public class ProdController {

	@Autowired
	private ProdService prodservice;

	// 상품관리페이지
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodList(Model model,
						   HttpSession session) {
		// 리스트 추후작업하기
		System.out.println("[cnt]상품관리페이지");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		List<ProductVo> prodList = prodservice.prodList(authUser);
		model.addAttribute("prodList", prodList);

		return "mypage/mypage_prod/prod_manage";
	}
	
	//상품정보 수정하기
	
	@RequestMapping(value = "/prodmodify", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodModify(@RequestParam ("prod_no") String prod_no,
							  Model model){
		System.out.println("[cnt]상품정보 수정하기" + prod_no);	
		ProductVo prodvo = prodservice.selectPord(prod_no);
		
		model.addAttribute("prodvo", prodvo);
		
		return "mypage/mypage_prod/prod_modify_form";
	}

	// 상품등록페이지
	@RequestMapping(value = "/form", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodForm() {
		System.out.println("[cnt]상품등록페이지");
		
		return "mypage/mypage_prod/prod_form";
	}


	//상품등록
	@ResponseBody
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodWrite(@RequestParam("mainfile") MultipartFile mainfile,
						  @RequestParam("subfile") MultipartFile[] subfile,
						  @RequestParam("detailfile") MultipartFile detailfile,
						 @ModelAttribute ProductVo prodvo) {
		
		System.out.println("[cnt]상품등록" + prodvo + "mainfile" + mainfile + "subfile" + subfile + "detailfile" + detailfile);
		
		prodservice.prodWrite(prodvo, mainfile, subfile, detailfile);
		System.out.println("[cnt]상품등록완료");
		return prodvo.getProd_no();
	}
	
	// 상품사이즈등록
	@ResponseBody
	@RequestMapping(value = "/sizewrite", method = { RequestMethod.GET, RequestMethod.POST })
	public int prodSizeWrite(@RequestBody ProductVo prodvo){

		System.out.println("[cnt]상품사이즈등록" + prodvo);	
		return prodservice.prodSizeWrite(prodvo);	

	}



	// 드롭다운 예제파일 실행
	@RequestMapping(value = "/exam", method = { RequestMethod.GET, RequestMethod.POST })
	public String exam() {

		return "mypage/mypage_seller/seller_profit";
	}
}
