package com.lhj.mapper;

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
	
}
