package com.palette.h5.port.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.Reply;
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
	
	public int portDelete(Portfolio portfolio){
		logger.info("DAO | 포트폴리오 삭제 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.portDelete(portfolio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 포트폴리오 삭제 종료");
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
	
	//리플 작성
	public int commentwrite(Reply reply){
		int result = 0;
		
		logger.info("DAO | 리플 작성 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		
		
		try {
			
			result = mapper.commentwrite(reply);
			System.out.println("갔다온 결과 :"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 리플 작성 종료");
		
		return result;
		
	}
	//리플 출력 
	public ArrayList<Reply>commentView(int replyportNum){
		ArrayList<Reply> result = null;
		logger.info("DAO | 리플 출력 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		
		
		try {
			
			result = mapper.commentView(replyportNum);
			System.out.println("갔다온 결과 :"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 리플 출력 종료");
		
		return result;
	}
	//리플 수정
	public int commentUpdate(Reply reply){
		
		int result = 0;
		
		logger.info("DAO | 리플 수정 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		
		
		try {
			System.out.println("수정할 리플의 정보"+reply);
			result = mapper.commentUpdate(reply);
			System.out.println("갔다온 결과 :"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 리플 수정 종료");
		
		return result;
	}
	
	//리플 삭제
	public int commentDel(Reply reply){
		
		int result = 0;
		
		logger.info("DAO | 리플 삭제 시작");
		PortMapper mapper = session.getMapper(PortMapper.class);
		
		
		
		try {
			System.out.println("삭제 리플의 정보"+reply);
			result = mapper.commentDel(reply);
			System.out.println("갔다온 결과 :"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 리플 삭제 종료");
		
		return result;
	}
}
