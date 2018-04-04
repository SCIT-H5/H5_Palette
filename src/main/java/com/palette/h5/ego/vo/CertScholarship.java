package com.palette.h5.ego.vo;

public class CertScholarship {
	
	public String schId;
	public String schOriginalfile;
	public String schSavedfile;
	
	public CertScholarship() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertScholarship(String schId, String schOriginalfile, String schSavedfile) {
		super();
		this.schId = schId;
		this.schOriginalfile = schOriginalfile;
		this.schSavedfile = schSavedfile;
	}

	public String getSchId() {
		return schId;
	}

	public void setSchId(String schId) {
		this.schId = schId;
	}

	public String getSchOriginalfile() {
		return schOriginalfile;
	}

	public void setSchOriginalfile(String schOriginalfile) {
		this.schOriginalfile = schOriginalfile;
	}

	public String getSchSavedfile() {
		return schSavedfile;
	}

	public void setSchSavedfile(String schSavedfile) {
		this.schSavedfile = schSavedfile;
	}

	@Override
	public String toString() {
		return "CertScholarship [schId=" + schId + ", schOriginalfile=" + schOriginalfile + ", schSavedfile="
				+ schSavedfile + "]";
	}
	
}
