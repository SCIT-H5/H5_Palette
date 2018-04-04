package com.palette.h5.ego.vo;

public class CertCertificate {
	
	public String certId;
	public int certNum;
	public String certName;
	public String certAgency;
	public String certDate;
	public String certEtc;
	public String certOriginalfile;
	public String certSavedfile;
	
	public CertCertificate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CertCertificate(String certId, int certNum, String certName, String certAgency, String certDate,
			String certEtc, String certOriginalfile, String certSavedfile) {
		super();
		this.certId = certId;
		this.certNum = certNum;
		this.certName = certName;
		this.certAgency = certAgency;
		this.certDate = certDate;
		this.certEtc = certEtc;
		this.certOriginalfile = certOriginalfile;
		this.certSavedfile = certSavedfile;
	}

	public String getCertId() {
		return certId;
	}

	public void setCertId(String certId) {
		this.certId = certId;
	}

	public int getCertNum() {
		return certNum;
	}

	public void setCertNum(int certNum) {
		this.certNum = certNum;
	}

	public String getCertName() {
		return certName;
	}

	public void setCertName(String certName) {
		this.certName = certName;
	}

	public String getCertAgency() {
		return certAgency;
	}

	public void setCertAgency(String certAgency) {
		this.certAgency = certAgency;
	}

	public String getCertDate() {
		return certDate;
	}

	public void setCertDate(String certDate) {
		this.certDate = certDate;
	}

	public String getCertEtc() {
		return certEtc;
	}

	public void setCertEtc(String certEtc) {
		this.certEtc = certEtc;
	}

	public String getCertOriginalfile() {
		return certOriginalfile;
	}

	public void setCertOriginalfile(String certOriginalfile) {
		this.certOriginalfile = certOriginalfile;
	}

	public String getCertSavedfile() {
		return certSavedfile;
	}

	public void setCertSavedfile(String certSavedfile) {
		this.certSavedfile = certSavedfile;
	}

	@Override
	public String toString() {
		return "CertCertificate [certId=" + certId + ", certNum=" + certNum + ", certName=" + certName + ", certAgency="
				+ certAgency + ", certDate=" + certDate + ", certEtc=" + certEtc + ", certOriginalfile="
				+ certOriginalfile + ", certSavedfile=" + certSavedfile + "]";
	}
	
}
