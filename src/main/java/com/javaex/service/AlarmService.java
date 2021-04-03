package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.AlarmDao;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;

@Service
public class AlarmService {

	AlarmContentVo alarmcVo = new AlarmContentVo();

	AlarmVo alarmVo = new AlarmVo();

	@Autowired
	private AlarmDao aDao;

	// 알림 리스트 불러오기
	public List<AlarmVo> list(int user_no) {

		System.out.println("[Alarm Service]: list() 연결");

		return aDao.selectList(user_no);

	}

	// 결제완료 알림 발송
	public void paymentComplete(int buy_no) {

		System.out.println("[Alarm Service]: payment_complete(AlarmVo aVo) 연결");

		List<AlarmVo> alarmList = aDao.prodSelectList(buy_no);

		System.out.println("결제알람 발송 내용 서비스" + alarmList);

		if (alarmList.size() > 1) {

			alarmVo = alarmList.get(0);

			System.out.println("상품 여러개 보내기" + alarmVo);

			String name = alarmVo.getProd_name();

			int num = alarmList.size() + 1;

			String prod_name = name + " 외 " + num + "개";

			alarmVo.setProd_name(prod_name);

		} else {

			alarmVo = alarmList.get(0);

		}

		// 구매자에게 보내는 알람
		alarmVo.setAlarm_content(alarmcVo.getPayment_complete());

		aDao.insertProdAlarm(alarmVo);

		for (int i = 0; i < alarmList.size(); i++) {

			alarmVo = alarmList.get(i);

			int user_no = alarmList.get(i).getSell_no();

			alarmList.get(i).setUser_no(user_no);

			// 판매자에게 보내는 알람
			alarmVo.setAlarm_content(alarmcVo.getPayment_complete());

			System.out.println(alarmVo);

			aDao.insertProdAlarm(alarmVo);

		}

	}

	/*
	 * // 배송준비 중 알림 발송 public void deliveryReady(int buyprod_no) {
	 * 
	 * System.out.println("[Alarm Service]: payment_complete(AlarmVo aVo) 연결");
	 * 
	 * alarmVo = aDao.prodSelect(buyprod_no);
	 * 
	 * alarmVo.setAlarm_content(alarmcVo.getDelivery_ready());
	 * 
	 * System.out.println(alarmVo);
	 * 
	 * aDao.insertProdAlarm(alarmVo);
	 * 
	 * }
	 * 
	 */
	/*
	 * // 배송시작 public void delStart(int buyprod_no) {
	 * 
	 * System.out.println("[Alarm Service]: delStart(AlarmVo aVo) 연결");
	 * 
	 * alarmVo = aDao.prodSelect(buyprod_no);
	 * 
	 * alarmVo.setAlarm_content(alarmcVo.getDelivery_ing());
	 * 
	 * System.out.println(alarmVo);
	 * 
	 * aDao.insertProdAlarm(alarmVo);
	 * 
	 * }
	 */
	// 베송완료
	public void delcomplete(int buyprod_no) {

		System.out.println("[Alarm Service]: delcomplete(AlarmVo aVo) 연결");

		alarmVo = aDao.prodSelect(buyprod_no);

		alarmVo.setAlarm_content(alarmcVo.getDelivery_complete());

		System.out.println(alarmVo);

		aDao.insertProdAlarm(alarmVo);

	}

	public Map<String, Object> pMap(String keyword, int crtPage, int user_no) {

		System.out.println("[Alarm Service]: pMap() 연결");

		System.out.println("[Alarm Service]: " + keyword + "(keyword)");

		System.out.println("[Alarm Service]: " + crtPage + "(crtPage)");

		int listCnt = 10;

		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);

		int startNum = (crtPage - 1) * listCnt + 1;

		int endNum = (startNum + listCnt) - 1;

		List<AlarmVo> alarmList = aDao.selectAlarmList(keyword, startNum, endNum, user_no);

		System.out.println("[Alarm Service]: " + startNum + "(startNum)");

		System.out.println("[Alarm Service]: " + endNum + "(endNum)");

		int pageBtnCnt = 5;

		int totalCnt = aDao.selectTotalCnt(keyword);

		int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCnt) * pageBtnCnt;

		int startPageBtnNo = endPageBtnNo - (pageBtnCnt - 1);

		boolean next;

		if (endPageBtnNo * listCnt < totalCnt) {
			next = true;
		} else {
			next = false;
			endPageBtnNo = (int) Math.ceil(totalCnt / (double) listCnt);
		}

		boolean prev;

		if (startPageBtnNo != 1) {
			prev = true;
		} else {
			prev = false;
		}

		Map<String, Object> pMap = new HashMap<String, Object>();

		pMap.put("alarmList", alarmList);
		pMap.put("prev", prev);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("next", next);

		return pMap;
	}

}
