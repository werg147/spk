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

	public List<AlarmVo> selectList() {

		System.out.println("[Alarm Dao]: selectList() 실행");

		List<AlarmVo> aList = sql.selectList("alarm.selectAlarm");

		System.out.println("[Alarm Dao]: " + aList.toString());

		return aList;

	}

	public Object send(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: send(AlarmVo aVo) 실행");

		return sql.insert("alarm.sendAlarm", aVo);

	}

	public Object update(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: update(AlarmVo aVo) 실행");

		System.out.println("[Alarm Dao]: " + aVo.toString());

		return sql.insert("alarm.updateAlarm", aVo);
	}

}