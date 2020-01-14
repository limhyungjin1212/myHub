package com.lhj.model;

public class UserVO {
	private String uid,upw,uname,umail,gender;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
	public String getUmail() {
		return umail;
	}

	public void setUmail(String umail) {
		this.umail = umail;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", umail=" + umail + ", gender=" + gender
				+ "]";
	}
	
}
