package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
