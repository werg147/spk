package com.javaex.controller;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.AutoMappingBehavior;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.javaex.service.ProdService;
import com.javaex.vo.BuyProductVo;
import com.javaex.vo.ColorsizeVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/mypage/prod")
public class ProdController {

	@Autowired
	private ProdService prodservice;

	// 상품관리페이지
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodList(Model model,
						   HttpSession session) {
		// 리스트 추후작업하기
		System.out.println("[cnt]상품관리페이지");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		List<ProductVo> prodList = prodservice.prodList(authUser);
		model.addAttribute("prodList", prodList);

		return "mypage/mypage_prod/prod_manage";
	}
	
	//상품정보 수정하기 정보가져오기
	@ResponseBody
	@RequestMapping(value = "/prodModifyinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public ProductVo prodModifyinfo(@RequestParam ("prod_no") String prod_no,
							  Model model){
		System.out.println("[cnt]상품정보 수정하기" + prod_no);	
		ProductVo prodvo = prodservice.selectPord(prod_no);

		return prodvo;
	}
	
	//상품정보 수정하기 페이지
	@RequestMapping(value = "/prodmodifyform", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodModifyForm(@RequestParam ("prod_no") String prod_no,
							  Model model){
		System.out.println("[cnt]상품정보 수정하기" + prod_no);	
		ProductVo prodvo = prodservice.selectPord(prod_no);
		List<ProdimgVo> pimgList = prodvo.getPimgList();
		model.addAttribute("prodvo", prodvo);
		model.addAttribute("pimgList", pimgList);
		
		return "mypage/mypage_prod/prod_modify_form";
	}

	//상품정보 삭제하기
	@RequestMapping(value = "/prodremove", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodRemove(@RequestParam ("prod_no") String prod_no){
		System.out.println("[cnt]상품정보 수정하기" + prod_no);	
		prodservice.prodRemove(prod_no);

		return "redirect:/mypage/prod";
	}
	
	
	// 상품등록페이지
	@RequestMapping(value = "/form", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodForm() {
		System.out.println("[cnt]상품등록페이지");
		
		return "mypage/mypage_prod/prod_form";
	}


	//상품등록
	@ResponseBody
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodWrite(@RequestParam("mainfile") MultipartFile mainfile,
						  @RequestParam("subfile") MultipartFile[] subfile,
						  @RequestParam("detailfile") MultipartFile detailfile,
						 @ModelAttribute ProductVo prodvo) {
		
		System.out.println("[cnt]상품등록" + prodvo + "mainfile" + mainfile + "subfile" + subfile + "detailfile" + detailfile);
		
		prodservice.prodWrite(prodvo, mainfile, subfile, detailfile);
		System.out.println("[cnt]상품등록완료");
		return prodvo.getProd_no();
	}
	
	// 상품사이즈등록
	@ResponseBody
	@RequestMapping(value = "/sizewrite", method = { RequestMethod.GET, RequestMethod.POST })
	public int prodSizeWrite(@RequestBody ProductVo prodvo){

		System.out.println("[cnt]상품사이즈등록" + prodvo);	
		return prodservice.prodSizeWrite(prodvo);	
	}
	
	//배송관리 페이지 열기
	@RequestMapping(value = "/delmanage", method = { RequestMethod.GET, RequestMethod.POST })
	public String delmanage(HttpSession session,
							Model model) {
		System.out.println("[cnt] 배송관리페이지");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		List<ProdBuyForVo> delList = prodservice.delmanage(authUser.getSell_no());
		model.addAttribute("delList", delList);
		System.out.println("배송 관리 내역" + delList);
		return "mypage/mypage_prod/delivery_manage";
	}
	
	//배송정보 폼 열기
	@RequestMapping(value = "/delform", method = { RequestMethod.GET, RequestMethod.POST })
	public String delForm(@ModelAttribute ProdBuyForVo pvo,
						  Model model) {
		System.out.println("[cnt] 배송정보 입력 페이지");

		List<ProdBuyForVo> delList = prodservice.delform(pvo);
		ProdBuyForVo delfound = delList.get(0);

		model.addAttribute("delList", delList);
		model.addAttribute("delfound", delfound);
		System.out.println("[cnt] 배송정보 보기" + delfound + delList);
		
		return "mypage/mypage_prod/delivery_form";
	}
	

	
	//배송준비중
	@ResponseBody
	@RequestMapping(value = "/delstatechange", method = { RequestMethod.GET, RequestMethod.POST })
	public int delstart(@RequestBody  ProdBuyForVo pbfvo) {
		System.out.println("[cnt] 배송준비중" + pbfvo);
		System.out.println(pbfvo.getBuyprod_nolist());

		return prodservice.delStart(pbfvo);
	}
	
	//배송불가
	@RequestMapping(value = "/delno", method = { RequestMethod.GET, RequestMethod.POST })
	public String delNo(@ModelAttribute ProdBuyForVo pbfvo) {
		System.out.println("[cnt] 배송불가");
		
		prodservice.delNo(pbfvo);
		
		return "redirect:/mypage/prod/delmanage";
	}
	
	//택배사 운송장 정보입력(수정)
	@ResponseBody
	@RequestMapping(value = "/delmodify", method = { RequestMethod.GET, RequestMethod.POST })
	public int delModify(@RequestBody ProdBuyForVo pbfvo) {
		System.out.println("[cnt] 택배사 운송장 정보입력(수정)" + pbfvo);
		
		return prodservice.delModify(pbfvo);
	}
	


	// 배송판매자 계정등록 폼
	@RequestMapping(value = "/prodselleraddform", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodDellerAddForm(Model model, HttpSession session) {
		System.out.println("[cnt] 배송판매자 계정등록폼");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		model.addAttribute("authUser", authUser);

		return "mypage/mypage_seller/prod_seller_add";
	}

	// 배송판매자 대관계정 등록
	@RequestMapping(value = "/prodselleradd", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodSellerAdd(@ModelAttribute SellerVo sellervo, HttpSession session) {
		System.out.println("[cnt] 배송판매자 계정 등록");

		
		
		prodservice.sellerProdAdd(sellervo);
		System.out.println("돌아옴");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		authUser.setSell_no(sellervo.getSell_no());
		authUser.setProd_type(sellervo.getProd_type());

		return "redirect:/mypage/prod";
	}

	// 배송판매자 계정관리 페이지
	@RequestMapping(value = "/prodmanageform", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodManageForm(HttpSession session, Model model) {
		System.out.println("[cnt] 배송판매자계정수정 페이지");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int sell_no = authUser.getSell_no();

		SellerVo sellervo = prodservice.selectUser(sell_no);
		System.out.println("[cnt]판매자정보" + sellervo);
		model.addAttribute("sellervo", sellervo);

		return "mypage/mypage_seller/prod_manage";
	}

	// 배송판매자 대관 계정 수정
	@RequestMapping(value = "/prodsellermodify", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodSellerModify(@RequestParam("roadAddress") String roadAddress,
			@RequestParam("addressdetail") String addressdetail,
			@ModelAttribute SellerVo sellervo, HttpSession session) {
		System.out.println("[cnt] 배송판매자 계정 수정" + sellervo);

		prodservice.prodSellerModify(sellervo);
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		authUser.setProd_type(sellervo.getProd_type());

		System.out.println("[cnt] 배송판매자 계정 수정완료" + sellervo);
		return "redirect:/mypage/prod";
	}
	

	

	// 드롭다운 예제파일 실행
	@RequestMapping(value = "/exam", method = { RequestMethod.GET, RequestMethod.POST })
	public String exam() {

		return "mypage/mypage_buy/mymatch";
	}
}
