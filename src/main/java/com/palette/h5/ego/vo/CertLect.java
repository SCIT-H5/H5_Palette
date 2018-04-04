package com.palette.h5.ego.vo;

public class CertLect {
	
	public String lectId;
	public int lectNum;
	public String lectDiv;
	public String lectDivDetail;
	public String lectName;
	public String lectPeriod;
	public String lectGrade;
	public String lectEtc;
	
	public CertLect() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertLect(String lectId, int lectNum, String lectDiv, String lectDivDetail, String lectName,
			String lectPeriod, String lectGrade, String lectEtc) {
		super();
		this.lectId = lectId;
		this.lectNum = lectNum;
		this.lectDiv = lectDiv;
		this.lectDivDetail = lectDivDetail;
		this.lectName = lectName;
		this.lectPeriod = lectPeriod;
		this.lectGrade = lectGrade;
		this.lectEtc = lectEtc;
	}

	public String getLectId() {
		return lectId;
	}

	public void setLectId(String lectId) {
		this.lectId = lectId;
	}

	public int getLectNum() {
		return lectNum;
	}

	public void setLectNum(int lectNum) {
		this.lectNum = lectNum;
	}

	public String getLectDiv() {
		return lectDiv;
	}

	public void setLectDiv(String lectDiv) {
		this.lectDiv = lectDiv;
	}

	public String getLectDivDetail() {
		return lectDivDetail;
	}

	public void setLectDivDetail(String lectDivDetail) {
		this.lectDivDetail = lectDivDetail;
	}

	public String getLectName() {
		return lectName;
	}

	public void setLectName(String lectName) {
		this.lectName = lectName;
	}

	public String getLectPeriod() {
		return lectPeriod;
	}

	public void setLectPeriod(String lectPeriod) {
		this.lectPeriod = lectPeriod;
	}

	public String getLectGrade() {
		return lectGrade;
	}

	public void setLectGrade(String lectGrade) {
		this.lectGrade = lectGrade;
	}

	public String getLectEtc() {
		return lectEtc;
	}

	public void setLectEtc(String lectEtc) {
		this.lectEtc = lectEtc;
	}

	@Override
	public String toString() {
		return "CertLect [lectId=" + lectId + ", lectNum=" + lectNum + ", lectDiv=" + lectDiv + ", lectDivDetail="
				+ lectDivDetail + ", lectName=" + lectName + ", lectPeriod=" + lectPeriod + ", lectGrade=" + lectGrade
				+ ", lectEtc=" + lectEtc + "]";
	}

}
