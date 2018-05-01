package com.palette.h5.ego.vo;

public class CertScholarship {
	
	public String schId;
	public int schFileId;
	
	public CertScholarship() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertScholarship(String schId, int schFileId) {
		super();
		this.schId = schId;
		this.schFileId = schFileId;
	}

	public String getSchId() {
		return schId;
	}

	public void setSchId(String schId) {
		this.schId = schId;
	}

	public int getSchFileId() {
		return schFileId;
	}

	public void setSchFileId(int schFileId) {
		this.schFileId = schFileId;
	}

	@Override
	public String toString() {
		return "CertScholarship [schId=" + schId + ", schFileId=" + schFileId + "]";
	}
	
}
