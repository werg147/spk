package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BookingVo;
import com.javaex.vo.ConvenienceVo;
import com.javaex.vo.EventVo;
import com.javaex.vo.GymImgVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.UserVo;

@Repository
public class SparringDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//프로필생성
	public void insertProfile(ProfileVo profileVo) {
		System.out.println("[Dao] : insertProfile()");
		
		
		int count = sqlSession.insert("profile.insertProfile",profileVo);
		
		System.out.println(count);
		
	}
	
	//주종목생성
	public void insertEvent(EventVo eventVo) {
		// TODO Auto-generated method stub
		System.out.println("[Dao] : insertEvent");
		
		int count = sqlSession.insert("event.insertEvent",eventVo);
		System.out.println(count);
	}

	public void insertRecord(RecordVo recordVo) {
		
		System.out.println("[Dao] : insertRecord");
		
		int count = sqlSession.insert("record.insertRecord",recordVo);
		
		System.out.println("insertRecord = "+count);
	}

	public List<ProfileVo> selectListProfile(int userNo) {
		System.out.println("[Dao] : selectListProfile");
		
		List profileList = sqlSession.selectList("profile.selectListProfile",userNo);
		
		for(int i = 0; i < profileList.size(); i++) {
			System.out.println(profileList.get(i));
		}
		
		return profileList;
	}

	public ProfileVo selectOneProfile(Map<String, Object> profileMap) {
		System.out.println("[Dao] : selectOneProfile");
		
		return sqlSession.selectOne("profile.selectOneProfileBydate",profileMap);
	}

	public List<EventVo> selectListEvent(int profileNo) {
		// TODO Auto-generated method stub
		System.out.println("[Dao] : selectListEvent");
		
		List<EventVo> eventList = sqlSession.selectList("event.selectListEvent",profileNo);
		
		System.out.println("eventList :"+eventList);
		
		return eventList;
	}

	public List<RecordVo> selectListRecord(int profileNo) {
		System.out.println("[Dao] : selectListRecord");
		
		List<RecordVo> recordList = sqlSession.selectList("record.selectListRecord",profileNo);
		System.out.println("RecordList = "+ recordList);
		
		return recordList;
	}

	public List<GymVo> selectListGym() {
		System.out.println("[Dao] : selectListGym()");
		
		return sqlSession.selectList("gym.selectListGym");
		
		
	}

	public GymVo selectOneGym(int gymNo) {
		System.out.println("[Dao] : selectOneGym()");
		System.out.println(gymNo);
		
		return sqlSession.selectOne("gym.selectOneGym",gymNo);
		
	}

	public List<GymImgVo> selectListGymImg(int gymNo) {
		System.out.println("[DAO] : selectListGymImg");
		
		return sqlSession.selectList("gymimg.selectListGymImg",gymNo);
	}


	public List<ConvenienceVo> selectListCon(int gymNo) {
		System.out.println("[Dao] : selectListCon");
		
		List<ConvenienceVo>conList = sqlSession.selectList("convenience.selectListCon",gymNo);
		
		System.out.println(conList);
		
		return conList;
	}

	public GymImgVo selectOneGymImg(int gymImgNo) {
		System.out.println("[Dao] : selectOneGymImg");
		
		return sqlSession.selectOne("gymimg.selectOneGymImg",gymImgNo);
		
	}
	//첫화면 리스트
	public List<BookingVo> selectListBooking(Map<String, Object> map) {
		
		System.out.println("[Dao] : selectOneBooking()");
		
		List<BookingVo> bList = sqlSession.selectList("booking.selectListBooking",map);
		System.out.println(bList.toString());
		
		return bList;
	}

	public BookingVo selectOneBooking(int bookingNo) {
		System.out.println("[Dao] : selectOneBooking()");
		
		 return sqlSession.selectOne("booking.selectOneBooking",bookingNo);
		
	}

	public UserVo selectAddressUser(int userNo) {
		System.out.println("[Dao] : selectOneUser()");
		
		return sqlSession.selectOne("user.selectOneUserAddress",userNo);
		
	}
	

}
