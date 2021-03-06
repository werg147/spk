package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ProfitVo;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	//로그인 -->회원정보 가져오기
	public UserVo selectUser(UserVo uservo) {
		return sqlSession.selectOne("user.selectUser", uservo);
	}
	
	
	//로그인 소셜 회원정보 가져오기
	public UserVo joinSocialUserIdChechSelect(String user_id) {
		System.out.println("[dao]로그인 정보가져오기" + user_id);	
		return sqlSession.selectOne("user.selectSocialUser", user_id);
	}
	
	//회원정보 확인
	public UserVo joinUserIdChechSelect(String user_id) {
		System.out.println("[dao]회원가입 여부확인" + user_id);	
		return sqlSession.selectOne("user.joinUserIdChechSelect", user_id);
	}

	
	//카카오 회원가입
	public int kakaoInsert(UserVo uservo) {
		System.out.println("[dao]카카오 회원가입" + uservo);		
		return sqlSession.insert("user.kakaoInsert", uservo);
	}
	
	//네이버 회원가입
	public int naverInsert(UserVo uservo) {
		System.out.println("[dao]네이버 회원가입" + uservo);		
		return sqlSession.insert("user.naverInsert", uservo);
	}
	
	//회원가입 회원정보 입력
	public int joininfoUPdate(UserVo uservo) {
		System.out.println("[dao]회원가입 회원정보입력" + uservo);		
		return sqlSession.update("user.joininfoUPdate", uservo);
	}
	
	//회원가입 취소
	public int joinDelete(int user_no) {
		System.out.println("[dao]회원가입 취소" + user_no);	
		return sqlSession.delete("user.joinDelete",user_no);
	}
	
	//대관판매자 계정등록
	public int sellerBookInsert(SellerVo sellervo) {
		System.out.println("[dao]대관계정등록" + sellervo);
		return sqlSession.insert("user.sellerBookInsert", sellervo);
	}
	//배송판매자 계정등록
	public int sellerProdInsert(SellerVo sellervo) {
		System.out.println("[dao]배송계정등록" + sellervo);
		return sqlSession.insert("user.sellerProdInsert", sellervo);
	}
	
	//배송판매자 계정변경
	public void prodSellerUpdate(SellerVo sellervo) {
		sqlSession.update("user.prodSellerUpdate", sellervo);
	}
	
	//대관 판매자 계정 변경
	public void bookSellerUpdate(SellerVo sellervo) {
		sqlSession.update("user.bookSellerUpdate", sellervo);
	}
	
	//판매자 계정 변경
	public void sellerUpdate(SellerVo sellervo) {
		sqlSession.update("user.sellerUpdate", sellervo);
	}
	
	//판매자 계정 정보가져오기
	public SellerVo sellerSelectOne(int sell_no) {
		return sqlSession.selectOne("user.sellerSelectOne", sell_no);
	}

	//배송상품 출금예정수익확인
	public List<ProfitVo> prodProfitExceptSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.prodProfitExceptSelect", profitvo);
	}
	
	//배송상품 출금가능익확인
	public List<ProfitVo> prodProfitPossibleSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.prodProfitPossibleSelect", profitvo);
	}
	
	//배송상품 출금완료수익확인
	public List<ProfitVo> prodProfitCompleteSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.prodProfitCompleteSelect", profitvo);
	}
	
	//배송상품 총누적수익확인
	public List<ProfitVo> prodProfitTotalSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.prodProfitTotalSelect", profitvo);
	}
	
	//수익관리 - 대관
	//대관상품 출금예정수익확인
	public List<ProfitVo> bookProfitExceptSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.bookProfitExceptSelect", profitvo);
	}
	
	//대관상품 출금가능익확인
	public List<ProfitVo> bookProfitPossibleSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.bookProfitPossibleSelect", profitvo);
	}
	
	//대관상품 출금완료수익확인
	public List<ProfitVo> bookProfitCompleteSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.bookProfitCompleteSelect", profitvo);
	}
	
	//대관상품 총누적수익확인
	public List<ProfitVo> bookProfitTotalSelect(ProfitVo profitvo) {
		return sqlSession.selectList("user.bookProfitTotalSelect", profitvo);
	}
}
