package com.itkey.sam.utils;

import org.springframework.web.util.UriComponentsBuilder;

import com.itkey.sam.board.dto.BoardDTO;

public class Criteria{
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	
	
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

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.searchType = null;
		this.keyword = null;
		
	}
    
	//pageStart를 반환
	public int getPageStart() {
		return (this.page - 1)*perPageNum;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
	}

	//URI

	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
				
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
	
	
	
	

}
