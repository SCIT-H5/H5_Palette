package com.palette.h5.vo;

public class Portfolio {
	public String portId;
	public int portNum;
	public String portContent;
	public int portOpen;
		
	public Portfolio() {}

	public Portfolio(String portId, int portNum, String portContent, int portOpen) {
		this.portId = portId;
		this.portNum = portNum;
		this.portContent = portContent;
		this.portOpen = portOpen;
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

	public int getPortOpen() {
		return portOpen;
	}

	public void setPortOpen(int portOpen) {
		this.portOpen = portOpen;
	}

	@Override
	public String toString() {
		return "Portfolio [portId=" + portId + ", portNum=" + portNum + ", portContent=" + portContent + ", portOpen="
				+ portOpen + "]";
	}
	
}
