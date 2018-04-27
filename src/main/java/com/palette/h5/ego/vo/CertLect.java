package com.palette.h5.ego.vo;

public class CertLect {

	public String lectId;
	public String lectJson;
	public String lectHtml;

	public CertLect() {
	}

	public CertLect(String lectId, String lectJson, String lectHtml) {
		this.lectId = lectId;
		this.lectJson = lectJson;
		this.lectHtml = lectHtml;
	}

	public String getLectId() {
		return lectId;
	}

	public void setLectId(String lectId) {
		this.lectId = lectId;
	}

	public String getLectJson() {
		return lectJson;
	}

	public void setLectJson(String lectJson) {
		this.lectJson = lectJson;
	}

	public String getLectHtml() {
		return lectHtml;
	}

	public void setLectHtml(String lectHtml) {
		this.lectHtml = lectHtml;
	}

	@Override
	public String toString() {
		return "CertLect [lectId=" + lectId + ", lectJson=" + lectJson + ", lectHtml=" + lectHtml + "]";
	}

}