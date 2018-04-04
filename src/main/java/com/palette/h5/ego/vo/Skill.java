package com.palette.h5.ego.vo;

public class Skill {
	
	public String skillId;
	public int skillNum;
	public String skillName;
	public String skillContent;
	
	public Skill() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Skill(String skillId, int skillNum, String skillName, String skillContent) {
		super();
		this.skillId = skillId;
		this.skillNum = skillNum;
		this.skillName = skillName;
		this.skillContent = skillContent;
	}

	public String getSkillId() {
		return skillId;
	}

	public void setSkillId(String skillId) {
		this.skillId = skillId;
	}

	public int getSkillNum() {
		return skillNum;
	}

	public void setSkillNum(int skillNum) {
		this.skillNum = skillNum;
	}

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	public String getSkillContent() {
		return skillContent;
	}

	public void setSkillContent(String skillContent) {
		this.skillContent = skillContent;
	}

	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", skillNum=" + skillNum + ", skillName=" + skillName + ", skillContent="
				+ skillContent + "]";
	}
	
}
