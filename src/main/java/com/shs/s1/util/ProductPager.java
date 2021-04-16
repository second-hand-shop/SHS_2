package com.shs.s1.util;

public class ProductPager {

	
	private long perList;
	private long perPage;
	private long curPage;
	
	private long startRow;
	private long lastRow;
	
	
	public ProductPager() {
		// TODO Auto-generated constructor stub
		perList=12;
		perPage=10;
		curPage=1;
	}
	
	
	public void makeRow() {
		
		long startRow= (curPage-1)*(perList)+1;
		long lastRow= curPage *perList;
		
	}
	
	
	private long totalPage;
	private long curBlock;
	private long totalBlock;
	private long startNum;
	private long lastNum;
	
	private boolean pre=false;
	private boolean next=false;
	
	
	private String search;  //검색할 내용

	public void makeNum(long totalCount) {
		
		//총 페이지 갯수
		totalPage = totalCount/perPage;
		if(totalCount%perPage!=0) {
			totalPage++;
			
		}
		
		//총 블록
		totalBlock= totalPage/perPage;
		if(totalPage%perPage!=0) {
			totalPage++;
			
		}
		
		
		//현 블록
		curBlock = curPage/perPage;
		if(curPage%perPage!=0) {
			curBlock++;
		}
		
		
		
		startNum=perPage*(curBlock-1)+1;
		lastNum=curBlock * perPage;
		
		//마지막 블럭 정리
		if(curBlock==totalBlock) {
			lastNum=totalPage;
		}
		
		//앞 뒤 정리
		if(curBlock>1) {
			pre=true;
		}
		if(curBlock<totalBlock) {
			next=true;
		}
		
	}


	public long getPerList() {
		return perList;
	}


	public void setPerList(long perList) {
		this.perList = perList;
	}


	public long getPerPage() {
		return perPage;
	}


	public void setPerPage(long perPage) {
		this.perPage = perPage;
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


	public long getCurBlock() {
		return curBlock;
	}


	public void setCurBlock(long curBlock) {
		this.curBlock = curBlock;
	}


	public long getTotalBlock() {
		return totalBlock;
	}


	public void setTotalBlock(long totalBlock) {
		this.totalBlock = totalBlock;
	}


	public long getStartNum() {
		return startNum;
	}


	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}


	public long getLastNum() {
		return lastNum;
	}


	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}


	public boolean isPre() {
		return pre;
	}


	public void setPre(boolean pre) {
		this.pre = pre;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}
	
	
	
	
	
	
	
}
