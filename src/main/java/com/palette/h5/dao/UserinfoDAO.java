package com.palette.h5.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.vo.Userinfo;

@Repository
public class UserinfoDAO {

	@Autowired
	SqlSession session;
	
	/**
	 * 	ID로 회원정보 검색
	 * 	@param id
	 * 	@return userinfo
	 */
	public Userinfo getUserinfoById(String id){
		
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
					
		Userinfo result = null;
		
		try {
			result = mapper.getUserinfoById(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}

	/**
	 * 이메일이 일치하는 회원 정보를 받아온다.
	 * @param id
	 * @return userinfo
	 */
	public Userinfo getUserinfoByEmail(String email) {
		
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		Userinfo result = null;
		
		try {
			result = mapper.getUserinfoByEmail(email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	/**
	 * 	회원 가입
	 * 	@param userinfo 회원정보
	 * 	@return 0 또는 1
	 */
	public int join(Userinfo userinfo){
		
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.join(userinfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
}
