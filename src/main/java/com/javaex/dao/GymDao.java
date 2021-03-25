package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BookingVo;
import com.javaex.vo.ConVo;
import com.javaex.vo.GymImgVo;
import com.javaex.vo.GymVo;

@Repository
public class GymDao {

	@Autowired
	private SqlSession sqlSession;
	
	//소유 체육관 리스트
	public List<GymVo> gymSelectList(int sellNo) {
		System.out.println("[GymDao] gymSelectList()");
		
		List<GymVo> gymList = sqlSession.selectList("gym.gymSelectList", sellNo);
		System.out.println("[GymDao]>>> "+gymList);
		
		return gymList;
	}
	
	//체육관 정보 불러오기
	public GymVo gymSelectOne(int gymNo) {
		System.out.println("[GymDao] gymSelectOne()");
		
		GymVo gymVo = sqlSession.selectOne("gym.gymSelectOne", gymNo);
		
		return gymVo;
	}
	
	//체육관 등록
	public void gymInsert(GymVo gymVo) {
		System.out.println("[GymDao] gymInsert()");
		
		sqlSession.insert("gym.gymInsert", gymVo);
	}
	
	//편의시설 불러오기
	public List<ConVo> conSelectList(int gymno) {
		System.out.println("[GymDao] conSelect()");
		
		List<ConVo> conList = sqlSession.selectList("gym.conSelectList", gymno);
		System.out.println("[GymDao] >>> "+conList);
		
		return conList;
	}
	
	//편의시설 등록
	public void conInsert(ConVo conVo) {
		System.out.println("[GymDao] conInsert() >>> "+conVo);
		
		sqlSession.insert("gym.conInsert", conVo);
	}
	
	//편의시설 상태 수정
	public void conUpdate(ConVo conVo) {
		System.out.println("[GymDao] conUpdate()");
		
		sqlSession.update("gym.conUpdate", conVo);
	}
	
	//체육관 이미지 등록
	public void gimgInsert(GymImgVo gimgVo) {
		System.out.println("[GymDao] gimgInsert()");
		
		sqlSession.insert("gym.gimgInsert", gimgVo);
	}
	
	//대관 등록
	public void bookInsert(BookingVo bookVo) {
		System.out.println("[GymDao] bookInsert()");
		sqlSession.insert("gym.bookInsert", bookVo);
	}
}
