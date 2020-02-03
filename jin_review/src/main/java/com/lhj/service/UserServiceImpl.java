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

	@Override
	public void join(UserVO uvo) throws Exception {
		um.join(uvo);
	}

	@Override
	public int nameCheck(String uname) throws Exception {
		return um.nameCheck(uname);
	}

	@Override
	public int idCheck(String uid) throws Exception {
		return um.idCheck(uid);
	}
	
}
