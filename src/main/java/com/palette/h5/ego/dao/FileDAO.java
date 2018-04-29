package com.palette.h5.ego.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.dao.FileMapper;
import com.palette.h5.ego.vo.CertGrad;
import com.palette.h5.ego.vo.CertScholarship;
import com.palette.h5.vo.FileManagement;

@Repository
public class FileDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(FileDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	// certGrad | certGrad 파일 업로드 : uploadAjax에서 fileId리스트 받은거대로 쫑쫑 등록하기
	public int insertCertGradOne(CertGrad certgrad){
		
		logger.info("DAO | certGrad 파일 업로드 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.insertCertGradOne(certgrad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | certGrad 파일 업로드 종료");
		return result;
	}
	
	// certGrad | certGrad의 gradField(파일No) 불러오기
	public ArrayList<CertGrad> displayCertGrad(String gradId){
		
		logger.info("DAO | certGrad gradFileId(파일No)불러오기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		ArrayList<CertGrad> gradFileIdList = null;
		
		try {
			gradFileIdList = mapper.displayCertGrad(gradId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | certGrad gradFileId(파일No)불러오기 종료");
		return gradFileIdList;
	}
	
	// certGrad | certGrad의 data 삭제
	public int deleteCertGrad(String gradId){
		
		logger.info("DAO | certGrad 삭제하기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.deleteCertGrad(gradId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | certGrad 삭제하기 종료");
		return result;
	}
	
	// certSch | certSch 파일 업로드
	public int insertCertSch(CertScholarship certsch){
		
		logger.info("DAO | certScholarship 파일 업로드 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.insertCertSch(certsch);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | certScholarship 파일 업로드 종료");
		return result;
		
	}
	
	// certSch | certScholarship의 gradField(파일No) 불러오기
	public ArrayList<CertScholarship> displayCertSch(String schId){
		
		logger.info("DAO | CertScholarship schFileId(파일No)불러오기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		ArrayList<CertScholarship> schFileNoList = null;
		
		try {
			schFileNoList = mapper.displayCertSch(schId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | CertScholarship schFileId(파일No)불러오기 종료");
		return schFileNoList;
	}
	
	
	// certSch | certScholarship의 data 삭제
	public int deleteCertSch(String schId){
		
		logger.info("DAO | CertScholarship 삭제하기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.deleteCertSch(schId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | CertScholarship 삭제하기 종료");
		return result;
	}
	
	
	
	// file_management | (공통) 파일 저장하기 by Ajax
	public int uploadAjax(FileManagement file){
		
		logger.info("DAO | fileManagement fileUpload by Ajax 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.uploadAjax(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | fileManagement fileUpload by Ajax 종료");
		return result;
	}
	
	// file_management | 특정페이지(특정 fileDivision)에서 DB에 저장된 파일 불러오기
	public ArrayList<FileManagement> displayfile(FileManagement file){
		
		logger.info("DAO | fileManagement file 불러오기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		ArrayList<FileManagement> fileListByDivision = null;
		System.out.println(file);
		try {
			fileListByDivision = mapper.displayfile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | fileManagement file 불러오기 종료");
		return fileListByDivision;
	}
	
	
	// file_management | 특정페이지(특정 fileDivision)에서 DB에 저장된 파일 삭제하기
	public int deleteFile(FileManagement file){

		logger.info("DAO | fileManagement file 삭제하기 시작");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		int result = 0;
		
		try {
			result = mapper.deleteFile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | fileManagement file 삭제하기 종료");
		return result;
	}
	
	
	// file_management | 해당 userId에 저장된 모든 파일 불러오기
	public ArrayList<FileManagement> getAlldataById(String fileUserId){
		logger.info("DAO | fileManagement 해당 userId로 저장된 모든 파일 불러오기 시작 ");
		FileMapper mapper = sqlSession.getMapper(FileMapper.class);
		ArrayList<FileManagement> allFile = null;
		
		try {
			allFile = mapper.getAlldataById(fileUserId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DAO | fileManagement 해당 userId로 저장된 모든 파일 불러오기 종료 ");
		return allFile;
	}
	
	
	
	
}
