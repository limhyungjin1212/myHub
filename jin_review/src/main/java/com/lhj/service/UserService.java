package com.lhj.service;

import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

public interface UserService {
	public UserVO login(LoginVO lvo) throws Exception;
}
