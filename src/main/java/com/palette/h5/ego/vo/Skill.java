package com.palette.h5.ego.vo;

public class Skill {
	
	public String skillId;
	public String skillHtml;
	
	public Skill() {
		super();
	}

	public Skill(String skillId, String skillHtml) {
		super();
		this.skillId = skillId;
		this.skillHtml = skillHtml;
	}

	public String getSkillId() {
		return skillId;
	}

	public void setSkillId(String skillId) {
		this.skillId = skillId;
	}

	public String getSkillHtml() {
		return skillHtml;
	}

	public void setSkillHtml(String skillHtml) {
		this.skillHtml = skillHtml;
	}

	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", skillHtml=" + skillHtml + "]";
	}
	
}
