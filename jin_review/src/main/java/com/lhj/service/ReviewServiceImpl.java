package com.lhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public void repWrite(ReviewVO rv) throws Exception {
		rm.repWrite(rv);
		
		System.out.println("review get files"+rv.getFiles());
		String[] files = rv.getFiles();
		if(files == null) {
			return;
		}
		for(String filename : files) {
			rm.revAddAttach(filename);
		}
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
	public List<ReviewVO> repListPage(int pno, Criteria cri) throws Exception {
		List list = rm.repListPage(pno, cri);
		return list;
	}

	@Override
	public int repCount(int pno) throws Exception {
		return rm.repCount(pno);
	}
	
}
