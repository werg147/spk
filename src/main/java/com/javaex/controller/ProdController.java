package com.javaex.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javaex.service.ProdService;
import com.javaex.vo.ProductVo;

@Controller
@RequestMapping(value = "/mypage/prod")
public class ProdController {

	@Autowired
	private ProdService prodservice;

	// 상품관리페이지
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodList() {
		// 리스트 추후작업하기
		System.out.println("[cnt]상품관리페이지");
		return "mypage/mypage_prod/prod_manage";

	}

	// 상품등록페이지
	@RequestMapping(value = "/form", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodForm() {
		System.out.println("[cnt]상품등록페이지");
		return "mypage/mypage_prod/prod_form";
	}

	// 상품등록
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public void prodWrite(@ModelAttribute ProductVo prodvo, 
			@RequestParam("file") MultipartFile file,
			Model model) {
		System.out.println("[cnt]상품등록" + prodvo + file);

		prodservice.prodWrite(file, prodvo);

		
	}

	// 상품이미지등록

	@RequestMapping(value = "/imgwrite", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodImgWrite(MultipartHttpServletRequest request) {
		System.out.println("[cnt]상품이미지등록");
		System.out.println();
		prodservice.prodImgWrite(request);
		return "mypage/mypage_prod/prod_manage";
     
	       }
	         



	// 드롭다운 예제파일 실행
	@RequestMapping(value = "/exam", method = { RequestMethod.GET, RequestMethod.POST })
	public String exam() {

		return "main/loginform";
	}
}
