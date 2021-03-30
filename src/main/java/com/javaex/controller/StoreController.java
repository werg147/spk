package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.StoreService;
import com.javaex.vo.BuyVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.QnaVo;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/store")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	//스토어 상품 리스트
	@RequestMapping(value="/list")
	public String storeList(Model model, @RequestParam(value="search", required = false, defaultValue = "") String search) {
		System.out.println("[StoreController] storeList()");
		System.out.println("search: " + search);
		
		List<ProductVo> storeList = storeService.storeList(search);
		System.out.println("컨트롤러" + storeList.toString());
		
		model.addAttribute("storeList", storeList);
		
		return "store/storeList";
	}
	
	//스토어 상품 상세페이지 (read?키=값)
	@RequestMapping(value="/read")
	public String read(@RequestParam("prodNo") String prod_no, Model model) {
		System.out.println("[Controller] read()");
		System.out.println(prod_no);
		
		ProductVo productVo = storeService.product(prod_no);
		
		model.addAttribute("productVo", productVo);

		
		return "store/storeProducts";
	}
	
	
	//스토어 결제 페이지(jsp수정필요)
	@RequestMapping(value="/stopay")
	public String stopay() {
		System.out.println("[Controller] stopay()");
		
		return "store/storePayment";
	}
	
	//상품상세 - qna 작성폼 (로그인 안하면 오류남)
	@RequestMapping(value="/qnaForm")
	public String qnaForm(HttpSession session, Model model) {
		System.out.println("[Controller] qnaForm()");
		
		//로그인한 유저 정보 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		
		UserVo userVo = storeService.getUser(user_no);
		
		model.addAttribute("userVo", userVo);
		
		return"store/storeQna";
	}
	
	//상품상세 - qna 작성하기
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite(@RequestParam(value="file") MultipartFile file,
						   @ModelAttribute QnaVo qnaVo) {
		System.out.println("[Controller] qnaWrite()");
		
		
		//System.out.println(qnaVo);
		//System.out.println(file);
		
		//System.out.println(file.getOriginalFilename());
		//System.out.println(qnaVo.toString());
		
		storeService.qnaWrite(qnaVo, file);
		
		
		return "";
	}
	
	//상품리뷰 - review작성폼 (로그인 안하면 오류남)
	@RequestMapping(value="/reviewForm")
	public String reviewForm(HttpSession session, Model model) {
		System.out.println("[Controller] reviewForm()");
		
		//로그인한 유저 정보 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		
		UserVo userVo = storeService.getUser(user_no);
		
		model.addAttribute("userVo", userVo);
		
		return"store/storeReview";
	}
	
	//상품리뷰 - review 작성하기 --qna랑 같은 폼으로 진행 (service까지 공유)
	@RequestMapping(value="/reviewWrite")
	public String reviewWrite(@RequestParam(value="file") MultipartFile file,
						   @ModelAttribute ReviewVo reviewVo) {
		System.out.println("[Controller] reviewWrite()");
		
		
		storeService.reviewWrite(reviewVo, file);
		
		
		return "";
	}
	
	
	//상품상세 -> 바로구매 클릭시
	@RequestMapping(value="/paynow")
	public String payNow(@ModelAttribute ProdBuyForVo pbfVo, HttpSession session) {
		System.out.println("[Controller] payNow()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		pbfVo.setUser_no(user_no);
		
		System.out.println(pbfVo);
		//카트담기
		storeService.addCart(pbfVo);
		
		return "redirect:/store/payform";
	}
	
	//장바구니->상품결제페이지 (user_no넣어서 임시로 테스트)
	@RequestMapping(value="/payform")
	public String payform(Model model, HttpSession session) {
		System.out.println("[Controller] payform()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		
		//상품정보,유저정보,총액 가져오기
		Map<String,Object> pmap = storeService.payform(user_no);
		
		model.addAttribute("pmap", pmap);
		
		return "store/storePayment";
	}
	
	//장바구니->상품결제 상품삭제
	@ResponseBody
	@RequestMapping(value="/payform/remove")
	public int remove(@RequestParam("cartno") int cart_no, @RequestParam("userno") int user_no) {
		System.out.println("[Controller] remove()");
		System.out.println(cart_no);
		System.out.println(user_no);
		
		int total = storeService.removePay(cart_no, user_no);
		System.out.println(total);
		
		return total;	
	}
	
	//결제하기 클릭시 구매상품 인서트
	@RequestMapping(value="/pay")
	public String pay(@RequestParam("prod_no") String[] prod_noArray,
					  @RequestParam("colorsize_no") int[] colorsize_noArray,
					  @RequestParam("count") int[] countArray,
					  @RequestParam("prod_price") int[] prod_priceArray,
					  @RequestParam("stock") int[] stockArray,
					  @ModelAttribute BuyVo buyVo, HttpSession session) {
		System.out.println("[Controller] pay()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		
		buyVo.setUser_no(user_no);
		
		System.out.println("구매인서트 정보: " + buyVo.toString());
		System.out.println("prod_no String[]: " + prod_noArray[0]);
		System.out.println("colorsize_no int[]: " + colorsize_noArray[0]);
		System.out.println("count int[]: " + countArray[0]);
		System.out.println("prod_price int[]: " + prod_priceArray[0]);
		System.out.println("stock int[]: " + stockArray[0]);
		
		storeService.pay(prod_noArray,colorsize_noArray,countArray,prod_priceArray,stockArray,buyVo);
		
		int buy_no = buyVo.getBuy_no();
		
		
		return "redirect:/store/stopcp?buy_no=" + buy_no ;
	}
	
	
	//상품결제완료 - 매칭추천
	@RequestMapping(value="/stopcp")
	public String stoPcp(HttpSession session, Model model, @RequestParam("buy_no") int buy_no) {
		System.out.println("[Controller] stopcp()");
	
		System.out.println(buy_no);
		List<GymVo> rentList = storeService.stopcp(buy_no);
		
		model.addAttribute("rentList", rentList);
		//체육관 저장값이 한개밖에 없어서 jsp 임시로 [0]통일
		
		return "store/paymentCp";
	}
	
	//대관결제완료 - 상품추천
	@RequestMapping(value="/rentpcp")
	public String rentPcp(HttpSession session, Model model, @RequestParam("gym_event") String gym_event) {
		System.out.println("[Controller] stopcp()");
	
		//파라미터로 종목 받아올 예정
		System.out.println(gym_event);
		List<ProductVo> prodList = storeService.rentpcp(gym_event);
		
		model.addAttribute("prodList", prodList);
		
		return "store/rentCp";
	}
	
	
	
	
	
	
	
	
	//지도 api 테스트
	@RequestMapping(value="/maptest")
	public String maptest() {
		System.out.println("[Controller] maptest()");
		
		return "store/mapTest";
	}

}
