package com.palette.h5.ego.vo;

public class CertScholarship {
	
	public String schId;
	public int schField;
	
	public CertScholarship() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertScholarship(String schId, int schField) {
		super();
		this.schId = schId;
		this.schField = schField;
	}

	public String getSchId() {
		return schId;
	}

	public void setSchId(String schId) {
		this.schId = schId;
	}

	public int getSchField() {
		return schField;
	}

	public void setSchField(int schField) {
		this.schField = schField;
	}

	@Override
	public String toString() {
		return "CertScholarship [schId=" + schId + ", schField=" + schField + "]";
	}
	
}
