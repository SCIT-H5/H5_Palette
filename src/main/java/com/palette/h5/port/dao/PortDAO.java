package com.palette.h5.port.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.vo.Portfolio;

@Repository
public class PortDAO {
	
	@Autowired
	SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(PortDAO.class);
	
	public int portSave(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 저장 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.portSave(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 저장 종료");
		return result;
	}
	
	public int portUpdate(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 수정 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.portUpdate(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 수정 종료");
		return result;
	}
	
	public ArrayList<Portfolio> portList(String portId){
		logger.info("DAO | 포트폴리오 리스트 불러오기 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		ArrayList<Portfolio> portList = null;
		
		try {
			portList = mapper.portList(portId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 리스트 불러오기 종료");
		return portList;
	}
	
	public Portfolio portSelectOne(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 하나 불러오기 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		Portfolio port = null;
		
		try {
			port = mapper.portSelectOne(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 하나 불러오기 종료");
		return port;
	}
}
