package com.palette.h5.ego.vo;

public class CertCertificate {
	
	public String certId;
	public String certJSON;
	
	public CertCertificate() {
		super();
	}

	public CertCertificate(String certId, String certJSON) {
		super();
		this.certId = certId;
		this.certJSON = certJSON;
	}

	public String getCertId() {
		return certId;
	}

	public void setCertId(String certId) {
		this.certId = certId;
	}

	public String getCertJSON() {
		return certJSON;
	}

	public void setCertJSON(String certJSON) {
		this.certJSON = certJSON;
	}

	@Override
	public String toString() {
		return "CertCertificate [certId=" + certId + ", certJSON=" + certJSON + "]";
	}
	
}
