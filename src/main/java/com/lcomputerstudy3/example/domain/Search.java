package com.lcomputerstudy3.example.domain;

public class Search extends Board{
	private String searchType ="";
	private String keyword= "";

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
