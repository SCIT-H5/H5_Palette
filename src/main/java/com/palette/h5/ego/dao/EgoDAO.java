package com.palette.h5.ego.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.vo.FileManagement;

@Repository
public class EgoDAO {
	
	@Autowired
	SqlSession session;
	
	public int file_management(FileManagement filemanagement){
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.file_management(filemanagement);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	

	
}
