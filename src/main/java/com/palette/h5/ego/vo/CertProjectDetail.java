package com.palette.h5.ego.vo;

public class CertProjectDetail {
	
	public String proDetailNum;
	public String proDetailTitle;
	public String proDetailDate;
	public String proDetailEdu;
	public String proDetailContent;
	public String proDetailOriginalfile;
	public String proDetailSavedfile;

	public CertProjectDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertProjectDetail(String proDetailNum, String proDetailTitle, String proDetailDate, String proDetailEdu,
			String proDetailContent, String proDetailOriginalfile, String proDetailSavedfile) {
		super();
		this.proDetailNum = proDetailNum;
		this.proDetailTitle = proDetailTitle;
		this.proDetailDate = proDetailDate;
		this.proDetailEdu = proDetailEdu;
		this.proDetailContent = proDetailContent;
		this.proDetailOriginalfile = proDetailOriginalfile;
		this.proDetailSavedfile = proDetailSavedfile;
	}

	public String getProDetailNum() {
		return proDetailNum;
	}

	public void setProDetailNum(String proDetailNum) {
		this.proDetailNum = proDetailNum;
	}

	public String getProDetailTitle() {
		return proDetailTitle;
	}

	public void setProDetailTitle(String proDetailTitle) {
		this.proDetailTitle = proDetailTitle;
	}

	public String getProDetailDate() {
		return proDetailDate;
	}

	public void setProDetailDate(String proDetailDate) {
		this.proDetailDate = proDetailDate;
	}

	public String getProDetailEdu() {
		return proDetailEdu;
	}

	public void setProDetailEdu(String proDetailEdu) {
		this.proDetailEdu = proDetailEdu;
	}

	public String getProDetailContent() {
		return proDetailContent;
	}

	public void setProDetailContent(String proDetailContent) {
		this.proDetailContent = proDetailContent;
	}

	public String getProDetailOriginalfile() {
		return proDetailOriginalfile;
	}

	public void setProDetailOriginalfile(String proDetailOriginalfile) {
		this.proDetailOriginalfile = proDetailOriginalfile;
	}

	public String getProDetailSavedfile() {
		return proDetailSavedfile;
	}

	public void setProDetailSavedfile(String proDetailSavedfile) {
		this.proDetailSavedfile = proDetailSavedfile;
	}

	@Override
	public String toString() {
		return "CertProjectDetail [proDetailNum=" + proDetailNum + ", proDetailTitle=" + proDetailTitle
				+ ", proDetailDate=" + proDetailDate + ", proDetailEdu=" + proDetailEdu + ", proDetailContent="
				+ proDetailContent + ", proDetailOriginalfile=" + proDetailOriginalfile + ", proDetailSavedfile="
				+ proDetailSavedfile + "]";
	}
	
}
