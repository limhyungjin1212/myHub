package com.lhj.model;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	
	private int pno;
	private String pname;
	private String pcate;
	private String ptel;
	private String pinfo;
	private String regdate;
	private String place;
	
	private String fn;
	private float rate;
	private String[] files;
	
	
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public String getPtel() {
		return ptel;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", pname=" + pname + ", pcate=" + pcate + ", ptel=" + ptel + ", pinfo=" + pinfo
				+ ", regdate=" + regdate + ", place=" + place + ", fn=" + fn + ", files=" + Arrays.toString(files)
				+ "]";
	}
	
	
}
