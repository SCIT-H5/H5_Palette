package com.palette.h5.ego.vo;

public class Skill {
	
	public String skillId;
	public int skillRow;
	public int skillTrow;
	public String skillHtml;

	public Skill() {
		super();
	}

	public Skill(String skillId, int skillRow, int skillTrow, String skillHtml) {
		super();
		this.skillId = skillId;
		this.skillRow = skillRow;
		this.skillTrow = skillTrow;
		this.skillHtml = skillHtml;
	}

	public String getSkillId() {
		return skillId;
	}

	public void setSkillId(String skillId) {
		this.skillId = skillId;
	}

	public int getSkillRow() {
		return skillRow;
	}

	public void setSkillRow(int skillRow) {
		this.skillRow = skillRow;
	}

	public int getSkillTrow() {
		return skillTrow;
	}

	public void setSkillTrow(int skillTrow) {
		this.skillTrow = skillTrow;
	}

	public String getSkillHtml() {
		return skillHtml;
	}

	public void setSkillHtml(String skillHtml) {
		this.skillHtml = skillHtml;
	}

	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", skillRow=" + skillRow + ", skillTrow=" + skillTrow + ", skillHtml="
				+ skillHtml + "]";
	}
	
}
