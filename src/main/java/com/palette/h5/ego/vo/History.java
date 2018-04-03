package com.palette.h5.ego.vo;

public class History {
	
	private String hidId;
	private String hisDate;
	private String hisPeroid;
	private String hisTitle;
	private String hisContent;

	public History() {
		super();
		// TODO Auto-generated constructor stub
	}

	public History(String hidId, String hisDate, String hisPeroid, String hisTitle, String hisContent) {
		super();
		this.hidId = hidId;
		this.hisDate = hisDate;
		this.hisPeroid = hisPeroid;
		this.hisTitle = hisTitle;
		this.hisContent = hisContent;
	}

	public String getHidId() {
		return hidId;
	}

	public void setHidId(String hidId) {
		this.hidId = hidId;
	}

	public String getHisDate() {
		return hisDate;
	}

	public void setHisDate(String hisDate) {
		this.hisDate = hisDate;
	}

	public String getHisPeroid() {
		return hisPeroid;
	}

	public void setHisPeroid(String hisPeroid) {
		this.hisPeroid = hisPeroid;
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

	@Override
	public String toString() {
		return "History [hidId=" + hidId + ", hisDate=" + hisDate + ", hisPeroid=" + hisPeroid + ", hisTitle="
				+ hisTitle + ", hisContent=" + hisContent + "]";
	}
	
}
