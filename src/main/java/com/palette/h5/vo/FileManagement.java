package com.palette.h5.vo;

public class FileManagement {

	public int file_id;
	public String originalFileName;
	public String savedFileName;
	public int fileDivision;
	public String fileUserId;
	public int idx;
	
	public FileManagement() {
	}

	public FileManagement(int file_id, String originalFileName, String savedFileName, int fileDivision,
			String fileUserId) {
		this.file_id = file_id;
		this.originalFileName = originalFileName;
		this.savedFileName = savedFileName;
		this.fileDivision = fileDivision;
		this.fileUserId = fileUserId;
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

	public int getFileDivision() {
		return fileDivision;
	}

	public void setFileDivision(int fileDivision) {
		this.fileDivision = fileDivision;
	}

	public String getFileUserId() {
		return fileUserId;
	}

	public void setFileUserId(String fileUserId) {
		this.fileUserId = fileUserId;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	@Override
	public String toString() {
		return "FileManagement [file_id=" + file_id + ", originalFileName=" + originalFileName + ", savedFileName="
				+ savedFileName + ", fileDivision=" + fileDivision + ", fileUserId=" + fileUserId + ", idx=" + idx
				+ "]";
	}
	
	
}
