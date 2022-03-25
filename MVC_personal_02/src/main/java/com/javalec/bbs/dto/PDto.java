package com.javalec.bbs.dto;

public class PDto {
	int pId;
	String pName;
	String pTel;
	String pAddress;
	String pEmail;
	String pRel;
	
	public PDto() {}

	public PDto(int pId, String pName, String pTel, String pAddress, String pEmail, String pRel) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pTel = pTel;
		this.pAddress = pAddress;
		this.pEmail = pEmail;
		this.pRel = pRel;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpTel() {
		return pTel;
	}

	public void setpTel(String pTel) {
		this.pTel = pTel;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public String getpEmail() {
		return pEmail;
	}

	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}

	public String getpRel() {
		return pRel;
	}

	public void setpRel(String pRel) {
		this.pRel = pRel;
	}
	
}
