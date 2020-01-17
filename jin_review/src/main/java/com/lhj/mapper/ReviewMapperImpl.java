package com.lhj.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

@Repository
public class ReviewMapperImpl implements ReviewMapper {

	@Autowired
	private SqlSession session;
	private static final String namespace ="com.lhj.mapper.ReviewMapper";
	
	
	@Override
	public List<ReviewVO> repList(int pno) throws Exception {
		List list = session.selectList(namespace+".repList",pno);
		return list;
	}

	@Override
	public void repWrite(ReviewVO rv) throws Exception {
		session.insert(namespace+".repWrite",rv);
	}

	@Override
	public void repModify(ReviewVO rv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void repDel(int pno) throws Exception {
		// TODO Auto-generated method stub
		
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
