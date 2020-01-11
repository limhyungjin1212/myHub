package com.lhj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhj.mapper.UserMapper;
import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper um;

	@Override
	public UserVO login(LoginVO lvo) throws Exception {
		return um.login(lvo);
	}
	
}
