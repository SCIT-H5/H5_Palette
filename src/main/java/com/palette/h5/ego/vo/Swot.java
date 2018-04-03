package com.palette.h5.ego.vo;

public class Swot {
	
	private String swotId;
	private String swotS;
	private String swotW;
	private String swotO;
	private String swotT;
	
	public Swot() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Swot(String swotId, String swotS, String swotW, String swotO, String swotT) {
		super();
		this.swotId = swotId;
		this.swotS = swotS;
		this.swotW = swotW;
		this.swotO = swotO;
		this.swotT = swotT;
	}

	public String getSwotId() {
		return swotId;
	}

	public void setSwotId(String swotId) {
		this.swotId = swotId;
	}

	public String getSwotS() {
		return swotS;
	}

	public void setSwotS(String swotS) {
		this.swotS = swotS;
	}

	public String getSwotW() {
		return swotW;
	}

	public void setSwotW(String swotW) {
		this.swotW = swotW;
	}

	public String getSwotO() {
		return swotO;
	}

	public void setSwotO(String swotO) {
		this.swotO = swotO;
	}

	public String getSwotT() {
		return swotT;
	}

	public void setSwotT(String swotT) {
		this.swotT = swotT;
	}

	@Override
	public String toString() {
		return "Swot [swotId=" + swotId + ", swotS=" + swotS + ", swotW=" + swotW + ", swotO=" + swotO + ", swotT="
				+ swotT + "]";
	}
	
}
