package com.palette.h5.ego.dao;

import java.util.ArrayList;

import com.palette.h5.ego.vo.History;
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

	// file management
	public int file_management(FileManagement filemanagement);
}
