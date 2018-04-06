package com.palette.h5.vo;

public class FileManagement {

	int file_id;
	String originalFileName;
	String savedFileName;
	
	public FileManagement() {
		super();
	}

	public FileManagement(int file_id, String originalFileName, String savedFileName) {
		super();
		this.file_id = file_id;
		this.originalFileName = originalFileName;
		this.savedFileName = savedFileName;
	}

	@Override
	public String toString() {
		return "FileManagement [file_id=" + file_id + ", originalFileName=" + originalFileName + ", savedFileName="
				+ savedFileName + "]";
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getSavedFileName() {
		return savedFileName;
	}

	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}
	
	
}
