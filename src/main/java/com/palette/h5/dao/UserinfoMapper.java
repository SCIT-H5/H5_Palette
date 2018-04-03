package com.palette.h5.dao;

import com.palette.h5.vo.Userinfo;

public interface UserinfoMapper {

	public int join(Userinfo userinfo);							// 회원가입
	
	public Userinfo getUserinfoById(String userId);			// 아이디로 유저정보 받아오기

	public Userinfo getUserinfoByEmail(String userEmail);		// 이메일로 유저정보 받아오기
}
