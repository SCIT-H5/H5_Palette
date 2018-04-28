package com.palette.h5.ego.vo;

public class CertGrad {
	
	public String gradId;
	public int gradFileId;
	
	public CertGrad() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertGrad(String gradId, int gradFileId) {
		super();
		this.gradId = gradId;
		this.gradFileId = gradFileId;
	}

	public String getGradId() {
		return gradId;
	}

	public void setGradId(String gradId) {
		this.gradId = gradId;
	}

	public int getGradFileId() {
		return gradFileId;
	}

	public void setGradFileId(int gradFileId) {
		this.gradFileId = gradFileId;
	}

	@Override
	public String toString() {
		return "CertGrad [gradId=" + gradId + ", gradFileId=" + gradFileId + "]";
	}
	
}
