package com.palette.h5.ego.vo;

public class CertProject {
	
	public String proId;
	public int proNum;
	public String proTerm;
	public String proEdu;
	public String proTitle;
	
	public CertProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertProject(String proId, int proNum, String proTerm, String proEdu, String proTitle) {
		super();
		this.proId = proId;
		this.proNum = proNum;
		this.proTerm = proTerm;
		this.proEdu = proEdu;
		this.proTitle = proTitle;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public String getProTerm() {
		return proTerm;
	}

	public void setProTerm(String proTerm) {
		this.proTerm = proTerm;
	}

	public String getProEdu() {
		return proEdu;
	}

	public void setProEdu(String proEdu) {
		this.proEdu = proEdu;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	@Override
	public String toString() {
		return "CertProject [proId=" + proId + ", proNum=" + proNum + ", proTerm=" + proTerm + ", proEdu=" + proEdu
				+ ", proTitle=" + proTitle + "]";
	}
	
}
