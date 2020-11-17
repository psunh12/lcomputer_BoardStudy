package com.lcomputerstudy3.example.domain;

public class Reply {
	private int rId;
	private String rTitle;
	private String rReply;
	private String rWriter;
	private String rDateTime;
	private int bId;
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrReply() {
		return rReply;
	}
	public void setrReply(String rReply) {
		this.rReply = rReply;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public String getrDateTime() {
		return rDateTime;
	}
	public void setrDateTime(String rDateTime) {
		this.rDateTime = rDateTime;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
}
