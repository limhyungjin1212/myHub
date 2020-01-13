package com.lhj.mapper;

import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

public interface UserMapper {
	public UserVO login(LoginVO lvo) throws Exception;
	
	public void join(UserVO uvo) throws Exception;
	
}
