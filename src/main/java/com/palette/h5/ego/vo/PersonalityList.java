package com.palette.h5.ego.vo;

public class PersonalityList {
	
	public int persListNum;
	public String persListWord;
	
	public PersonalityList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PersonalityList(int persListNum, String persListWord) {
		super();
		this.persListNum = persListNum;
		this.persListWord = persListWord;
	}

	public int getPersListNum() {
		return persListNum;
	}

	public void setPersListNum(int persListNum) {
		this.persListNum = persListNum;
	}

	public String getPersListWord() {
		return persListWord;
	}

	public void setPersListWord(String persListWord) {
		this.persListWord = persListWord;
	}

	@Override
	public String toString() {
		return "PersonalityList [persListNum=" + persListNum + ", persListWord=" + persListWord + "]";
	}
	
}
