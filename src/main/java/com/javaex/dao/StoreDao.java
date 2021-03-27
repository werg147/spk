package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ColorsizeVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.QnaVo;
import com.javaex.vo.QnaimgVo;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.ReviewimgVo;
import com.javaex.vo.UserVo;

@Repository
public class StoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//storeList 상품정보 가져오기
	public List<ProductVo> selectStoList(String search) {
		System.out.println("[StoreDao] selectStoList()");
		
		return sqlSession.selectList("store.selectStoList", search);
	}
	
	
	//상품 상세페이지 상품정보 vo
	public ProductVo selectProduct(String prod_no) {
		System.out.println("[StoreDao] selectProduct()");
		
		return sqlSession.selectOne("selectProduct", prod_no);
	}
	
	//상품 상세페이지 옵션리스트
	public List<ColorsizeVo> selectCsList(String prod_no) {
		System.out.println("[StoreDao] selectCsList()");
		
		return sqlSession.selectList("store.selectCsList", prod_no);
	}
	
	//상품 상세페이지 리뷰리스트
	public List<ReviewVo> selectReList(String prod_no) {
		System.out.println("[StoreDao] selectReList()");
		
		return sqlSession.selectList("store.selectReList", prod_no);
	}
	
	//상품 상세페이지 문의리스트
	public List<QnaVo> selectQnaList(String prod_no){
		System.out.println("[StoreDao] selectQnaList()");
		
		return sqlSession.selectList("store.selectQnaList", prod_no);
	}

	
	
	
	//////////////////////////////////////////////////////////////////////
	//qna / review
	//qna폼 유저 정보 가져오기
	public UserVo selectUser(int user_no) {
		System.out.println("[StoreDao] selectUser()");
		
		return sqlSession.selectOne("store.selectUser", user_no);
	}
	
	//qna 작성 내용 인서트
	public void qnaInsert(QnaVo qnaVo) {
		System.out.println("[StoreDao] qnaInsert()");
		
		System.out.println(qnaVo.toString());
		
		sqlSession.insert("store.qnaInsert", qnaVo);
	}
	
	//qnq 이미지 인서트
	public void qnaimgInsert(QnaimgVo qnaimgVo) {
		System.out.println("[StoreDao] qnaimgInsert()");
			
		System.out.println(qnaimgVo.toString());
			
		sqlSession.insert("store.qnaimgInsert", qnaimgVo);
	}
	
	//review 작성 내용 인서트
	public void reviewInsert(ReviewVo reviewVo) {
		System.out.println("[StoreDao] reviewInsert()");
			
		System.out.println(reviewVo.toString());
			
		sqlSession.insert("store.reviewInsert", reviewVo);
	}
	
	
	//review 이미지 인서트
	public void reviewimgInsert(ReviewimgVo reviewimgVo) {
		System.out.println("[StoreDao] reviewimgInsert()");
		
		System.out.println(reviewimgVo.toString());
		
		sqlSession.insert("store.reviewimgInsert", reviewimgVo);
	}	
	
	//바로결제하기 (카트 추가인서트)
	public void insertCart(ProdBuyForVo pvfVo) {
		System.out.println("[StoreDao] insertCart()");
		
		sqlSession.insert("store.insertCart", pvfVo);
	}
	
	//결제폼 리스트
	public List<ProductVo> selectPayList(int user_no) {
		System.out.println("[StoreDao] selectPayList()");
		
		return sqlSession.selectList("store.selectPayList", user_no);
	}
	
	//결제폼 총액
	public int selectTotal(int user_no) {
		System.out.println("[StoreDao] selectTotal()");
	
		return sqlSession.selectOne("store.selectTotal", user_no);
	}
	
	//결제폼 삭제
	public void deletePay(int cart_no) {
		System.out.println("[StoreDao] deletePay()");
		
		sqlSession.delete("store.deletePay", cart_no);
	}
	

}
