package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.QnaVo;
import com.javaex.vo.QnaimgVo;

@Repository
public class StoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//qna 작성 내용 인서트
	public void qnaInsert(QnaVo qnaVo) {
		System.out.println("[StoreDao] qnaInsert()");
		
		System.out.println(qnaVo.toString());
		
		sqlSession.insert("store.qnaInsert", qnaVo);
	}
	
	//qnq 이미지 인서트
	public void qnaimgInsert(QnaimgVo qnaimgVo) {
		System.out.println("[Service] qnaimgInsert()");
		
		System.out.println(qnaimgVo.toString());
		
		sqlSession.insert("store.qnaimgInsert", qnaimgVo);
	}

}
