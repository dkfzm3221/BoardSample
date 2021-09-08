package com.itkey.sam.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int displayPageCnt = 10; // 화면에 몇개 보이나
	private int totalDataCount; // 실제 게시물 수
	private int startPage; // 현재 페이지 기준 시작 페이지 번호 
	private int endPage; // 현재 페이지 기준 끝 페이지 번호
	private boolean prev; // 이전 버튼 
	private boolean next; // 다음 버튼 
	private Criteria cri; //page(현재 페이지), perPageNum(페이지 당 보여질 게시물의 수)
	
	public PageMaker(Criteria cri) {
		this.cri = cri;
	}
	
	//전체 게시물의 수를 입력 받음 
	public void setTotalCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
		calcData(); 
	}
	
	//startPage, endPage, prev, next 계산
	public void calcData() {
		int page = this.cri.getPage();
		int perPageNum = this.cri.getPerPageNum();
	
		this.endPage = (int)(Math.ceil(page/(double)displayPageCnt)*displayPageCnt);
		

		this.startPage = (this.endPage-displayPageCnt) + 1;
	
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum));

		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = (startPage != 1); 
		this.next = (endPage * perPageNum < totalDataCount); 
	}
	
	

	public int getDisplayPageCnt() {
		return displayPageCnt;
	}

	public void setDisplayPageCnt(int displayPageCnt) {
		this.displayPageCnt = displayPageCnt;
	}

	public int getTotalDataCount() {
		return totalDataCount;
	}

	public void setTotalDataCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
	//URI
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.cri.getPerPageNum())
				.build()
				.encode();
				
		return uriComponents.toString();
	}
	public String makeQuerySearch(boolean needSearch) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("searchType", this.cri.getSearchType())
				.queryParam("perPageNum", this.cri.getKeyword())
				.build()
				.encode();
			
		return uriComponents.toString();
				
					
	}
	
		
	
	
	
	
	
	
	
	
	

}
