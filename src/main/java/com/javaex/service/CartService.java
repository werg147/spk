package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CartDao;
import com.javaex.vo.CartInfoVo;
import com.javaex.vo.CartVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.UserVo;

@Service
public class CartService {

	@Autowired
	private CartDao cDao;

	public CartInfoVo list(int user_no) {

		System.out.println("[Cart Service]: list 연결");

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

		System.out.println("[Cart Service]: remove 연결");

		cDao.remove(cart_no);

		return cDao.selectOneTotalPrice(user_no);

	}

	/* 장바구니에 담기 */
	public void gotoCart(CartVo cartVo) {

		System.out.println("[Cart Service]: gotoCart 연결");

		cDao.gotoCart(cartVo);

	}
	
	//colorsize_no 조회
	public int getCno(List<ProdBuyForVo> prodList, int user_no) {
		System.out.println("[Cart Service] getCno()");
		
		CartVo cartVo = new CartVo();
		int success = 0;
		
		//리스트 vo에 담아 no조회하고 cart 인서트
		for(int i=0; i<prodList.size(); i++) {
			
			//prod_no
			String prod_no = prodList.get(i).getProd_no();
			cartVo.setProd_no(prod_no);
			
			//color
			String color = prodList.get(i).getColor();
			cartVo.setColor(color);
			
			//prod_size
			String prod_size = prodList.get(i).getProd_size();
			cartVo.setProd_size(prod_size);
			
			//colorsize_no 가져오기
			int colorsize_no = cDao.selectCno(cartVo);
			cartVo.setColorsize_no(colorsize_no);
			
			//count
			int count = prodList.get(i).getCount();
			cartVo.setCount(count);
			
			//user_no
			cartVo.setUser_no(user_no);
			
			//vo에 담아 카트 인서트
			success = cDao.gotoCart(cartVo);
		}
		
		System.out.println("vo확인 " + cartVo);
		System.out.println("인서트 성공여부" + success);
		
		return success;
	}


}
