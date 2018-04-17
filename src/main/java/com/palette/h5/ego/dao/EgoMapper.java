package com.palette.h5.ego.dao;

import java.util.ArrayList;

import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;
import com.palette.h5.vo.FileManagement;

public interface EgoMapper {

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
	
}
