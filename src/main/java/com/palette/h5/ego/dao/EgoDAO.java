package com.palette.h5.ego.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.History;
import com.palette.h5.vo.FileManagement;

@Repository
public class EgoDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EgoDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	// HISTORY | 전체 데이터 가져오기
	public ArrayList<History> historyDataAll(String hisId){
		
		logger.info("DAO | history 전체 데이터 가져오기 시작");
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		ArrayList<History> historyAll = null;
		
		try{
			historyAll = mapper.historyDataAll(hisId);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("DAO | history 전체 데이터 가져오기 종료");
		return historyAll;
	}
		
	// HISTORY | 연도LIST 가져오기
	public ArrayList<String> historyYearList(String hisId){
		
		logger.info("DAO | history 연도List 가져오기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		ArrayList<String> yearList = null;
		
		try{
			yearList = mapper.historyYearList(hisId);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("DAO | history 연도List 가져오기 종료");
		return yearList;
	}
	
	// HISTORY | 특정 hisNo에 해당하는 데이터 가져오기
	public History selectHistoryOne(History history){
		
		logger.info("DAO | history 특정 hisNo의 데이터 가져오기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		History hisOne = null;
		
		try{
			hisOne = mapper.selectHistoryOne(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("DAO | history 특정 hisNo의 데이터 가져오기 종료");
		return hisOne;
	}
	
		
	// HISTORY | 데이터 추가하기
	public int historyAddOne(History history){
		
		logger.info("DAO | history 데이터 추가하기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		int result = 0;
		
		try{
			result = mapper.historyAddOne(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("DAO | history 데이터 추가하기 종료");
		return result;
		
	}
		
	// HISTORY | 데이터 수정하기
	public int historyUpdateOne(History history){
		
		logger.info("DAO | history 데이터 수정하기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		int result = 0;
		
		try{
			result = mapper.historyUpdateOne(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("DAO | history 데이터 수정하기 종료");
		return result;
	}
		
	// HISTORY | 데이터 삭제하기
	public int historyDeleteOne(History history){
		
		logger.info("DAO | history 데이터 삭제하기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		int result = 0;
		
		try{
			result = mapper.historyDeleteOne(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("DAO | history 데이터 삭제하기 종료");
		return result;
		
	}
	
	
	
	
	
	
	
	public int file_management(FileManagement filemanagement){
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.file_management(filemanagement);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	

	
}
