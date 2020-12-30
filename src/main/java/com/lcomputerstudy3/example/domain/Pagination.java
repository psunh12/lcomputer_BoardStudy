package com.lcomputerstudy3.example.domain;

public class Pagination {
	int count;
	int page;
	int pageNum;
	int startPage;
	int endPage;
	int lastPage;
	int prevPage;
	int nextPage;
	private String searchType ="";
	private String keyword= "";
	
	public static final int pageUnit=5;
	public static final int perPage=5;
	
	public Pagination() {
	
	}
	public Pagination(int page, int count) {
		this.page =page;
		this.count = count;
		startPage=((page-1)/pageUnit)*pageUnit+1;
		lastPage = (int)Math.ceil(count / (float)perPage);
		endPage=startPage+pageUnit-1;
		endPage=endPage<lastPage ? endPage : lastPage;
		prevPage=(endPage-pageUnit);
		nextPage=(startPage+pageUnit);
	}
	public int getCount() {
		return count;
	}
	public void setBoardCount(int count) {
		this.count = count;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum=pageNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage=lastPage;	
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public int getPerpage() {
		return perPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage=prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage=nextPage;
	}
	public String getSearchType() {
		  return searchType;
	}
	 public void setSearchType(String searchType) {
		  this.searchType = searchType;
	}
	 public String getKeyword() {
		  return keyword;
	}
	 public void setKeyword(String keyword) {
		  this.keyword = keyword;
	}	
}