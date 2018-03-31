package com.palette.h5.vo;

public class Userinfo {

	String userId;
	String userPw;
	String userName;
	String userEmail;
	
	public Userinfo() {
		super();
	}

	public Userinfo(String userId, String userPw, String userName, String userEmail) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
	}

	@Override
	public String toString() {
		return "Userinfo [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
	
}
