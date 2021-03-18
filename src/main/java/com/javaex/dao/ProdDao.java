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
	public void prodInsert(ProductVo prodvo) {
		System.out.println("[Dao]상품등록");
		System.out.println(prodvo);
		sqlSession.insert("prod.insert", prodvo);
		
		prodvo.getProd_no();
	}
	

	
}
