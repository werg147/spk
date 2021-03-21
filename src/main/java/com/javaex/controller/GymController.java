package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.GymService;
import com.javaex.vo.GymVo;

@Controller
@RequestMapping(value="/mypage/book", method= {RequestMethod.GET , RequestMethod.POST})
public class GymController {
	
	@Autowired
	private GymService gymService;
	
	//체육관 관리
	@RequestMapping(value="/gym", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymInfo(@RequestParam("gymno") int gymno, Model model) { 
		//사업자번호를 조건으로 체육관을 리스트로 가져온 후 각탭에 체육관 번호 넣기
		System.out.println("[GymController] gymInfo()");
		
		model.addAttribute("gymMap", gymService.gymInfo(gymno));
		/*
		GymVo gymVo = gymService.gymInfo(gymno);
		System.out.println(gymVo);
		model.addAttribute("gymVo", gymVo);
		*/
		return "mypage/mypage_resrvation/mypage_gyminfo";
	}
	
	//체육관 등록폼
	@RequestMapping(value="/gymaddform", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymAddForm() {
		System.out.println("[GymController] gymAddForm()");
		
		return "mypage/mypage_resrvation/mypage_gymadd";
	}
	
	//체육관 등록
	@RequestMapping(value="/gymadd", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymAdd(@ModelAttribute GymVo gymVo,
					@RequestParam("conve") List<String> conve,
					@RequestParam(value="file", required=false) MultipartFile file) { //사업자번호 추후 세션으로 추가
		System.out.println("[GymController] gymAdd()");
		System.out.println(gymVo);
		System.out.println(conve);
				
		gymService.gymAdd(gymVo, conve, file);
		
		return "";
	}
}
