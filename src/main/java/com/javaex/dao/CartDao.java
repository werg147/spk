package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CartVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.UserVo;

@Repository
public class CartDao {

	@Autowired
	private SqlSession sql;

	public UserVo selectOneUser(int user_no) {

		System.out.println("[Cart Dao]: selectOneUser 연결");

		return sql.selectOne("cart.selectOneUser", user_no);
	}

	public List<CartVo> selectCartList(int user_no) {

		System.out.println("[Cart Dao]: selectCartList 연결");

		return sql.selectList("cart.selectCartList", user_no);
	}

	public int selectOneTotalPrice(int user_no) {

		System.out.println("[Cart Dao]: selectOneTotalPrice 연결");

		return sql.selectOne("cart.selectOneTotalPrice", user_no);
	}

	public int remove(int cart_no) {

		System.out.println("[Cart Dao]: remove 연결");

		return sql.delete("cart.removeCartList", cart_no);
	}

	public int gotoCart(CartVo cartVo) {

		System.out.println("[Cart Dao]: gotoCart 연결");

		return sql.insert("cart.gotoCart", cartVo);

	}
	
	//colorsize_no 가져오기
	public int selectCno(CartVo cartVo) {
		System.out.println("[Cart Dao] selectCno()");
		
		return sql.selectOne("cart.selectCno", cartVo);
	}

}
