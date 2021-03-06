package com.lhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhj.mapper.ReviewMapper;
import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper rm;
	
	@Override
	public List<ReviewVO> repList(int pno) throws Exception {
		return rm.repList(pno);
	}

	@Override
	public void repWrite(ReviewVO rv) throws Exception {
		rm.repWrite(rv);
	}

	@Override
	public void repModify(ReviewVO rv) throws Exception {
		rm.repModify(rv);
	}

	@Override
	public void repDel(int rno) throws Exception {
		rm.repDel(rno);
	}

	@Override
	public List<ReviewVO> repListPage(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int repCount(int pno) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
