package com.lcomputerstudy3.example.domain;

public class Board {
	private int bId;
	private int bGroup;
	private int bOrder;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bDateTime;
	public static final int startOrder=1;
	//private int MaxbId;
	
	//public Board(){
	
	//}
	//public Board(int bId) {
		//MaxbId=(bId+1);
	//}

	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbDateTime() {
		return bDateTime;
	}
	public void setbDateTime(String bDateTime) {
		this.bDateTime = bDateTime;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbOrder() {
		return bOrder;
	}
	public void setbOrder(int bOrder) {
		this.bOrder = bOrder;
	}
	public int getstartOrder() {
		return startOrder;
	}
	//public int getMaxbId() {
	//	return MaxbId;
	//}
	//public void setMaxbId(int MaxbId) {
	//	this.MaxbId = MaxbId;
	//}

}
	
	
