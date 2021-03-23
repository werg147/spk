package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;
	
	
	//로그인
	public UserVo login(UserVo uservo) {
		System.out.println("uservice login()");
		return userdao.selectUser(uservo);
	}
	

}
