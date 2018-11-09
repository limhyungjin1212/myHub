package com.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.my.dao.MemberDAO;
import com.my.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	 @Inject
	    private MemberDAO dao;
	    
	    @Override
	    public List<MemberVO> selectMember() throws Exception {
	 
	        return dao.selectMember();
	    }


}
