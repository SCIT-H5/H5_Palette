package com.palette.h5.vo;

public class FileManagement {

	private int file_id;
	private String originalFileName;
	private String savedFileName;
	private int fileDivision;
	private String fileUserId;
	
	public FileManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileManagement(int file_id, String originalFileName, String savedFileName, int fileDivision,
			String fileUserId) {
		super();
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

	@Override
	public String toString() {
		return "FileManagement [file_id=" + file_id + ", originalFileName=" + originalFileName + ", savedFileName="
				+ savedFileName + ", fileDivision=" + fileDivision + ", fileUserId=" + fileUserId + "]";
	}
	
}
