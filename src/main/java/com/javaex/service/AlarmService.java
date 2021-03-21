package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.AlarmDao;
import com.javaex.vo.AlarmVo;

@Service
public class AlarmService {

	@Autowired
	private AlarmDao aDao;

	public List<AlarmVo> list() {

		System.out.println("[Alarm Service]: list() 연결");

		return aDao.selectList();
	}

	public Object payment_complete(AlarmVo aVo) {

		System.out.println("[Alarm Service]: payment_complete(AlarmVo aVo) 연결");

		aDao.payment_complete(aVo);

		return aDao.product_alarm(aVo);

	}

	public Object delivery_ready(AlarmVo aVo) {

		System.out.println("[Alarm Service]: delivery_ready(AlarmVo aVo) 연결");

		aDao.delivery_ready(aVo);

		return aDao.product_alarm(aVo);

	}

	public Object delivery_ing(AlarmVo aVo) {

		System.out.println("[Alarm Service]: delivery_ing(AlarmVo aVo) 연결");

		aDao.delivery_ing(aVo);

		return aDao.product_alarm(aVo);

	}

	public Object delivery_complete(AlarmVo aVo) {

		System.out.println("[Alarm Service]: delivery_complete(AlarmVo aVo) 연결");

		aDao.delivery_complete(aVo);

		return aDao.product_alarm(aVo);

	}

	public Object matching_registration(AlarmVo aVo) {

		System.out.println("[Alarm Service]: matching_registration(AlarmVo aVo) 연결");

		aDao.matching_registration(aVo);

		return aDao.matching_alarm(aVo);

	}

	public Object getMatch_application(AlarmVo aVo) {

		System.out.println("[Alarm Service]: getMatch_application(AlarmVo aVo) 연결");

		aDao.getMatch_application(aVo);

		return aDao.matching_alarm(aVo);

	}

	public Object getMatching_refused(AlarmVo aVo) {

		System.out.println("[Alarm Service]: getMatching_refused(AlarmVo aVo) 연결");

		aDao.getMatching_refused(aVo);

		return aDao.matching_alarm(aVo);

	}

	public Object matching_accept(AlarmVo aVo) {

		System.out.println("[Alarm Service]: matching_accept(AlarmVo aVo) 연결");

		aDao.matching_accept(aVo);

		return aDao.matching_alarm(aVo);

	}

	public Object matching_complete(AlarmVo aVo) {

		System.out.println("[Alarm Service]: matching_complete(AlarmVo aVo) 연결");

		aDao.matching_complete(aVo);

		return aDao.matching_alarm(aVo);

	}

}
