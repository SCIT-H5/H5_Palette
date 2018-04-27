package com.palette.h5.ego.vo;

public class History {
	
	private String hisId;
	private String hisDate;
	private String hisPeriod;
	private String hisTitle;
	private String hisContent;
	private int hisNo;
	
	public History() {
		super();
		// TODO Auto-generated constructor stub
	}

	public History(String hisId, String hisDate, String hisPeriod, String hisTitle, String hisContent, int hisNo) {
		super();
		this.hisId = hisId;
		this.hisDate = hisDate;
		this.hisPeriod = hisPeriod;
		this.hisTitle = hisTitle;
		this.hisContent = hisContent;
		this.hisNo = hisNo;
	}

	public String getHisId() {
		return hisId;
	}

	public void setHisId(String hisId) {
		this.hisId = hisId;
	}

	public String getHisDate() {
		return hisDate;
	}

	public void setHisDate(String hisDate) {
		this.hisDate = hisDate;
	}

	public String getHisPeriod() {
		return hisPeriod;
	}

	public void setHisPeriod(String hisPeriod) {
		this.hisPeriod = hisPeriod;
	}

	public String getHisTitle() {
		return hisTitle;
	}

	public void setHisTitle(String hisTitle) {
		this.hisTitle = hisTitle;
	}

	public String getHisContent() {
		return hisContent;
	}

	public void setHisContent(String hisContent) {
		this.hisContent = hisContent;
	}

	public int getHisNo() {
		return hisNo;
	}

	public void setHisNo(int hisNo) {
		this.hisNo = hisNo;
	}

	@Override
	public String toString() {
		return "History [hisId=" + hisId + ", hisDate=" + hisDate + ", hisPeriod=" + hisPeriod + ", hisTitle="
				+ hisTitle + ", hisContent=" + hisContent + ", hisNo=" + hisNo + "]";
	}
	
}