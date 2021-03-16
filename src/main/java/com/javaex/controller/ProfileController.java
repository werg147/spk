package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller	
@RequestMapping(value="/profile" , method= {RequestMethod.GET , RequestMethod.POST})
public class ProfileController {
	
	
	//대관 x 매칭신청만 할경우
	@RequestMapping(value="/writeForm" , method= {RequestMethod.GET , RequestMethod.POST})
	public String profileWriteForm() {
		System.out.println("[Controller] :+ profileWriteForm()");
		
		
		return "matching/matchinfoForm";
	}
}
