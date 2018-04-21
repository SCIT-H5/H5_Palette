package com.palette.h5.ego.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.palette.h5.ego.vo.History;
import com.palette.h5.ego.vo.Swot;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;
import com.palette.h5.vo.FileManagement;

public interface EgoMapper {
	
	// HISTORY | 전체 데이터 가져오기
	public ArrayList<History> historyDataAll(String hisId);
	
	// HISTORY | 연도LIST 가져오기
	public ArrayList<String> historyYearList(String hisId);
	
	// HISTORY | 데이터 추가하기
	public int historyAddOne(History history);
	
	// HISTORY | 데이터 수정하기
	public int historyUpdateOne(History history);
	
	// HISTORY | 데이터 삭제하기
	public int historyDeleteOne(History history);

	int file_management(FileManagement filemanagement);
	//프로젝트 리스트 작성
	void projectWrite_One(CertProject CertProject);
	//프로젝트 리스트 출력
	ArrayList<CertProject> projectList(String proId);
	//프로젝트 디테일 글 하나 출력(프로젝트 테이블에서)
	CertProject projectdetail_One(int proNum);
	//프로젝트 디테일 글 수정 / 작성
	void projecDetailtWrite(CertProjectDetail CertProjectDetail);
	//프로젝트 디테일 글 하나 출력(프로젝트 디테일 테이블에서)
	CertProjectDetail projecDetail_one_one(int proDetailNum);
	
	//swot분석 글 출력
	Swot readswot(String swotId);
	
	//swot분석 글 작성
	int writeswot(Swot swot);
	
	//swot분석 글 수정
	int updateswot(Swot swot);
	
	//swot분석 글 삭제
	int deleteswot(String swotId);

	//certification write
	public int certificateWrite(HashMap<String, String> certficateMap);
	
}
