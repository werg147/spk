package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//체육관 관리 경유지
	@RequestMapping(value="/gyminfo", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymInfoPath(@RequestParam("no") int sellNo,
						  HttpSession session,
						  Model model) { 
		
		//세션에서 user_no   구한다 --> 서비스getGymInfo()에 전달
		//mypage/mypage_resrvation/mypage_gyminfo
		//
		/*
		 * getGymInfo(no){
		 *   // 체유관리스트  4개
		 *   // 0번째 짐 상세정보 = 리스트에서 0 상세조회
		 *   
		 * }   
		 */

		//사업자번호를 조건으로 체육관을 리스트로 가져온 후 각탭에 체육관 번호 넣기
		System.out.println("[GymController] gymInfoPath()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		//세션으로 사업자 번호 int sellNo 받아서 사업자만 접근 가능하게 만들기
		
		//사이드 메뉴에서 들어갈 때 sellNo만 받아서 최근 gymNo를 불러옴
		GymVo vo = gymService.gymNo(sellNo);
		
		//등록된 체육관이 없을 경우
		if(vo == null) { 
			return "mypage/mypage_resrvation/mypage_notgym";
		}
		
		int gymNo = vo.getGym_no();

		/*
		GymVo gymVo = gymService.gymInfo(gymno);
		System.out.println(gymVo);
		model.addAttribute("gymVo", gymVo);
		*/
		return "redirect:/mypage/book/gym?no="+sellNo+"&gymno="+gymNo;
	}
	
	//체육관 관리 페이지
	@RequestMapping(value="/gym", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymInfo(@RequestParam("no") int sellNo,
						@RequestParam("gymno") int gymNo, Model model) {
		System.out.println("[GymController] gymInfo()");
		
		model.addAttribute("gymMap", gymService.gymInfo(sellNo, gymNo));
		
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
					@RequestParam("file1") MultipartFile mainfile,
					@RequestParam("file2") MultipartFile subfile,
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
			
			gymService.gymAdd(gymVo, conve, mainfile, subfile);
		}
		int gymNo = gymVo.getGym_no();
		
		return "redirect:/mypage/book/gym?no="+sellNo+"&gymno="+gymNo;
	}
	
	//체육관 삭제
	@RequestMapping(value="/gymremove", method= {RequestMethod.GET , RequestMethod.POST})
	public String gymRemove(@RequestParam("no") int sellNo,
							@RequestParam("gymno") int gymNo) {
		System.out.println("[GymController] gymRemove() "+sellNo+" / "+gymNo);
		
		//삭제정책 : 체육관 삭제하면 대관 등록한 거 다 삭제할지 대관 등록된 거 있으면 삭제 못하게 할지
		//테이블삭제 순서 con --> gym
		
		return "redirect:/mypage/book/gyminfo?no="+sellNo;
	}
	
	//대관 등록 페이지
	@RequestMapping(value="/bookaddform", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookAddForm(@RequestParam("gymno") int gymNo, Model model) {
		System.out.println("[GymController] bookAddForm()");
		
		//대관 등록할 체육관 정보 불러오기
		GymVo gymVo = gymService.gymInfo(gymNo);
		model.addAttribute("gymVo", gymVo);
		
		return "mypage/mypage_resrvation/mypage_bookingadd";
	}
	
	//대관 등록
	@RequestMapping(value="/bookadd", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookAdd(@ModelAttribute BookingVo bookVo) {
		System.out.println("[GymController] bookAdd()>>> "+bookVo);
		
		gymService.bookAdd(bookVo);
		
		return "redirect:/mypage/book/bookaddform?gymno="+bookVo.getGym_no();
	}
	
	//대관 리스트 출력(ajax)
	@ResponseBody
	@RequestMapping(value="/booklist", method= {RequestMethod.GET , RequestMethod.POST})
	public List<BookingVo> bookList(@RequestParam("gymno") int gymno) {
		System.out.println("[GymController] booklist()>>> "+gymno);
		
		List<BookingVo> bookList = gymService.bookList(gymno);
		
		return bookList;
	}
	
	//대관 삭제
	@RequestMapping(value="/bookremove", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookRemove(@RequestParam("bookno") int bookno, @RequestParam("gymno") int gymno) {
		System.out.println("[GymController] bookRemove()>>> "+bookno+"/"+gymno);
		
		gymService.bookRemove(bookno);
		
		return "redirect:/mypage/book/bookmanage?gymno="+gymno;
	}
	
	//대관 관리 페이지 경유지
	@RequestMapping(value="/bookinfo", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookinfo(@RequestParam("no") int sellNo, HttpSession session) {
		System.out.println("[GymController] bookinfo()>>> "+sellNo);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");

		GymVo vo = gymService.gymNo(sellNo);
		
		/*대관 등록된 체육관이 없을 경우
		if(vo == null) { 
			return "";
		}
		*/
		int gymNo = vo.getGym_no();
		
		return "redirect:/mypage/book/bookmanage?no="+sellNo+"&gymno="+gymNo;
	}
	
	//대관 관리 페이지
	@RequestMapping(value="/bookmanage", method= {RequestMethod.GET , RequestMethod.POST})
	public String bookManage(@RequestParam("no") int sellNo,
			                 @RequestParam("gymno") int gymno, Model model) {
		System.out.println("[GymController] bookManage()>>> "+sellNo+" / "+gymno);
		
		// gymList + gymVo
		Map<String, Object> bookMap = gymService.bookManage(sellNo, gymno);
		
		model.addAttribute("bookMap", bookMap);
		
		return "mypage/mypage_resrvation/mypage_bookinglist";
	}
	
	//테스트
	@RequestMapping(value="/qqq", method= {RequestMethod.GET , RequestMethod.POST})
	public String qqq() {
		return "mypage/mypage_resrvation/mypage_bookinglist";
	}
	
	//수익관리
	@RequestMapping(value="/profit", method= {RequestMethod.GET , RequestMethod.POST})
	public String profit() {
		return "mypage/mypage_seller/seller_profit";
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
