package com.lcomputerstudy3.example.domain;

public class Comment {
	private int cId;
	private String cComment;
	private String cWriter;
	private String cDateTime;
	private int bId;

	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId=cId;
	}
	public String getcComment() {
		return cComment;
	}
	public void setcComment(String cComment) {
		this.cComment = cComment;
	}
	public String cWriter() {
		return cWriter;
	}
	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}
	public String getcDateTime() {
		return cDateTime;
	}
	public void setcDateTime(String cDateTime) {
		this.cDateTime = cDateTime;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
		

}