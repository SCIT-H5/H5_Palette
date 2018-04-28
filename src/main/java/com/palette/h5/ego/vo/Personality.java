package com.palette.h5.ego.vo;

public class Personality {
	
	public int persNum;
	public String persId;
	public int persKind;
	public String persWord;
	public String persContent;
	
	public Personality() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Personality(int persNum, String persId, int persKind, String persWord, String persContent) {
		this.persNum = persNum;
		this.persId = persId;
		this.persKind = persKind;
		this.persWord = persWord;
		this.persContent = persContent;
	}

	public int getPersNum() {
		return persNum;
	}

	public void setPersNum(int persNum) {
		this.persNum = persNum;
	}

	public String getPersId() {
		return persId;
	}

	public void setPersId(String persId) {
		this.persId = persId;
	}

	public int getPersKind() {
		return persKind;
	}

	public void setPersKind(int persKind) {
		this.persKind = persKind;
	}

	public String getPersWord() {
		return persWord;
	}

	public void setPersWord(String persWord) {
		this.persWord = persWord;
	}

	public String getPersContent() {
		return persContent;
	}

	public void setPersContent(String persContent) {
		this.persContent = persContent;
	}

	@Override
	public String toString() {
		return "Personality [persNum=" + persNum + ", persId=" + persId + ", persKind=" + persKind + ", persWord="
				+ persWord + ", persContent=" + persContent + "]";
	}

	
}
