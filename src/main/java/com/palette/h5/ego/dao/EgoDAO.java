package com.palette.h5.ego.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;
import com.palette.h5.vo.FileManagement;

@Repository
public class EgoDAO {
	
	@Autowired
	SqlSession session;
	
	public int file_management(FileManagement filemanagement){
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.file_management(filemanagement);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	//프로젝트 리스트 작성
	public void projectWrite_One(CertProject CertProject){
		System.out.println("다오에 넘어온 값 "+CertProject);
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		
		try {
			
			mapper.projectWrite_One(CertProject);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//프로젝트 리스트 출력
	public ArrayList<CertProject> projectList(String proId){
		ArrayList<CertProject> list = null;
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		System.out.println("다오의 아이디 "+proId);
		try {
			
			list = mapper.projectList(proId);
			System.out.println("들어갔다온 후 "+list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//프로젝트 디테일 글 하나 출력
	public CertProject projectdetail_One(int proNum){
		CertProject result = null;
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		System.out.println("다오의 아이디 "+proNum);
		try {
			
			result = mapper.projectdetail_One(proNum);
			System.out.println("들어갔다온 후 "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//프로젝트 디테일 글 하나 출력( CertProjectDetail 테이블로 부터)
		public CertProjectDetail projecDetail_one_one(int proNum){
			CertProjectDetail result = null;
			
			EgoMapper mapper = session.getMapper(EgoMapper.class);
			System.out.println("다오의 아이디 "+proNum);
			try {
				
				result = mapper.projecDetail_one_one(proNum);
				System.out.println("들어갔다온 후 "+result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	//프로젝트 디테일 글 수정 / 작성
	public void projecDetailtWrite(CertProjectDetail CertProjectDetail){
		
		System.out.println("다오에 넘어온 값 "+CertProjectDetail);
		
		EgoMapper mapper = session.getMapper(EgoMapper.class);
		
		try {
			
			mapper.projecDetailtWrite(CertProjectDetail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

	
}
