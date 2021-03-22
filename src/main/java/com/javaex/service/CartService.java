package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CartDao;
import com.javaex.vo.CartInfoVo;
import com.javaex.vo.CartVo;
import com.javaex.vo.UserVo;

@Service
public class CartService {

	@Autowired
	private CartDao cDao;

	public UserVo list(int user_no) {

		System.out.println("[Cart Service]: list(int user_no) 연결");

		CartInfoVo ciVo = new CartInfoVo();

		UserVo uVo = cDao.selectOneUser(user_no);
		ciVo.setUserVo(uVo);

		List<CartVo> cList = cDao.slectCartList(user_no);
		ciVo.setcList(cList);

		System.out.println("setcList 성공");

		int totalPrice = cDao.selectOneTotalPrice(user_no);
		ciVo.setTotalPrice(totalPrice);

		System.out.println(ciVo);

		System.out.println("setTotalPrice 실패");

		return null;

	}

}
