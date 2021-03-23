package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	//로그인 -->회원정보 가져오기
	public UserVo selectUser(UserVo uservo) {
		System.out.println("selectUser: " + uservo.toString());
		
		return sqlSession.selectOne("user.selectUser", uservo);
	}
	
	//대관판매자 계정등록
	public int sellerBookInsert(SellerVo sellervo) {
		System.out.println("[service]대관계정등록" + sellervo);
		return sqlSession.insert("user.sellerBookInsert", sellervo);
	}
	//배송판매자 계정등록
	public int sellerProdInsert(SellerVo sellervo) {
		System.out.println("[service]배송계정등록" + sellervo);
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
}
