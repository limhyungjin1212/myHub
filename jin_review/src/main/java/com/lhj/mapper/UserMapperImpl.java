package com.lhj.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void join(UserVO uvo) throws Exception {
		session.insert(namespace+".join",uvo);
	}

	@Override
	public int nameCheck(String uname) throws Exception {
		int result =  session.selectOne(namespace+".nameCheck",uname);
		return result;
	}

	@Override
	public int idCheck(String uid) throws Exception {
		return session.selectOne(namespace+".idCheck",uid);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		
		session.update(namespace+".keepLogin",paramMap);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return session.selectOne(namespace+".checkUserWithSessionKey",value);
	}

	@Override
	public UserVO userDetail(String uname) throws Exception {
		return session.selectOne(namespace+".userDetail",uname);
	}

	@Override
	public void follow(String uname, String myname) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uname", uname);
		paramMap.put("myname", myname);
		session.insert(namespace+".follow",paramMap);
		
	}

	@Override
	public List<UserVO> followList(String uid) throws Exception {
		List list = session.selectList(namespace+".followList",uid);
		return list;
	}

	@Override
	public List<UserVO> followerList(String uid) throws Exception {
		List list = session.selectList(namespace+".followerList",uid);
		return list;
	}
	
}
