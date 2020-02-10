package com.lhj.model;

import java.util.Arrays;

public class ReviewVO {
	private int pno,rno;
	private String pname;
	private String content , writer;
	private String rev_subject;
	private String regdate;
	private int rate;
	private String fn;
	private int helpful;
	private String[] files;
	private int urCnt; //리뷰의 작성자가 작성한 리뷰 총 갯수
	
	
	
	
	public int getUrCnt() {
		return urCnt;
	}
	public void setUrCnt(int urCnt) {
		this.urCnt = urCnt;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getHelpful() {
		return helpful;
	}
	public void setHelpful(int helpful) {
		this.helpful = helpful;
	}
	public String getRev_subject() {
		return rev_subject;
	}
	public void setRev_subject(String rev_subject) {
		this.rev_subject = rev_subject;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	
	
	public String getFn() {
		/*
		 * if(fn !=null) { String front = fn.substring(0,12); String end =
		 * fn.substring(14); System.out.println("리뷰VO"+front+end); return front+end; }
		 */
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	@Override
	public String toString() {
		return "ReviewVO [pno=" + pno + ", rno=" + rno + ", content=" + content + ", writer=" + writer
				+ ", rev_subject=" + rev_subject + ", regdate=" + regdate + ", rate=" + rate + ", fn=" + fn
				+ ", helpful=" + helpful + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
