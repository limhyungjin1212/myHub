package com.my.dao;

import java.util.List;

import com.my.dto.MemberVO;

public interface MemberDAO {
	 public List<MemberVO> selectMember() throws Exception;
	 	
	}
