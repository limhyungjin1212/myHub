package com.lhj.service;

import java.util.List;

import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

public interface ReviewService {
	// 댓글 조회
	public List<ReviewVO> repList(int pno) throws Exception;

	// 댓글 쓰기
	public void repWrite(ReviewVO rv) throws Exception;

	// 댓글 수정
	public void repModify(ReviewVO rv) throws Exception;

	// 댓글 삭제
	public void repDel(int pno) throws Exception;

	// 댓글 조회 페이징
	public List<ReviewVO> repListPage(int bno, Criteria cri) throws Exception;

	// 댓글 총 갯수
	public int repCount(int pno) throws Exception;
}
