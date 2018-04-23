package com.palette.h5.vo;

public class Portfolio {
	public String portId;
	public int portNum;
	public String portContent;
	
	
	
	public Portfolio() {}
	
	public Portfolio(String portId, int portNum, String portContent) {
		this.portId = portId;
		this.portNum = portNum;
		this.portContent = portContent;
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

	@Override
	public String toString() {
		return "Portfolio [portId=" + portId + ", portNum=" + portNum + ", portContent=" + portContent + "]";
	}

}
