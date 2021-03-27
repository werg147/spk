package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.AlarmDao;
import com.javaex.dao.StoreDao;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BuyProductVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.ColorsizeVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.QnaVo;
import com.javaex.vo.QnaimgVo;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.ReviewimgVo;
import com.javaex.vo.UserVo;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	AlarmContentVo alarmcVo = new AlarmContentVo();

	AlarmVo alarmVo = new AlarmVo();

	@Autowired
	private AlarmDao aDao;
	
	//storeList 가져오기
	public List<ProductVo> storeList(String search) {
		System.out.println("[Service] storeList()");
			
		return storeDao.selectStoList(search);	
	}
	
	
	//상품 상세페이지 리스트
	public ProductVo product(String prod_no) {
		System.out.println("[Service] product()");
		
		//1. 상품정보
		ProductVo productVo = storeDao.selectProduct(prod_no);
		System.out.println("상품정보: " + productVo.toString());
		
		//2. 상품옵션 리스트
		List<ColorsizeVo> cssList = storeDao.selectCsList(prod_no);
		System.out.println("상품옵션 리스트: " + cssList.toString());
		
		//3. 리뷰게시글 리스트
		List<ReviewVo> reList = storeDao.selectReList(prod_no);
		System.out.println("리뷰게시글: " + reList.toString());
		
		//4. 문의게시글 리스트
		List<QnaVo> qnaList = storeDao.selectQnaList(prod_no);
		System.out.println("문의게시글: " + qnaList.toString());
		
		//묶기
		productVo.setCssList(cssList);
		productVo.setReList(reList);
		productVo.setQnaList(qnaList);
		
		System.out.println(productVo.toString());
		
		return productVo;
	}

	
	///////////////////////////////////////////////////////////////
	//qna form 유저정보 가져오기
	public UserVo getUser(int user_no) {
		System.out.println("[Service] getUser()");
		//System.out.println(user_no);
		
		return storeDao.selectUser(user_no);
	}
	
	//qna 작성내용 인서트
	public void qnaWrite(QnaVo qnaVo, MultipartFile file) {
		System.out.println("[Service] qnaWrite()");
		
		System.out.println(qnaVo);
		System.out.println(file);
				

		//작성 내용 인서트
		storeDao.qnaInsert(qnaVo);
		
		///////이미지 파일 인서트//////
		//db저장할 정보 수집
		String saveDir = "C:\\javastudy\\upload";
		
		//오리지널 파일 이름 (문의이미지 등록명 qna_img_name)
		String qna_img_name = file.getOriginalFilename();
		//System.out.println("qna_img_name:" + qna_img_name);
		
		//오리지널 파일 비어있음 --> 해당 값이 없어 조건에 맞춰 확장자를 자를 수 없다.
		//java.lang.StringIndexOutOfBoundsException: String index out of range: -1
		//Vo에 private으로 MultipartFile 생성 뒤 Controller에서 Vo로 묶어 받아 올 수 있음.
		//하지만 일반 내용 인서트와 이미지 파일 인서트 구분을 위해 if문으로 걸러주기로 했다.
		//file.toString(); -> 값이 뜸. -> null이 될 수 없기 때문에 위의 qna_img_name으로 걸러주기로 함.
		
		if(ObjectUtils.isEmpty(qna_img_name)) {
			System.out.println("선택된 파일이 없습니다.");
		} else {
			//확장자
			String exName = qna_img_name.substring(qna_img_name.lastIndexOf("."));
			System.out.println("exName: " + exName);
			
			//서버 저장파일 이름 (문의이미지 저장명 qna_img_savename)
			String qna_img_savename = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println("qna_img_savename: " + qna_img_savename);
			
			//서버 파일패스 (저장경로)
			String filePath = saveDir + "\\" + qna_img_savename;
			System.out.println("filePath: " + filePath);
			
			
			//서버 하드디스크 파일저장
			try {
				byte[] fileData = file.getBytes();
				
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			//db저장
			//문의는 이미지 하나만 받고 리뷰에 여러개 받기로 함
			//문의 옵션 임의로 넣어줌
			String qna_img_type = "main";
			
			QnaimgVo qnaimgVo = new QnaimgVo();
			
			qnaimgVo.setQna_no(qnaVo.getQna_no());
			qnaimgVo.setQna_img_name(qna_img_name);
			qnaimgVo.setQna_img_savename(qna_img_savename);
			qnaimgVo.setQna_img_type(qna_img_type);
			
			storeDao.qnaimgInsert(qnaimgVo);
			
		}
		
	}
		
	//review 작성내용 인서트
	public void reviewWrite(ReviewVo reviewVo, MultipartFile file) {
		System.out.println("[Service] reviewWrite()");
		
		System.out.println(reviewVo);
		//System.out.println(file);
				

		//작성 내용 인서트
		storeDao.reviewInsert(reviewVo);
		
		///////이미지 파일 인서트//////
		//db저장할 정보 수집
		String saveDir = "C:\\javastudy\\upload";
		
		//오리지널 파일 이름
		String review_img_name = file.getOriginalFilename();

		
		if(ObjectUtils.isEmpty(review_img_name)) {
			System.out.println("선택된 파일이 없습니다.");
		} else {
			//확장자
			String exName = review_img_name.substring(review_img_name.lastIndexOf("."));
			System.out.println("exName: " + exName);
			
			//서버 저장파일 이름 (문의이미지 저장명 qna_img_savename)
			String review_img_savename = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println("review_img_savename: " + review_img_savename);
			
			//서버 파일패스 (저장경로)
			String filePath = saveDir + "\\" + review_img_savename;
			System.out.println("filePath: " + filePath);
			
			
			//서버 하드디스크 파일저장
			try {
				byte[] fileData = file.getBytes();
				
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			//db저장
			//문의 옵션 임의로 넣어줌
			String review_img_type = "main";
			
			ReviewimgVo reviewimgVo = new ReviewimgVo();
			
			reviewimgVo.setReview_no(reviewVo.getReview_no());
			reviewimgVo.setReview_img_name(review_img_name);
			reviewimgVo.setReview_img_savename(review_img_savename);
			reviewimgVo.setReview_img_type(review_img_type);
			
			storeDao.reviewimgInsert(reviewimgVo);
			
		}
		

	}
	
	
	//바로결제하기 클릭시 (카트 추가인서트)
	public void addCart(ProdBuyForVo pbfVo) {
		System.out.println("[Service] addCart()");
		
		storeDao.insertCart(pbfVo);
	}
	
	//결제하기 폼
	public Map<String,Object> payform(int user_no) {
		System.out.println("[Service] payform()");
		
		//유저정보 가져오기
		UserVo userVo = storeDao.selectUser(user_no);
		System.out.println(userVo.toString());
		
		//상품리스트
		List<ProductVo> payList = storeDao.selectPayList(user_no);
		System.out.println(payList.toString());
		
		//총액
		int total = storeDao.selectTotal(user_no);
		System.out.println("총액:" + total);
		
		Map<String,Object> pmap = new HashMap<String,Object>();
		pmap.put("userVo", userVo);
		pmap.put("payList", payList);
		pmap.put("total", total);
		
		System.out.println("맵에 담기: " + pmap.toString());
		
		return pmap;
	}
	
	//결제폼 삭제
	public int removePay(int cart_no, int user_no) {
		System.out.println("[Service] remove()");
		
		//카드넘버로 카트 리스트에서 삭제
		storeDao.deletePay(cart_no);
		
		//유저넘버로 총액 다시가져와서 ajax보내기
		return storeDao.selectTotal(user_no);
	}
	
	//결제하기
	public void pay(String[] prod_noArray, int[] colorsize_noArray, int[] countArray, int[] prod_priceArray, BuyVo buyVo) {
		System.out.println("[Service] pay()");
		
		BuyProductVo bpVo = new BuyProductVo();
		
		//Buy 인서트
		storeDao.insertBuy(buyVo);
		int buy_no = buyVo.getBuy_no();
		bpVo.setBuy_no(buy_no);
		System.out.println("바이넘버가져오기: " + buy_no);
		
					
		//BuyProduct 인서트
		for(int i=0; i<prod_noArray.length; i++) {
			String prod_no = prod_noArray[i];
			bpVo.setProd_no(prod_no);
	
			int colorsize_no = colorsize_noArray[i];
			bpVo.setColorsize_no(colorsize_no);
			
			int count = countArray[i];
			bpVo.setCount(count);
			
			int buyprod_price = prod_priceArray[i] * count;
			bpVo.setBuyprod_price(buyprod_price);

			storeDao.insertBp(bpVo);
		}

		/*
		//알람발송
		List<AlarmVo> alarmList = aDao.prodSelectList(buy_no);

		System.out.println("결제알람 발송 내용 서비스" + alarmList);

		if (alarmList.size() > 1) {

			alarmVo = alarmList.get(0);

			System.out.println("상품 여러개 보내기" + alarmVo);

			String name = alarmVo.getProd_name();

			int num = alarmList.size() + 1;

			String prod_name = name + " 외 " + num + "개";

			alarmVo.setProd_name(prod_name);

		} else {

			alarmVo = alarmList.get(0);

		}

		// 구매자에게 보내는 알람
		alarmVo.setAlarm_content(alarmcVo.getPayment_complete());

		aDao.insertProdAlarm(alarmVo);

		for (int i = 0; i < alarmList.size(); i++) {

			alarmVo = alarmList.get(i);

			int user_no = alarmList.get(i).getSell_no();

			alarmList.get(i).setUser_no(user_no);

		}

		// 판매자에게 보내는 알람
		alarmVo.setAlarm_content(alarmcVo.getPayment_complete());

		System.out.println(alarmVo);

		aDao.insertProdAlarm(alarmVo);
		*/
	}
	
}
