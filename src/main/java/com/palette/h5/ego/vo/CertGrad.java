package com.palette.h5.ego.vo;

public class CertGrad {
	
	public String gradId;
	public int gradField;
	
	public CertGrad() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertGrad(String gradId, int gradField) {
		super();
		this.gradId = gradId;
		this.gradField = gradField;
	}

	public String getGradId() {
		return gradId;
	}

	public void setGradId(String gradId) {
		this.gradId = gradId;
	}

	public int getGradField() {
		return gradField;
	}

	public void setGradField(int gradField) {
		this.gradField = gradField;
	}

	@Override
	public String toString() {
		return "CertGrad [gradId=" + gradId + ", gradField=" + gradField + "]";
	}
	
}
