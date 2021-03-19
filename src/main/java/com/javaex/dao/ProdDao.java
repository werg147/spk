package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;

@Repository
public class ProdDao {

	@Autowired
	private SqlSession sqlSession;
	

	//상품등록
	public String prodInsert(ProductVo prodvo) {
		System.out.println("[Dao]상품등록");
		System.out.println(prodvo);
		sqlSession.insert("prod.insert", prodvo);
		
		return prodvo.getProd_no();
	}
	
	//상품 이미지 등록
	public void mainImgInsert(ProdimgVo imgvo) {
		System.out.println("[Dao]이미지등록" + imgvo);
		sqlSession.insert("prod.imgInsert", imgvo);
	}

	
}
