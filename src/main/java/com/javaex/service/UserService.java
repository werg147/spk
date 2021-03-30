package com.javaex.service;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.dao.UserDao;
import com.javaex.vo.KakaoUserInfo;
import com.javaex.vo.KakaoVo;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;

	// 로그인
	public UserVo login(UserVo uservo) {
		return userdao.selectUser(uservo);
	}

	// 카카오 회원가입
	public UserVo kakaoJoin(String code) {

		System.out.println("[service]카카오 회원가입");
		RestTemplate rt = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

		String key = "e90198f391392e46dc3459bec3b08f4b";
		String redirect_uri = "http://localhost:8088/Sparkling_/user/join";

		params.add("grant_type", "authorization_code");
		params.add("client_id", key);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);

		// HttpHeaders, HttpBody 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kokoaTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - post방식으로 그리고 response 변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kokoaTokenRequest, String.class);

		// Gson, Json simple, objectMapper
		KakaoVo kakaovo = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			kakaovo = objectMapper.readValue(response.getBody(), KakaoVo.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		RestTemplate rt2 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + kakaovo.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeaders, HttpBody 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kokoaProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청하기 - post방식으로 그리고 response 변수의 응답을 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kokoaProfileRequest2, String.class);

		// Gson, Json simple, objectMapper
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoUserInfo KakaoUserinfo = null;

		try {
			KakaoUserinfo = objectMapper2.readValue(response2.getBody(), KakaoUserInfo.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		UUID uuidpassword = UUID.randomUUID();

		UserVo uservo = new UserVo();
		uservo.setUser_id(KakaoUserinfo.getId());
		uservo.setPassword(uuidpassword.toString());
		uservo.setNickname(KakaoUserinfo.getProperties().getNickname());

		System.out.println("회원가입 여부확인");
		int count = userdao.joinUserIdChechSelect(KakaoUserinfo.getId());

		if (count == 1) {
			userdao.selectUser(uservo);
			return uservo;
		} else {
			userdao.kakaoInsert(uservo);
			return uservo;
		}
	}

}
