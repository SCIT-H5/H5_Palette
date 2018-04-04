package com.palette.h5.ego.vo;

public class Activity {
	
	public String actId;
	public int actNum;
	public String actName;
	public String actAgency;
	public String actDate;
	public String actContent;
	public String actPosition;
	public String actOriginalfile;
	public String actSavedfile;
	public String actURL;
	
	public Activity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Activity(String actId, int actNum, String actName, String actAgency, String actDate, String actContent,
			String actPosition, String actOriginalfile, String actSavedfile, String actURL) {
		super();
		this.actId = actId;
		this.actNum = actNum;
		this.actName = actName;
		this.actAgency = actAgency;
		this.actDate = actDate;
		this.actContent = actContent;
		this.actPosition = actPosition;
		this.actOriginalfile = actOriginalfile;
		this.actSavedfile = actSavedfile;
		this.actURL = actURL;
	}

	public String getActId() {
		return actId;
	}

	public void setActId(String actId) {
		this.actId = actId;
	}

	public int getActNum() {
		return actNum;
	}

	public void setActNum(int actNum) {
		this.actNum = actNum;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActAgency() {
		return actAgency;
	}

	public void setActAgency(String actAgency) {
		this.actAgency = actAgency;
	}

	public String getActDate() {
		return actDate;
	}

	public void setActDate(String actDate) {
		this.actDate = actDate;
	}

	public String getActContent() {
		return actContent;
	}

	public void setActContent(String actContent) {
		this.actContent = actContent;
	}

	public String getActPosition() {
		return actPosition;
	}

	public void setActPosition(String actPosition) {
		this.actPosition = actPosition;
	}

	public String getActOriginalfile() {
		return actOriginalfile;
	}

	public void setActOriginalfile(String actOriginalfile) {
		this.actOriginalfile = actOriginalfile;
	}

	public String getActSavedfile() {
		return actSavedfile;
	}

	public void setActSavedfile(String actSavedfile) {
		this.actSavedfile = actSavedfile;
	}

	public String getActURL() {
		return actURL;
	}

	public void setActURL(String actURL) {
		this.actURL = actURL;
	}

	@Override
	public String toString() {
		return "Activity [actId=" + actId + ", actNum=" + actNum + ", actName=" + actName + ", actAgency=" + actAgency
				+ ", actDate=" + actDate + ", actContent=" + actContent + ", actPosition=" + actPosition
				+ ", actOriginalfile=" + actOriginalfile + ", actSavedfile=" + actSavedfile + ", actURL=" + actURL
				+ "]";
	}

}
