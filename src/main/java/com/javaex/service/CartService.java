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

	public CartInfoVo list(int user_no) {

		System.out.println("[Cart Service]: list(int user_no) 연결");

		CartInfoVo ciVo = new CartInfoVo();

		// 회원정보 가져오기
		UserVo uVo = cDao.selectOneUser(user_no);
		ciVo.setuVo(uVo);

		// 장바구니에 담아둔 데이터 가져오기
		List<CartVo> cList = cDao.selectCartList(user_no);
		ciVo.setcList(cList);

		// 장바구니 상품 합계 가져오기
		int totalPrice = cDao.selectOneTotalPrice(user_no);
		ciVo.setTotalPrice(totalPrice);

		return ciVo;

	}

	public int remove(int cart_no, int user_no) {

		System.out.println("[Cart Service]: list(int user_no) 연결");

		cDao.remove(cart_no);

		return cDao.selectOneTotalPrice(user_no);

	}

}
