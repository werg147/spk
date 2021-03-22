package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CartVo;
import com.javaex.vo.UserVo;

@Repository
public class CartDao {

	@Autowired
	private SqlSession sql;

	public UserVo selectOneUser(int user_no) {

		return sql.selectOne("cart.selectOneUser", user_no);
	}

	public List<CartVo> slectCartList(int user_no) {

		return sql.selectList("cart.selectCartList", user_no);
	}

	public int selectOneTotalPrice(int user_no) {

		return sql.selectOne("cart.selectOneTotalPrice", user_no);
	}

}
