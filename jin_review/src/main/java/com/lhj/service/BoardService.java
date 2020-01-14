package com.lhj.service;

import java.util.List;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;

public interface BoardService {
	public List<BoardVO> boardList() throws Exception;

	public void boardWrite(BoardVO board) throws Exception;

	public void boardUpdate(BoardVO board) throws Exception;

	public void boardDelete(int num) throws Exception;

	public List<BoardVO> boardListPage(Criteria cri) throws Exception;

	public int boardCount(Criteria cri) throws Exception;
}
