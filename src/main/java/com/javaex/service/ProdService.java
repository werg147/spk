package com.javaex.service;
import java.io.File;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.AlarmDao;
import com.javaex.dao.ProdDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BuyProductVo;
import com.javaex.vo.ColorsizeVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Service
public class ProdService {
	@Autowired
	private ProdDao proddao;
	
	@Autowired
	private UserDao userdao;
	
	@Autowired
	private AlarmDao aDao;
	
	AlarmContentVo alarmcVo = new AlarmContentVo();
	AlarmVo alarmVo = new AlarmVo();
	
	//상품관리페이지
	public List<ProductVo> prodList(UserVo authUser) {
		System.out.println("[service] 상품관리");
			

		List<ProductVo> prodcutlist = proddao.prodSelectList(authUser.getSell_no());
		

		System.out.println(prodcutlist);
		for(int i=0; i<prodcutlist.size(); i++) {
			String prod_no = prodcutlist.get(i).getProd_no();
			List<ColorsizeVo> cssList = proddao.colorsizeSelectList(prod_no);
			prodcutlist.get(i).setCssList(cssList);
			System.out.println("===상품관리==== 항목추가 확인");
			System.out.println(prodcutlist);
		}
		return prodcutlist;		
	}
	
	
	//상품수정
	public ProductVo selectPord(String prod_no) {
		System.out.println("[service] 상품수정 정보가져오기");
		ProductVo prodvo = proddao.prodSelectOne(prod_no);
		System.out.println("[service] 상품정보 가져온 내용" + prodvo);
		
		//컬러사이즈 정보추가
		List<ColorsizeVo> cssList = proddao.colorsizeSelectList(prod_no);
		prodvo.setCssList(cssList);
		System.out.println("[service] 상품정보 (사이즈추가 가져온 내용" + prodvo);
		
		//이미지정보 추가
		List<ProdimgVo> pimgList = proddao.imgSelectList(prod_no);
		prodvo.setPimgList(pimgList);
		System.out.println("[service] 상품정보 (이미지추가 가져온 내용" + prodvo);
		
		return prodvo;
	}
	
	//상품 삭제
	public void prodRemove(String prodRemove) {
		System.out.println("[service] 상품삭제하기");
		
	}
	
	//상품등록
	public String prodWrite(ProductVo prodvo, 
							MultipartFile mainfile, 
							MultipartFile[] subfile,
							MultipartFile detailfile) {

		System.out.println("[service] 상품등록");

		String detailfilePath = "C:\\javaStudy\\upload"; // 설정파일로 뺀다.
		String detailfileOriginName = detailfile.getOriginalFilename();

		System.out.println("상세페이지 파일 기존 파일명 : " + detailfileOriginName);

		String detailsavename = System.currentTimeMillis() + UUID.randomUUID().toString() + detailfileOriginName; // 파일명
		String detailfileFullPath = detailfilePath + "/" + detailsavename; // 파일 전체 경로
		System.out.println("originalFilename:" + detailsavename + ", fileFullPath:" + detailfileFullPath);

		try {
			// 파일 저장
			detailfile.transferTo(new File(detailfileFullPath));
			prodvo.setProd_detail_img_name(detailfileOriginName);
			prodvo.setProd_detail_img_savename(detailsavename);
			proddao.prodInsert(prodvo);

			String mainfilePath = "C:\\javaStudy\\upload"; // 설정파일로 뺀다.
			String mainfileOriginName = mainfile.getOriginalFilename();

			System.out.println("기존 파일명 : " + mainfileOriginName);

			String mainsavename = System.currentTimeMillis() + UUID.randomUUID().toString() + mainfileOriginName; // 파일명
			String mainfileFullPath = mainfilePath + "/" + mainsavename; // 파일 전체 경로
			System.out.println("originalFilename:" + mainsavename + ", fileFullPath:" + mainfileFullPath);

			System.out.println("메인이미지 등록 여기까지 오니?");
			ProdimgVo imgvo = new ProdimgVo();
			imgvo.setProd_img_savename(mainsavename);
			imgvo.setProd_img_name(mainfileOriginName);
			imgvo.setProd_img_type("main");
			System.out.println("메인이미지 등록 상품번호 도착했니? " + prodvo.getProd_no());
			imgvo.setProd_no(prodvo.getProd_no());

			System.out.println("[service]상품이미지등록 출발" + imgvo);
			proddao.ImgInsert(imgvo);

			// 파일 저장
			mainfile.transferTo(new File(mainfileFullPath));

			for (int i = 0; i < subfile.length; i++) {

				String subfilePath = "C:\\javaStudy\\upload"; // 설정파일로 뺀다.
				String subfileOriginName = subfile[i].getOriginalFilename();

				System.out.println("서브이미지 등록 기존 파일명 : " + subfileOriginName);

				String subsavename = System.currentTimeMillis() + UUID.randomUUID().toString() + subfileOriginName; // 파일명
				String subfileFullPath = subfilePath + "/" + subsavename; // 파일 전체 경로
				System.out.println("originalFilename:" + subsavename + ", fileFullPath:" + subfileFullPath);

				System.out.println("서브이미지 등록 여기까지 오니?");
				ProdimgVo imgvo2 = new ProdimgVo();
				imgvo2.setProd_img_savename(subsavename);
				imgvo2.setProd_img_name(subfileOriginName);
				imgvo2.setProd_img_type("sub");
				System.out.println("서브이미지 등록 상품번호 도착했니? " + prodvo.getProd_no());
				imgvo2.setProd_no(prodvo.getProd_no());

				System.out.println("[service]상품이미지등록 출발" + imgvo2);
				proddao.ImgInsert(imgvo2);

				// 파일 저장
				subfile[i].transferTo(new File(subfileFullPath));

			}

		} catch (Exception e) {
			System.out.println("postTempFile_ERROR======>");

			e.printStackTrace();
		}


		return prodvo.getProd_no();

	}
	
