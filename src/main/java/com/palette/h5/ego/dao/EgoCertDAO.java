package com.palette.h5.ego.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;

@Repository
public class EgoCertDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(EgoCertDAO.class);

	
	@Autowired
	SqlSession sqlSession;

	
	//프로젝트 리스트 작성
	public void projectWrite_One(CertProject CertProject){
		logger.info("다오에 넘어온 값 "+CertProject);
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		
		try {
			
			mapper.projectWrite_One(CertProject);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//프로젝트 리스트 출력
	public ArrayList<CertProject> projectList(String proId){
		ArrayList<CertProject> list = null;
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		logger.info("다오의 아이디 "+proId);
		try {
			
			list = mapper.projectList(proId);
			logger.info("들어갔다온 후 "+list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//프로젝트 디테일 글 하나 출력
	public CertProject projectdetail_One(int proNum){
		CertProject result = null;
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		logger.info("다오의 아이디 "+proNum);
		try {
			
			result = mapper.projectdetail_One(proNum);
			logger.info("들어갔다온 후 "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//프로젝트 디테일 글 하나 출력( CertProjectDetail 테이블로 부터)
		public CertProjectDetail projecDetail_one_one(int proNum){
			CertProjectDetail result = null;
			
			EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
			logger.info("다오의 아이디 "+proNum);
			try {
				
				result = mapper.projecDetail_one_one(proNum);
				logger.info("들어갔다온 후 "+result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	//프로젝트 디테일 글 수정 / 작성
	public void projecDetailtWrite(CertProjectDetail CertProjectDetail){
		logger.info("다오에 넘어온 값 "+CertProjectDetail);

		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		
		try {
			
			mapper.projecDetailtWrite(CertProjectDetail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int certificateWrite(HashMap<String, String> certficateMap) {
		// TODO Auto-generated method stub
		logger.info("자격증명 작성 시작");
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result=0;
		
		try {
			result = mapper.certificateWrite(certficateMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		logger.info("자격증명 작성 종료");
		return result;
	}

}
