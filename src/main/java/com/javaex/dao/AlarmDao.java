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

	public Object product_alarm(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: sellAlarm(AlarmVo aVo) 실행");

		return sql.insert("alarm.send_product_alarm", aVo);

	}

	public Object payment_complete(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: payment_complete(AlarmVo aVo) 실행");

		return sql.update("alarm.payment_complete", aVo);

	}

	public Object delivery_ready(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: delivery_ready(AlarmVo aVo) 실행");

		return sql.update("alarm.delivery_ready", aVo);

	}

	public Object delivery_ing(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: delivery_ing(AlarmVo aVo) 실행");

		return sql.update("alarm.delivery_ing", aVo);

	}

	public Object delivery_complete(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: delivery_complete(AlarmVo aVo) 실행");

		return sql.update("alarm.delivery_complete", aVo);

	}

	public Object matching_alarm(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: matching_alarm(AlarmVo aVo) 실행");

		return sql.insert("alarm.send_matching_alarm", aVo);
	}

	public Object matching_registration(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: matching_registration(AlarmVo aVo) 실행");

		return sql.update("alarm.matching_registration", aVo);

	}

	public Object getMatch_application(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: getMatch_application(AlarmVo aVo) 실행");

		return sql.update("alarm.getMatch_application", aVo);

	}

	public Object getMatching_refused(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: getMatching_refused(AlarmVo aVo) 실행");

		return sql.update("alarm.getMatching_refused", aVo);

	}

	public Object matching_accept(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: matching_accept(AlarmVo aVo) 실행");

		return sql.update("alarm.matching_accept", aVo);

	}

	public Object matching_complete(AlarmVo aVo) {

		System.out.println("[Alarm Dao]: matching_complete(AlarmVo aVo) 실행");

		return sql.update("alarm.matching_complete", aVo);

	}

}