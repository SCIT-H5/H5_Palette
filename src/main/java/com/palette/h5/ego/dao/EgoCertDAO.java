package com.palette.h5.ego.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.CertCertificate;
import com.palette.h5.ego.vo.CertLect;
import com.palette.h5.ego.vo.CertProject;

@Repository
public class EgoCertDAO {

	private static final Logger logger = LoggerFactory.getLogger(EgoCertDAO.class);

	@Autowired
	SqlSession sqlSession;

	// 프로젝트 리스트 작성
	public void projectWrite_One(CertProject CertProject) {
		logger.info("다오에 넘어온 값 " + CertProject);

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			mapper.projectWrite_One(CertProject);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 프로젝트 리스트 출력
	public ArrayList<CertProject> projectList(String proId) {
		ArrayList<CertProject> list = null;

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		logger.info("다오의 아이디 " + proId);
		try {

			list = mapper.projectList(proId);
			logger.info("들어갔다온 후 " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 프로젝트 디테일 글 하나 출력
	public CertProject projectdetail_One(int proNum) {
		CertProject result = null;

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		logger.info("다오의 아이디 " + proNum);
		try {

			result = mapper.projectdetail_One(proNum);
			logger.info("들어갔다온 후 " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	//이수과목 쓰기
	public int certLectWrite(CertLect certLect) {
		logger.info("DAO | 이수과목 작성 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			logger.info(certLect.toString());
			result = mapper.certLectWrite(certLect);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("DAO | 이수과목 작성 종료");
		return result;
	}

	// 이수과목 읽기
	public CertLect certLectRead(String lectId) {
		logger.info("DAO | 이수과목 읽기 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		CertLect lect = null;

		try {
			lect = mapper.certLectRead(lectId);
		} catch (Exception e) {
			// TODO: handle exception
		}

		logger.info("DAO | 이수과목 읽기 종료");
		return lect;
	}
	
	// 이수과목 수정
	public int certLectUpdate(CertLect certLect) {
		logger.info("DAO | 이수과목 업데이트 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.certLectUpdate(certLect);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("DAO | 이수과목 업데이트 종료");
		return result;
	}

	public int certificateWrite(HashMap<String, String> certficateMap) {
		// TODO Auto-generated method stub
		logger.info("자격증명 작성 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			logger.info(certficateMap.toString());
			result = mapper.certificateWrite(certficateMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("자격증명 작성 종료");
		return result;
	}

	public CertCertificate certificateRead(String certId) {
		// TODO Auto-generated method stub
		logger.info("자격증명 읽기 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		CertCertificate certficatevalue = null;

		try {
			certficatevalue = mapper.certificateRead(certId);
		} catch (Exception e) {
			// TODO: handle exception
		}

		logger.info("자격증명 읽기 시작");
		return certficatevalue;
	}

	public int certificateUpdate(HashMap<String, String> certficateMap) {
		// TODO Auto-generated method stub
		logger.info("자격증명 업데이트 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.certificateUpdate(certficateMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("자격증명 업데이트 종료");
		return result;
	}

	public void projectUpdate(CertProject certProject) {

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			mapper.projectUpdate(certProject);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