	//사이즈등록
	public int prodSizeWrite(ProductVo prodvo) {
		System.out.println("[service] 상품사이즈등록");
		List<ColorsizeVo> cssList = prodvo.getCssList();
		System.out.println(cssList);
		int count=0;
		
		for(int i=0; i<cssList.size(); i++) {
			cssList.get(i).setProd_no(prodvo.getProd_no());
			proddao.colorsizeInsert(cssList.get(i));
			
			System.out.println("사이즈등록"+ i + "번째: " + cssList.get(i));
			count++;
		}
		return count;

	}
	
	
	//배송관리 리스트 가져오기
	public List<ProdBuyForVo> delmanage(int sell_no){
		System.out.println("[service] 상품사이즈등록");
		return proddao.delmanageselectList(sell_no);
	}
	
	//배송정보 불러오기
	public List<ProdBuyForVo> delform(ProdBuyForVo pvo) {
		System.out.println("[service] 배송정보 불러오기");
		return proddao.delformselectOne(pvo);
	}
	
	//배송준비중
	public void delStart(int buyprod_no) {
		System.out.println("[service] 배송상태 수정");

		BuyProductVo bpvo = new BuyProductVo();
		bpvo.setBuyprod_no(buyprod_no);
		bpvo.setBuy_del_state("배송준비중");

		proddao.delStateUpdate(bpvo);
		
		
		System.out.println("[Alarm Service]: payment_complete(AlarmVo aVo) 연결");
		alarmVo = aDao.prodSelect(buyprod_no);
		alarmVo.setAlarm_content(alarmcVo.getDelivery_ready());

		System.out.println(alarmVo);
		aDao.insertProdAlarm(alarmVo);


	}
	
	//배송불가
	public void delNo(BuyProductVo bpvo) {
		System.out.println("[service] 배송상태 수정");
			
		if(bpvo.getBuy_del_state() !="배송중" && bpvo.getBuy_del_state() != "배송완료") {
			bpvo.setBuy_del_state("판매불가");
			proddao.delStateUpdate(bpvo);
		} else {
			System.out.println("배송중이거나 배송완료된 상품으로 판매불가 전환이 불가합니다.");
		}
		
		System.out.println("[Alarm Service]: payment_complete(AlarmVo aVo) 연결");
		alarmVo = aDao.prodSelect(bpvo.getBuyprod_no());
		alarmVo.setAlarm_content(alarmcVo.getDelivery_cancle() + alarmcVo.getRefund());

		System.out.println(alarmVo);
		aDao.insertProdAlarm(alarmVo);

	}

	//택배사 운송장 정보입력(수정)
		public void delModify(int[] buyprod_noArray, BuyProductVo bpvo) {
			System.out.println("[service] 택배사 운송장 정보입력(수정)");
			
			for (int i=0; i<buyprod_noArray.length; i++) {
				int buyprod_no = buyprod_noArray[i];
				bpvo.setBuyprod_no(buyprod_no);
				proddao.delinfoUpdate(bpvo);
				
				//알람
				System.out.println("[Alarm Service]: delStart(AlarmVo aVo) 연결");
				alarmVo = aDao.prodSelect(buyprod_no);
				alarmVo.setAlarm_content(alarmcVo.getDelivery_ing());
				System.out.println(alarmVo);
				aDao.insertProdAlarm(alarmVo);

			}
			

		}
		
		
	//배송판매자계정등록
	public void sellerProdAdd(SellerVo sellervo) {
		userdao.sellerProdInsert(sellervo);
	}
	
	//판매자 정보 가져오기
	public SellerVo selectUser(int sell_no) {
		return userdao.sellerSelectOne(sell_no);
	}
	
	
	//배송판매자 계정 수정
	public void prodSellerModify(SellerVo sellervo) {
		userdao.prodSellerUpdate(sellervo);
	}
	
	
	
	

}