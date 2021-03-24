package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.AlarmVo;

@Repository
public class AlarmDao {

	@Autowired
	private SqlSession sql;

	public List<AlarmVo> selectList(int user_no) {

		System.out.println("[Alarm Dao]: selectList() 실행");

		List<AlarmVo> aList = sql.selectList("alarm.selectAlarm", user_no);

		System.out.println("[Alarm Dao]: " + aList.toString());

		return aList;

	}

	// 알람 보내기
	public void insertProdAlarm(AlarmVo alarmVo) {

		System.out.println("[Alarm Dao]: insertAlarm(AlarmVo aVo) 실행");

		System.out.println(alarmVo);

		sql.insert("alarm.insertProdAlarm", alarmVo);

	}

	// 결제완료 - 리스트 가져오기
	public List<AlarmVo> prodSelectList(int buy_no) {

		System.out.println("[Alarm Dao]: prodSelect(AlarmVo aVo) 실행");

		return sql.selectList("alarm.prodSelectList", buy_no);
	}

	// 배송준비 중 - 리스트 가져오기
	public AlarmVo prodSelect(int buyprod_no) {

		System.out.println("[Alarm Dao]: prodSelect(AlarmVo aVo) 실행");

		return sql.selectOne("alarm.prodSelect", buyprod_no);
	}

}