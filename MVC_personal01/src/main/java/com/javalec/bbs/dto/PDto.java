package com.javalec.bbs.dto;

import java.sql.Timestamp;

public class PDto {

	int seq;
	String pName;
	String pTitle;
	Timestamp pDate;
	
	public PDto() {}

	public PDto(int seq, String pName, String pTitle, Timestamp pDate) {
		super();
		this.seq = seq;
		this.pName = pName;
		this.pTitle = pTitle;
		this.pDate = pDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
}
