package com.palette.h5.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.vo.Portfolio;

@Repository
public class PortfolioDAO {
	
	@Autowired
	SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioDAO.class);
	
	public int portSave(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 저장 시작");
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.portSave(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 저장 종료");
		return result;
	}
	
	public Portfolio portSelectOne(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 하나 불러오기 시작");
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		
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
