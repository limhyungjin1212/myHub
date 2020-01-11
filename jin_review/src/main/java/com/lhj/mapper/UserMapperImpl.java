package com.lhj.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

@Repository
public class UserMapperImpl implements UserMapper{

	@Autowired
	private SqlSession session;
	private static final String namespace ="com.lhj.mapper.UserMapper";
	
	@Override
	public UserVO login(LoginVO lvo) throws Exception {
		UserVO user =session.selectOne(namespace+".login",lvo); 
		return user;
	}
	
}
