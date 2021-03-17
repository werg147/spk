package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ProfileVo;

@Repository
public class SparringDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insertProfile(ProfileVo profileVo) {
		System.out.println("[Dao] : insertProfile()");
		System.out.println("vo :" + profileVo);
		
		sqlSession.insert("ProfileVo.insertProfile",profileVo);
	}
}
