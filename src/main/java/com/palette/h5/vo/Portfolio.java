package com.palette.h5.vo;

public class Portfolio {
	public String portId;
	public int portNum;
	public String portContent;
	public String portModify;
	public int portOpen;
	public String portHeight;
		
	public Portfolio() {}

	public Portfolio(String portId, int portNum, String portContent, String portModify, int portOpen,
			String portHeight) {
		this.portId = portId;
		this.portNum = portNum;
		this.portContent = portContent;
		this.portModify = portModify;
		this.portOpen = portOpen;
		this.portHeight = portHeight;
	}

	public String getPortId() {
		return portId;
	}

	public void setPortId(String portId) {
		this.portId = portId;
	}

	public int getPortNum() {
		return portNum;
	}

	public void setPortNum(int portNum) {
		this.portNum = portNum;
	}

	public String getPortContent() {
		return portContent;
	}

	public void setPortContent(String portContent) {
		this.portContent = portContent;
	}

	public String getPortModify() {
		return portModify;
	}

	public void setPortModify(String portModify) {
		this.portModify = portModify;
	}

	public int getPortOpen() {
		return portOpen;
	}

	public void setPortOpen(int portOpen) {
		this.portOpen = portOpen;
	}

	public String getPortHeight() {
		return portHeight;
	}

	public void setPortHeight(String portHeight) {
		this.portHeight = portHeight;
	}

	@Override
	public String toString() {
		return "Portfolio [portId=" + portId + ", portNum=" + portNum + ", portContent=" + portContent + ", portModify="
				+ portModify + ", portOpen=" + portOpen + ", portHeight=" + portHeight + "]";
	}
	
	
	
	
}
