package com.lhj.mapper;

import java.util.List;

import com.lhj.model.Criteria;
import com.lhj.model.ReviewVO;

public interface ReviewMapper {
	//댓글 조회
		public List<ReviewVO> repList(int pno) throws Exception;
		
		//댓글 쓰기
		public void repWrite(ReviewVO rv) throws Exception;
		
		//댓글 수정
		public void repModify(ReviewVO rv) throws Exception;
		
		//댓글 삭제
		public void repDel(int rno) throws Exception;
		
		//댓글 조회 페이징
		public List<ReviewVO> repListPage(int pno,Criteria cri) throws Exception;
		
		//댓글 총 갯수
		public int repCount(int pno) throws Exception;
		
		
		public int revCount() throws Exception;
		//댓글 조회 페이징
		public List<ReviewVO> revListPage(Criteria cri) throws Exception;
		
		//리뷰 쓸때 파일 업로드
		public void revAddAttach(String filename) throws Exception;
		
		//한 작성자 댓글 총 갯수와 도움이 된수
		public List<Integer> revCntHelpful(String writer) throws Exception;
		
		//도움이 된 수 증가
		public void HelpfulAdd(int rno) throws Exception;
		
		//도움이 된 수 감소
		public void Helpfuldis(int rno) throws Exception;
		
}
