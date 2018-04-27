package com.palette.h5.ego.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.palette.h5.ego.vo.History;
import com.palette.h5.ego.vo.PersonalityList;
import com.palette.h5.ego.vo.Skill;
import com.palette.h5.ego.vo.Swot;
import com.palette.h5.ego.vo.Activity;
import com.palette.h5.ego.vo.CertCertificate;
import com.palette.h5.ego.vo.CertLect;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.vo.FileManagement;
import com.palette.h5.vo.Userinfo;

public interface EgoMapper {

	// 파일 저장
	int file_management(FileManagement filemanagement);

	// 프로젝트 파일 수정
	public int proFileUpdate(FileManagement fileManagement);

	// 파일 하나 불러오기
	public FileManagement fileSelectOne(int file_id);

	// 프로젝트 리스트 작성
	void projectWrite_One(CertProject CertProject);

	// 프로젝트 리스트 출력
	ArrayList<CertProject> projectList(String proId);

	// 프로젝트 디테일 글 하나 출력(프로젝트 테이블에서)
	CertProject projectdetail_One(int proNum);

	// 프로젝트 수정
	void projectUpdate(CertProject certProject);

	// swot분석 글 출력
	Swot readswot(String swotId);

	// swot분석 글 작성
	int writeswot(Swot swot);

	// swot분석 글 수정
	int updateswot(Swot swot);

	// swot분석 글 삭제
	int deleteswot(String swotId);

	// 이수과목 쓰기
	public int certLectWrite(CertLect certLect);

	// 이수과목 읽기
	public CertLect certLectRead(String lectId);

	// 이수과목 수정
	public int certLectUpdate(CertLect certLect);

	// certification write
	public int certificateWrite(HashMap<String, String> certficateMap);

	// certification read
	public CertCertificate certificateRead(String certId);

	// certification update
	public int certificateUpdate(HashMap<String, String> certficateMap);

	// 성격분석 성격리스트 불러오기
	ArrayList<PersonalityList> personalityList();

	// 활동내역 쓰기
	public int activityWrite(Activity activity);

	// 활동내역 읽기
	public Activity activityRead(String actId);

	// 활동내역 수정
	public int activityUpdate(Activity activity);

	// 회원 정보 수정
	public int userEdit(Userinfo userinfo);

	// 스킬 리드
	public Skill skillRead(String userId);

	// 스킬 라이트
	public void skillWrite(HashMap<String, Object> skillmap);

	// 스킬 업데이트
	public void skillUpdate(HashMap<String, Object> skillmap);

	// HISTORY | 전체 데이터 가져오기
	public ArrayList<History> historyDataAll(String hisId);

	// HISTORY | 연도LIST 가져오기 <중복X>
	public ArrayList<String> historyYearList(String hisId);

	// HISTORY | 특정 hisNo에 해당하는 데이터 가져오기
	public History selectHistoryOne(History history);

	// HISTORY | 해당 year별로 데이터들 불러오기
	public ArrayList<History> countDataPerYear(History history);

	// HISTORY | 해당 year별로 데이터들 불러오기
	public ArrayList<History> historyDataPerYear(History history);

	// HISTORY | 데이터 추가하기
	public int historyAddOne(History history);

	// HISTORY | 데이터 수정하기
	public int historyUpdateOne(History history);

	// HISTORY | 데이터 삭제하기
	public int historyDeleteOne(History history);

<<<<<<< HEAD
	// HISTORY | selectone
	public History historyonselect(int hisNo);

=======
	// file management
	public int file_management(FileManagement filemanagement);

	//selectone
	public History historyonselect(int hisNo);
>>>>>>> 서현local
}
