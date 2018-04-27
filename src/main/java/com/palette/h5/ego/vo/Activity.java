package com.palette.h5.ego.vo;

public class Activity {
	
	public String actId;
	public String actJson;
	public String actHtml;
	
	public Activity() {
	}

	public Activity(String actId, String actJson, String actHtml) {
		this.actId = actId;
		this.actJson = actJson;
		this.actHtml = actHtml;
	}

	public String getActId() {
		return actId;
	}

	public void setActId(String actId) {
		this.actId = actId;
	}

	public String getActJson() {
		return actJson;
	}

	public void setActJson(String actJson) {
		this.actJson = actJson;
	}

	public String getActHtml() {
		return actHtml;
	}

	public void setActHtml(String actHtml) {
		this.actHtml = actHtml;
	}

	@Override
	public String toString() {
		return "Activity [actId=" + actId + ", actJson=" + actJson + ", actHtml=" + actHtml + "]";
	}
	
}
