package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SparringService;
import com.javaex.vo.GymAssembleVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;

@Controller
@RequestMapping(value="/sparring" , method= {RequestMethod.GET , RequestMethod.POST})
public class SparringController {
	
	@Autowired
	SparringService sparringService;
	
	//스파링 리스트
	@RequestMapping(value="/bbuyList" , method= {RequestMethod.GET , RequestMethod.POST})
	public String sparringList() {
		System.out.println("[Controller] : sparringList()");
		return "matching/sparringList";
	}
	
	//스파링매치신청서
	@RequestMapping(value="/bbuyMatch" , method= {RequestMethod.GET , RequestMethod.POST})
	public String sparringMatch(@RequestParam("bookingNo")int bookingNo) {
		System.out.println("[Controller] : sparringMatch()");
		System.out.println("bookingNo = "+ bookingNo);
		return "matching/sparringMatch";
	}
	
	
	
	/**체육관 대관 쪽**/
	
	//체육관 리스트
	@RequestMapping(value="/rent" , method= {RequestMethod.GET , RequestMethod.POST})
	public String rent(Model model) {
		System.out.println("[Controller] : rent()");
		
		
		
		List<GymVo> gymList = sparringService.rent();
		System.out.println(gymList);
		
		model.addAttribute("gymList",gymList);
		
		return "matching/rent";
	}
	
	@RequestMapping(value="/rentdetail" , method= {RequestMethod.GET , RequestMethod.POST})
	public String rentDetail(@RequestParam(value="gymNo")int gymNo,Model model) {
		System.out.println("[Controller] : rentDetail()");
		GymAssembleVo gymAssembleVo = sparringService.rentDetail(gymNo);
		
		model.addAttribute("gAVo",gymAssembleVo);
		
		return "matching/rentdetail";
	}
	
	
	
	/*****************************************************/
	//대관 x 매칭신청만 할경우 입력폼
	@RequestMapping(value="/writeForm" , method= {RequestMethod.GET , RequestMethod.POST})
	public String profileWriteForm(Model model) {
		System.out.println("[Controller] : profileWriteForm()");
		int userNo = 2;
		List<ProfileVo> profileList = sparringService.profileWriteForm(userNo);
		
		model.addAttribute("profileList",profileList);
		
		return "matching/matchinfoForm";
	}
	
	
	/*
	 
	  1. 프로필 테이블의 userNo는 세션값으로 받고

	  2. 만들어진 프로필테이블의 profileNo를 selectKey로 추가한뒤에

	  3. 주종목 테이블, 공식기록 테이블에 뿌려준다
	  
     */
	/*
	 1 방법 : 체크박스는 list로 받고
	 @RequestParam(value="eventName",required =false)List eventList x
	 2방법 : vo를 배열로 받기 x
	 3방법 리퀘스트로 값을 불러와 배열에 넣어받기 o
	 
	 1. 복싱 2.킥복싱 3.종합격투기 4.주짓수
	 */
	
	/*
	 record는 여러개의 select를 받아와야하는데 수가 늘어날수있기 때문에
	 1번 vo안에 리스트를 만들었다
	 * */
	@RequestMapping(value="/write" , method= {RequestMethod.GET , RequestMethod.POST})
	public String profileWrite(@ModelAttribute ProfileVo profileVo,
			HttpServletRequest request,
			@ModelAttribute RecordVo recordVo) {
		System.out.println("[Controller] : profileWrite");
		
		String[] eventName = request.getParameterValues("eventName");
		
		sparringService.profileWrite(profileVo,eventName,recordVo);
		
		
		return "";
	}
	@ResponseBody
	@RequestMapping(value="/api/selectdate" , method= {RequestMethod.GET , RequestMethod.POST})
	public Map<String,Object> selectDate(@RequestParam(value="rownum")int rownum,
						@RequestParam(value="userNo")int userNo) {
		System.out.println("[Controller] : selectDate");
		
		
		return sparringService.selectDate(rownum,userNo); 
	}
}
