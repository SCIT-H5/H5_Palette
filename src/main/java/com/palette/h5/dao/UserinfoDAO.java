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
	 * 	@param id 검색할 아이디
	 * 	@return 검색된 회원정보. 없으면 null.
	 */
	public Userinfo login(String userId){
		
		UserinfoMapper mapper = session.getMapper(UserinfoMapper.class);
					
		Userinfo result = null;
		
		try {
			result = mapper.login(userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
}
