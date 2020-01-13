package com.lhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhj.mapper.BoardMapper;
import com.lhj.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bm;
	
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return bm.boardList();
	}

	@Override
	public void boardWrite(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardUpdate(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
