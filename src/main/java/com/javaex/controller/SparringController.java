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
import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingVo;

import com.javaex.vo.GymImgVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;

@Controller
@RequestMapping(value = "/sparring", method = { RequestMethod.GET, RequestMethod.POST })
public class SparringController {

	@Autowired
	SparringService sparringService;

	// 스파링 리스트
	@RequestMapping(value = "/match", method = { RequestMethod.GET, RequestMethod.POST })
	public String match(Model model) {
		System.out.println("[Controller] : match()");
		
		List<BBuyVo> bBuyList = sparringService.match();
		model.addAttribute("bBuyList",bBuyList);
		
		return "matching/sparringList";
	}

	// 스파링매치신청서
	@RequestMapping(value = "/bbuyMatch", method = { RequestMethod.GET, RequestMethod.POST })
	public String sparringMatch(@RequestParam("bookingNo") int bookingNo) {
		System.out.println("[Controller] : sparringMatch()");
		System.out.println("bookingNo = " + bookingNo);
		return "matching/sparringMatch";
	}

	/** 체육관 대관 쪽 **/

	// 체육관 리스트
	@RequestMapping(value = "/rent", method = { RequestMethod.GET, RequestMethod.POST })
	public String rent(Model model) {
		System.out.println("[Controller] : rent()");

		List<GymVo> gymList = sparringService.rent();
		System.out.println(gymList);

		model.addAttribute("gymList", gymList);

		return "matching/rent";
	}

	@RequestMapping(value = "/rentdetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String rentDetail(@RequestParam(value = "gymNo") int gymNo, Model model) {
		System.out.println("[Controller] : rentDetail()");
		GymVo gymVo = sparringService.rentDetail(gymNo);

		model.addAttribute("gAVo", gymVo);

		return "matching/rentdetail";
	}

	/** 결제하기 **/
	@RequestMapping(value = "/payment", method = { RequestMethod.GET, RequestMethod.POST })
	public String payment(@RequestParam(value = "bookingno", required = false, defaultValue = "0") int bookingNo,
						  @RequestParam(value = "userno", required = false, defaultValue = "0") int userNo,
						  @RequestParam(value = "profileno", required = false, defaultValue = "0") int profileNo,
						  Model model) {
		System.out.println(bookingNo);
		System.out.println(userNo);
		/*임의로 설정한 userNo 지워야함*/
		userNo = 2;
		
		Map<String,Object> map = sparringService.payment(bookingNo,userNo);
		
		model.addAttribute("map",map);
		return "matching/payment";
	}
	/**결제**/
	@RequestMapping(value = "/pay", method = { RequestMethod.GET, RequestMethod.POST })
	public String pay(@ModelAttribute BBuyVo bBuyVo) {
		System.out.println("[Controller] : pay()");
		
		System.out.println(bBuyVo);
		
		sparringService.pay(bBuyVo);
		
		return "store/paymentCp";
	}

	/*****************************************************/
	// bookingno == 0 이면 대관x 신청만
	@RequestMapping(value = "/writeForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String profileWriteForm(Model model, 
			@RequestParam(value = "bookingno", required = false, defaultValue = "0") int bookingno,
			@RequestParam(value = "userno", required = false, defaultValue = "0") int userNo,
			@RequestParam(value = "mainnum", required = false, defaultValue = "0") int mainnum) {
		System.out.println("[Controller] : profileWriteForm()");
		System.out.println(bookingno);
		// 유저no는 현재 대관하기에서 세션값 으로 쓸 임의의 번호를 보내고 있음 지워야댐
		if (userNo == 0) {
			// 사용자가 없음 잘못된 접근 메인으로
			return "";
		} else {
			List<ProfileVo> profileList = sparringService.profileWriteForm(userNo);

			model.addAttribute("profileList", profileList);
			model.addAttribute("bookingno", bookingno);
			return "matching/matchinfoForm";
		}
	}

	/*
	 * 
	 * 1. 프로필 테이블의 userNo는 세션값으로 받고
	 * 
	 * 2. 만들어진 프로필테이블의 profileNo를 selectKey로 추가한뒤에
	 * 
	 * 3. 주종목 테이블, 공식기록 테이블에 뿌려준다
	 * 
	 */
	/*
	 * 1 방법 : 체크박스는 list로 받고
	 * 
	 * @RequestParam(value="eventName",required =false)List eventList x 2방법 : vo를
	 * 배열로 받기 x 3방법 리퀘스트로 값을 불러와 배열에 넣어받기 o
	 * 
	 * 1. 복싱 2.킥복싱 3.종합격투기 4.주짓수
	 */

	/*
	 * record는 여러개의 select를 받아와야하는데 수가 늘어날수있기 때문에 1번 vo안에 리스트를 만들었다
	 */
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String profileWrite(@ModelAttribute ProfileVo profileVo, HttpServletRequest request, @ModelAttribute RecordVo recordVo,
							   @RequestParam(value="bookingno",required=false,defaultValue="0")int bookingNo,
							   @RequestParam(value="userNo",required=false,defaultValue="0")int userNo,
							   @RequestParam(value="subnum",required=false,defaultValue="0")int subNum) {
		System.out.println("[Controller] : profileWrite");

		String[] eventName = request.getParameterValues("eventName");

		sparringService.profileWrite(profileVo, eventName, recordVo);
		
		if(bookingNo == 0 || subNum ==1) {
			
			sparringService.insertBBuy(bookingNo,subNum,userNo,profileVo);
			return "";
		}else {
			return "redirect:/sparring/payment?bookingno="+bookingNo+"&userno="+userNo+"&profileno="+profileVo.getProfileNo();
			
		}
		
	}

	/*********************** api *****************/
	@ResponseBody
	@RequestMapping(value = "/api/selectdate", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> selectDate(@RequestParam(value = "rownum") int rownum, @RequestParam(value = "userNo") int userNo) {
		System.out.println("[Api Controller] : selectDate");

		return sparringService.selectDate(rownum, userNo);
	}

	// 체육관상세페이지 메인사진 바꾸기
	@ResponseBody
	@RequestMapping(value = "/api/gymimgone", method = { RequestMethod.GET, RequestMethod.POST })
	public GymImgVo gymImgOne(@RequestParam(value = "gymImgNo") int gymImgNo) {
		System.out.println("[Api Controller] :");
		System.out.println(gymImgNo);

		GymImgVo gIVo = sparringService.gymImgOne(gymImgNo);

		System.out.println("gIVo = " + gIVo);
		return gIVo;
	}

	// 체육관 booking 리스트 바꾸기
	@ResponseBody
	@RequestMapping(value = "/api/bookinglist", method = { RequestMethod.GET, RequestMethod.POST })
	public List<BookingVo> bookingList(@RequestParam(value = "date") String date, @RequestParam(value = "gymNo") int gymNo) {
		System.out.println("[Controller] : bookingList");

		List<BookingVo> bookingList = sparringService.bookingList(date, gymNo);
		System.out.println(bookingList);
		return bookingList;
	}
}
