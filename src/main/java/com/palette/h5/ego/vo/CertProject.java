package com.palette.h5.ego.vo;

public class CertProject {
	
	public String proId;
	public int proNum;
	public String proTerm;
	public String proEdu;
	public String proTitle;
	public String proContent;
	public int proFileId;
	public String proProf;
	
	public CertProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertProject(String proId, int proNum, String proTerm, String proEdu, String proTitle, String proContent,
			int proFileId, String proProf) {
		super();
		this.proId = proId;
		this.proNum = proNum;
		this.proTerm = proTerm;
		this.proEdu = proEdu;
		this.proTitle = proTitle;
		this.proContent = proContent;
		this.proFileId = proFileId;
		this.proProf = proProf;
	}

	@Override
	public String toString() {
		return "CertProject [proId=" + proId + ", proNum=" + proNum + ", proTerm=" + proTerm + ", proEdu=" + proEdu
				+ ", proTitle=" + proTitle + ", proContent=" + proContent + ", proFileId=" + proFileId + ", proProf="
				+ proProf + "]";
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

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public int getProFileId() {
		return proFileId;
	}

	public void setProFileId(int proFileId) {
		this.proFileId = proFileId;
	}

	public String getProProf() {
		return proProf;
	}

	public void setProProf(String proProf) {
		this.proProf = proProf;
	}
	
	
}
