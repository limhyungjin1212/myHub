package com.my.service;

import java.util.List;

import com.my.dto.MemberVO;

public interface MemberService {
	public List<MemberVO> selectMember() throws Exception;
	
}
