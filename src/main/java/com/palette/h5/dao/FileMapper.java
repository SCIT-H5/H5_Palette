package com.palette.h5.dao;

import java.util.ArrayList;

import com.palette.h5.ego.vo.CertGrad;
import com.palette.h5.vo.FileManagement;

public interface FileMapper {
	
	// certGrad | certGrad 파일 업로드 : uploadAjax에서 fileId리스트 받은거대로 쫑쫑 등록하기
	public int insertCertGradOne(CertGrad certgrad);
	
	// certGrad | certGrad의 gradField(파일No) 불러오기
	public ArrayList<CertGrad> displayCertGrad(String gradId);
	
	// file_management | (공통) 파일 저장하기 by Ajax
	public int uploadAjax(FileManagement file);
	
	// file_management | 특정페이지(특정 fileDivision)에서 DB에 저장된 파일 불러오기
	public ArrayList<FileManagement> displayfile(FileManagement file);
	
	// file_management | 특정페이지(특정 fileDivision)에서 DB에 저장된 파일 삭제하기
	public int deleteFile(FileManagement file);
	
	// file_management | 해당 userId에 저장된 모든 파일 불러오기
	public ArrayList<FileManagement> getAlldataById(String fileUserId);
	
	// file_management | 
	public int getCurrentSeqFFM();

}
