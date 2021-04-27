package com.shs.s1.util;

public class CouponPager {
	// curPage (현재 페이지)는 parameter로 받아옴
	
	private long perPage;	// 1 페이지 당 몇개의 Row?
	private long perBlock;	// 한번에 보여줄 블럭 개수?
	private long curPage;	// 현재 페이지 번호
	
	// 생성자로 perPage, perBlock 세팅
	public CouponPager() {
		// TODO Auto-generated constructor stub
		this.perPage=10;
		this.perBlock=5;
		this.curPage = 1;
	}
	
	private long startRow;	// row 시작 번호
	private long lastRow;	// row 끝 번호
	//-------------------------------- 1페이지 출력할 rowNum 범위 구하기
	public void makeRow() {		
		this.startRow = (this.curPage-1)*this.perPage+1;
		this.lastRow = this.curPage*this.perPage;
	}
	
	private long totalPage;		// 전체 페이지 수
	private long startPage;	// 블럭 내 페이지 시작 번호
	private long lastPage;		// 블럭 내 페이지 끝 번호
	private boolean previous;	// 이전 페이지 유무
	private boolean next;		// 다음 페이지 유무
	
	public void makePaging(long totalCount) { // totalCount = 전체 Row 수
		// 1. 전체 페이지 개수 구하기----------------------
		this.totalPage=totalCount/this.perPage;
		if(totalCount%this.perPage !=0) {
			this.totalPage++;
		}
		
		// 2. 전체 block 수 구하기-------------------------
		long totalBlock = this.totalPage/this.perBlock;
		if(this.totalPage%this.perBlock != 0) {
			totalBlock++;
		}
		
		// 3. curBlock 구하기------------------------------
		// 1 1
		// 2 1
		// 5 1
		// 6 2
		long curBlock = this.curPage/this.perBlock;
		if(this.curPage%this.perBlock != 0) {
			curBlock++;
		}
		
		// 4. startPage, lastPage 구하기-------------------
		// 1	1~5
		// 2	6~10
		// 3	11~15
		this.startPage = (curBlock-1)*this.perBlock+1;
		this.lastPage = curBlock*this.perBlock;
		
		// 5.
		if(curBlock == totalBlock) {
			this.lastPage = this.totalPage;
		}
		
		// 6. 이전, 다음 유무
		if(curBlock>1) {
			this.previous = true;
		}
		if(curBlock!=totalBlock) {
			this.next=true;
		}
	}// ---makePaging method END---
	
	public long getPerPage() {
		return perPage;
	}
	public void setPerPage(long perPage) {
		this.perPage = perPage;
	}
	public long getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(long perBlock) {
		this.perBlock = perBlock;
	}
	public long getCurPage() {
		return curPage;
	}
	public void setCurPage(long curPage) {
		this.curPage = curPage;
	}
	public long getStartRow() {
		return startRow;
	}
	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}
	public long getLastRow() {
		return lastRow;
	}
	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public long getStartPage() {
		return startPage;
	}
	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}
	public long getLastPage() {
		return lastPage;
	}
	public void setLastPage(long lastPage) {
		this.lastPage = lastPage;
	}
	public boolean isPrevious() {
		return previous;
	}
	public void setPrevious(boolean previous) {
		this.previous = previous;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	// ======================== 검색 ==========================================
	private String kind;
	private String search;

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}//###################################################################
