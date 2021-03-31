package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SparringService;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;

@Controller
@RequestMapping(value = "/mypage" , method = { RequestMethod.GET, RequestMethod.POST})
public class Mypage_matchController {

	@Autowired
	SparringService sparringService;
	
	
	@RequestMapping(value = "/matchinfo" , method = { RequestMethod.GET, RequestMethod.POST})
	public String writeForm(Model model ,
			 @RequestParam(value="userno", required=false, defaultValue="0")int userNo) {
		System.out.println("[Controller] : writeForm");
		
		List<ProfileVo> profileList = sparringService.profileWriteForm(userNo);
		
		model.addAttribute("profileList", profileList);
		
		
		return "/mypage/mypage_buy/matchinfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/write" , method = { RequestMethod.GET, RequestMethod.POST})
	public String write(@RequestBody ProfileVo profileVo
			 			) {
		System.out.println("[Controller] : write");
		
		System.out.println(profileVo);
	
		
		//셀렉트키로 바로 profileNo 사용가능
		sparringService.profileWrite(profileVo);
		
		
		return "";
	}
}
