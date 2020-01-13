package com.lhj.model;

import java.util.Arrays;

public class BoardVO {
	
	private int pno;
	private String pname;
	private String pcate;
	private String ptel;
	private String pinfo;
	private String[] pfiles;
	
	
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
	public String[] getPfiles() {
		return pfiles;
	}
	public void setPfiles(String[] pfiles) {
		this.pfiles = pfiles;
	}
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", pname=" + pname + ", pcate=" + pcate + ", ptel=" + ptel + ", pinfo=" + pinfo
				+ ", pfiles=" + Arrays.toString(pfiles) + "]";
	}
	
	
}
