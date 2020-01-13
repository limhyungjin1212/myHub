package com.lhj.mapper;

import java.util.List;

import com.lhj.model.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardList() throws Exception;
	
	public void boardWrite(BoardVO board) throws Exception;
	
	public void boardUpdate(BoardVO board) throws Exception;
	
	public void boardDelete(int num) throws Exception;
}
