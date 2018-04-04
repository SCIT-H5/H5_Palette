package com.palette.h5.ego.vo;

public class CertGrad {
	
	public String gradId;
	public String gradOriginalfile;
	public String gradSavedfile;
	
	public CertGrad() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertGrad(String gradId, String gradOriginalfile, String gradSavedfile) {
		super();
		this.gradId = gradId;
		this.gradOriginalfile = gradOriginalfile;
		this.gradSavedfile = gradSavedfile;
	}

	public String getGradId() {
		return gradId;
	}

	public void setGradId(String gradId) {
		this.gradId = gradId;
	}

	public String getGradOriginalfile() {
		return gradOriginalfile;
	}

	public void setGradOriginalfile(String gradOriginalfile) {
		this.gradOriginalfile = gradOriginalfile;
	}

	public String getGradSavedfile() {
		return gradSavedfile;
	}

	public void setGradSavedfile(String gradSavedfile) {
		this.gradSavedfile = gradSavedfile;
	}

	@Override
	public String toString() {
		return "CertGrad [gradId=" + gradId + ", gradOriginalfile=" + gradOriginalfile + ", gradSavedfile="
				+ gradSavedfile + "]";
	}
	
}
