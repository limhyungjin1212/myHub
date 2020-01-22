package com.lhj.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			session.update(namespace+".repModify",rv);
		}

	@Override
	public void repDel(int rno) throws Exception {
		session.delete(namespace+".repDel",rno);
	}

	@Override
	public List<ReviewVO> repListPage(int pno, Criteria cri) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		param.put("pno", pno);
		param.put("cri", cri);
		
		List pagelist = session.selectList(namespace+".repListPage",param);
		System.out.println("pagelist="+pagelist);
		return pagelist;
	}

	@Override
	public int repCount(int pno) throws Exception {
		int cnt = session.selectOne(namespace+".repCount",pno); 
		return cnt;
	}

	@Override
	public void revAddAttach(String filename) throws Exception {
		session.insert(namespace+"revAddAttach",filename);
	}
	
	
	

}
