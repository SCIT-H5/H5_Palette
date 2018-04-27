package com.palette.h5.ego.vo;

public class CertCertificate {
	
	public String certId;
	public String certJSON;
	public String certHtml;
	
	public CertCertificate() {
		super();
	}
	
	public CertCertificate(String certId, String certJSON, String certHtml) {
		super();
		this.certId = certId;
		this.certJSON = certJSON;
		this.certHtml = certHtml;
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

	public String getCertHtml() {
		return certHtml;
	}

	public void setCertHtml(String certHtml) {
		this.certHtml = certHtml;
	}

	@Override
	public String toString() {
		return "CertCertificate [certId=" + certId + ", certJSON=" + certJSON + ", certHtml=" + certHtml + "]";
	}

}
