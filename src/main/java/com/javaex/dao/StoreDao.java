package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.QnaVo;

@Repository
public class StoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//qna 작성 내용 인서트
	public void qnaInsert(QnaVo qnaVo) {
		System.out.println("[StoreDao] qnaInsert()");
		
		sqlSession.insert("store.qnaInsert", qnaVo);
	}

}
