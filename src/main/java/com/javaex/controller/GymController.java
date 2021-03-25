package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.GymService;
import com.javaex.vo.BookingVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/mypage/book", method= {RequestMethod.GET , RequestMethod.POST})
public class GymController {
	
	@Autowired
	private GymService gymService;
	
	//체육관 관리
	@RequestMapping(value="/gym", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymInfo(@RequestParam("no") int sellNo, 
						  @RequestParam(value="gymno", required=false) int gymNo,
						  Model model) { 
		//사업자번호를 조건으로 체육관을 리스트로 가져온 후 각탭에 체육관 번호 넣기
		System.out.println("[GymController] gymInfo()");
		
		model.addAttribute("gymMap", gymService.gymInfo(sellNo, gymNo));
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
					@RequestParam(value="file", required=false) MultipartFile file,
					HttpSession session) {
		System.out.println("[GymController] gymAdd()");
		System.out.println(gymVo);
		System.out.println(conve);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		//대관판매자인지 검사
		int bookType = authUser.getBook_type();
		int sellNo = authUser.getSell_no();
		System.out.println("사업자번호>>> "+sellNo);
		
		if(bookType == 1) {			
			gymVo.setSell_no(sellNo);
			
			gymService.gymAdd(gymVo, conve, file);
		}
		int gymNo = gymVo.getGym_no();
		
		return "redirect:/mypage/book/gym?no="+sellNo+"&gymno="+gymNo;
	}
	
	//대관 등록폼
	@RequestMapping(value="/bookaddform", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookAddForm() {
		System.out.println("[GymController] bookAddForm()");
		
		return "mypage/mypage_resrvation/mypage_bookingadd";
	}
	
	//대관 등록
	@RequestMapping(value="/bookadd", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookAdd(@ModelAttribute BookingVo bookVo) {
		System.out.println("[GymController] bookAdd()");
		
		System.out.println("[GymController] bookAdd()>>> "+bookVo);
		//gymService.bookAdd(bookVo);
		
		return "";
	}
	
	//대관 관리 페이지
	@RequestMapping(value="/bookmanage", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookManage() {
		return "mypage/mypage_resrvation/mypage_bookinglist";
	}
	
	/////////////////////////////////////////////////////////////////////
	
	// 대관판매자 계정등록 폼
	@RequestMapping(value = "/bookselleraddform", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookDellerAddForm(Model model, HttpSession session) {
		System.out.println("[cnt] 대관판매자 계정등록폼");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		model.addAttribute("authUser", authUser);

		return "mypage/mypage_seller/book_seller_add";
	}

	// 대관판매자 대관계정 등록
	@RequestMapping(value = "/bookselleradd", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookSellerAdd(@ModelAttribute SellerVo sellervo, HttpSession session) {
		System.out.println("[cnt] 대관판매자 계정 등록");

		gymService.bookSellerAdd(sellervo);
		System.out.println("돌아옴");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		authUser.setSell_no(sellervo.getSell_no());
		authUser.setBook_type(sellervo.getBook_type());

		return "redirect:/mypage/book/gymaddform";

	}

	// 대관판매자계정관리 페이지
	@RequestMapping(value = "/bookmanageform", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookManageForm(HttpSession session, Model model) {
		System.out.println("[cnt] 판매자계정수정 페이지");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int sell_no = authUser.getSell_no();

		SellerVo sellervo = gymService.selectUser(sell_no);
		System.out.println("[cnt]판매자정보" + sellervo);
		model.addAttribute("sellervo", sellervo);

		return "mypage/mypage_seller/book_manage";
	}

	// 대관판매자 대관 계정 수정
	@RequestMapping(value = "/booksellermodify", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookSellerModify(@ModelAttribute SellerVo sellervo, HttpSession session) {
		System.out.println("[cnt] 대관판매자 계정 수정" + sellervo);

		gymService.bookSellerModify(sellervo);
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		authUser.setBook_type(sellervo.getBook_type());

		System.out.println("[cnt] 대관판매자 계정 수정완료" + sellervo);
		return "redirect:/mypage/book/gymaddform";
	}

}
