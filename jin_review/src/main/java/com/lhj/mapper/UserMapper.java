package com.lhj.mapper;

import java.util.Date;

import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

public interface UserMapper {
	
	//로그인
	public UserVO login(LoginVO lvo) throws Exception;
	
	//회원가입
	public void join(UserVO uvo) throws Exception;
	
	//닉네임 중복검사
	public int nameCheck(String uname) throws Exception;
	
	//id 중복검사
	public int idCheck(String uid) throws Exception;
	
	//로그인 유지
	public void keepLogin(String uid,String sessionId,Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
	//유저의 프로필
	public UserVO userDetail(String uname) throws Exception;
	
}
