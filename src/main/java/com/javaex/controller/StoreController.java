package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.StoreService;
import com.javaex.vo.QnaVo;

@Controller
@RequestMapping(value="/store")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	//스토어 상품 리스트
	@RequestMapping(value="/list")
	public String list() {
		System.out.println("[StoreController] list()");
		
		return "store/storeList";
	}
	
	//스토어 상품 상세페이지 (read?키=값)
	@RequestMapping(value="/read")
	public String read() {
		System.out.println("[Controller] read()");
		
		return "store/storeProducts";
	}
	
	
	//스토어 결제 페이지(jsp수정필요)
	@RequestMapping(value="/stopay")
	public String stopay() {
		System.out.println("[Controller] stopay()");
		
		return "store/storePayment";
	}
	
	//상품상세 - qna 작성폼
	@RequestMapping(value="/qnaForm")
	public String qnaForm() {
		System.out.println("[Controller] qnaForm()");
		
		return"store/storeQna";
	}
	
	//상품상세 - qna 작성하기
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite(@RequestParam("file") MultipartFile file,
						   @ModelAttribute QnaVo qnaVo) {
		System.out.println("[Controller] qnaWrite()");
		
		//System.out.println(file.getOriginalFilename());
		//System.out.println(qnaVo.toString());
		
		storeService.qnaWrite(qnaVo, file);
		
		
		return "";
	}

}
