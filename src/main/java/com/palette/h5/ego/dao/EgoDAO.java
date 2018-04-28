package com.palette.h5.ego.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.Activity;
import com.palette.h5.ego.vo.History;
import com.palette.h5.ego.vo.Personality;
import com.palette.h5.ego.vo.PersonalityList;
import com.palette.h5.ego.vo.Skill;
import com.palette.h5.ego.vo.Swot;
import com.palette.h5.vo.FileManagement;
import com.palette.h5.vo.Userinfo;

@Repository
public class EgoDAO {

	private static final Logger logger = LoggerFactory.getLogger(EgoDAO.class);

	@Autowired
	SqlSession sqlSession;

	// 파일 저장하기
	public int file_management(FileManagement filemanagement) {

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.file_management(filemanagement);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 프로젝트 파일 수정하기
	public int proFileUpdate(FileManagement fileManagement) {
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.proFileUpdate(fileManagement);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 파일 하나 불러오기
	public FileManagement fileSelectOne(int file_id) {
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		FileManagement file = null;

		try {
			file = mapper.fileSelectOne(file_id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return file;
	}

	// swot분석 글 보기
	public Swot readswot(String swotId) {

		Swot result = null;

		System.out.println("다오에 넘어온 값 " + swotId);

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			result = mapper.readswot(swotId);
			System.out.println("등록된 아이디로 가져온 값 : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// swot분석 글 작성
	public int writeswot(Swot swot) {

		int result = 0;

		System.out.println("다오에 넘어온 값 " + swot);

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			result = mapper.writeswot(swot);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// swot분석 글 수정
	public int updateswot(Swot swot) {

		int result = 0;

		System.out.println("다오에 넘어온 수정 할 값 " + swot);

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			result = mapper.updateswot(swot);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// swot분석 글 삭제
	public int deleteswot(String swotId) {

		int result = 0;

		System.out.println("다오에 넘어온 수정 할 값 " + swotId);

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			result = mapper.deleteswot(swotId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 성격분석 리스트 불러오기
	public ArrayList<PersonalityList> personalityList() {

		ArrayList<PersonalityList> list = null;
		logger.info("DAO | 성격분석리스트 불러오기");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		try {

			list = mapper.personalityList();

		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 성격분석리스트 불러오기 종료");
		return list;
	}

	// 성격분석 작성
	public int personalityWrite(Personality personality) {
		
		logger.info("DAO | 성격분석 작성");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;
		try {

			result = mapper.personalityWrite(personality);

		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 성격분석 작성 종료");
		return result;
	}

	//성격분석 수정
	public int personalityUpdate(Personality personality) {
		logger.info("DAO | 성격분석 수정");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;
		try {

			result = mapper.personalityUpdate(personality);

		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 성격분석 수정 종료");
		return result;
	}
	
	// 저장한 성격 불러오기
	public ArrayList<Personality> personalitySelect(Personality personality) {
		logger.info("DAO | 성격분석 불러오기");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		ArrayList<Personality> pers = null;
		try {

			pers = mapper.personalitySelect(personality);

		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO | 성격분석 불러오기 종료");
		return pers;
	}

	//스킬 리드
	public Skill skillRead(String userId) {
		// TODO Auto-generated method stub
		logger.info("DAO | 스킬 불러오기 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		Skill skillobject = null;

		try {
			skillobject = mapper.skillRead(userId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		logger.info("DAO | 스킬 불러오기 종료");
		return skillobject;
	}

	//스킬쓰기
	public void skillWrite(HashMap<String, Object> skillmap) {
		// TODO Auto-generated method stub
		logger.info("DAO | 스킬 쓰기 시작");

		System.out.println(skillmap);

		Skill skillobject = null;

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		skillobject = mapper.skillRead(skillmap.get("skillid").toString());

		try {

			if (skillobject == null) {
				logger.info("스킬 작성");
				mapper.skillWrite(skillmap);
			} else {
				logger.info("스킬 업데이트");
				mapper.skillUpdate(skillmap);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("DAO | 스킬 쓰기 종료");
	}

	// 회원 정보 수정
	public int userEdit(Userinfo userinfo) {
		System.out.println("들어온 " + userinfo);
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.userEdit(userinfo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 활동내역 읽기
	public Activity activityRead(String actId) {
		// TODO Auto-generated method stub
		logger.info("DAO | 활동내역 읽기 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		Activity activity = null;

		try {
			activity = mapper.activityRead(actId);
		} catch (Exception e) {
			// TODO: handle exception
		}

		logger.info("DAO | 활동내역 읽기 시작");
		return activity;
	}

	// 활동내역 수정
	public int activityUpdate(Activity activity) {
		// TODO Auto-generated method stub
		logger.info("DAO | 활동내역 수정 시작");

		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			result = mapper.activityUpdate(activity);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("DAO | 활동내역 수정 종료");
		return result;
	}
	
	// 활동내역 쓰기
	public int activityWrite(Activity activity) {
		// TODO Auto-generated method stub
		logger.info("DAO | 활동내역 작성 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);

		int result = 0;

		try {
			logger.info(activity.toString());
			result = mapper.activityWrite(activity);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		logger.info("DAO | 활동내역 작성 종료");
		return result;
	}
	
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
	
	// HISTORY | 해당 year별로 데이터들 불러오기
	public ArrayList<History> historyDataPerYear(History history){
		
		logger.info("DAO | history 해당 year별로 데이터들 불러오기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		ArrayList<History> dataPerYear = null;
		
		try{
			dataPerYear = mapper.historyDataPerYear(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("DAO | history 해당 year별로 데이터들 불러오기 종료");
		return dataPerYear;
	}
	
	
	// HISTORY | 연도별 데이터 수 세기
	public ArrayList<History> countDataPerYear(History history){
		
		logger.info("DAO | history 연도별 데이터 수 세기 시작");
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		ArrayList<History> countPY = null;
		
		try{
			countPY = mapper.countDataPerYear(history);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		logger.info("DAO | history 연도별 데이터 수 세기 종료");
		return countPY;
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

	//히스토리 하나 가져오기
	public History historyonselect(int selecthisNo) {
		// TODO Auto-generated method stub
		logger.info("DAO | history 데이터 하나 가져오기 시작");
		
		EgoMapper mapper = sqlSession.getMapper(EgoMapper.class);
		
		History selecthistory = null;
		
		//System.out.println(selecthisNo +"받아온 글번호");
		
		try {
			selecthistory = mapper.historyonselect(selecthisNo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		//System.out.println(selecthistory + "디비갔다온 HISTORY");
		
		logger.info("DAO | history 데이터 하나 가져오기 종료");
		return selecthistory;
	}


}
