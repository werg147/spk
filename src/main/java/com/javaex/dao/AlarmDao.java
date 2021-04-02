package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 배송준비 중/ 배송불가 - 리스트 가져오기
	public AlarmVo prodSelect(int buyprod_no) {

		System.out.println("[Alarm Dao]: prodSelect(AlarmVo aVo) 실행" + buyprod_no);

		return sql.selectOne("alarm.prodSelect", buyprod_no);
	}

	// 판매자 user_no가져오기
	public AlarmVo sellUsernoSelect(int sell_no) {
		System.out.println("[Alarm Dao]: sellUsernoSelect(int sell_no) 실행");

		return sql.selectOne("alarm.sellUsernoSelect", sell_no);
	}

	public void inserAlarmtoseller(AlarmVo alarmVo) {
		System.out.println("[Alarm Dao]: inserAlarmtoseller()");

		sql.insert("alarm.inserAlarmtoseller", alarmVo);
	}

	public void insertResistrar(AlarmVo alarmVo) {
		System.out.println("[Alarm Dao]: insertResistrar()");

		sql.insert("alarm.insertResistrar", alarmVo);

	}

	public void insertMatchAlarm(AlarmVo alarmVo) {
		System.out.println("[Alarm Dao]: insertcompetition()");

		sql.insert("alarm.insertMatchAlarm", alarmVo);
	}

	public AlarmVo bbuyuserNo(int bbuyno) {
		System.out.println("[Alarm Dao]: bbuyuserNo()");

		return sql.selectOne("alarm.bbuyuserNo", bbuyno);
	}

	/* 이 아래로 페이징 */
	public List<AlarmVo> selectAlarmList(String keyword, int startNum, int endNum, int user_no) {

		System.out.println("[Alarm Dao]: selectAlarmList()");

		System.out.println("[Alarm Dao]: " + keyword + "(keyword)");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("user_no", user_no);

		System.out.println("[Alarm Dao]: " + map);

		return sql.selectList("alarm.selectAlarmList", map);
	}

	public int selectTotalCnt(String keyword) {

		System.out.println("[Alarm Dao]: selectAlarmList()");

		return sql.selectOne("alarm.selectTotalCnt", keyword);
	}

}