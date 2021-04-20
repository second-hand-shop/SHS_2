package com.shs.s1.util;

public class Pager {
	//Pager.java 클래스
	//DB에서 TotalCount 조회
	//조회한 값을 일정한 갯수만큼 번호를 나누어서 보여줌
	
	private long perPage;	//DB에 조회할 갯수
	private long perBlock; 	//jsp에 출력할 번호의 갯수
	private long curPage;	//현재 페이지
	
	
	//초기값, 갯수는 원본 사이트 그대로 따라가기
	public Pager() {
		this.perPage = 15;	//한 블록에 10개
		this.perBlock = 10;	//화살표 <, > 넘어가기전 한번에 보여줄 번호의 갯수
		this.curPage = 1;	//현재 페이지
	}
	
	//한 블록에 들어갈 시작, 끝 번호
	private long startRow;
	private long lastRow;
	
	public void makeRow() {
		//계산
		
		// curPage		startRow		lastRow
		// 1			1				15
		// 2			16				30
		// 3			31				45
		this.startRow = (this.curPage-1)*perPage+1;
		this.lastRow = this.curPage*this.perPage;
	}
	
	
	// 페이징 계산 시작!
	// 변수 선언
	
	private long totalPage;
	private long startNum;
	private long lastNum;
	private boolean pre;
	private boolean next;
	
	
	//페이징 계산 메서드
	public void makeNum(long totalCount) {
		
		//1. 전체 글의 갯수로 전체 페이지 갯수 구하기
		this.totalPage = totalCount/this.perPage;	// 총 페이지 수 = 전체 글 갯수 / 15(한 페이지에 보여줄 글 갯수)
		if(totalCount%this.perPage != 0) {			// 전체 글 갯수 % 15가 나머지가 있다면
			totalPage++;							// 총 페이지 수를 하나 늘려라
		}
		
		
		//2. 전체 페이지 전체 block 수 구하기
		long totalBlock = this.totalPage / this.perBlock;	// 총 블록 수 = 총 페이지 수 / 10(한 번에 보여줄 블록)
		if(this.totalPage%this.perBlock != 0) {				// 총 페이지 수 % 10 나머지가 있다면
			totalBlock++;									// 총 블록 수를 하나 늘려라
		}
		
		
		//3. curPage(현재 페이지)를 이용해서 curBlock(현재 블록) 구하기
		// curPage		curBlock
		// 1			1
		// 2			1
		// 5			1
		// 11			2
		// 20			2
		
		long curBlock = this.curPage / this.perBlock;
		if(this.curPage % this.perBlock != 0) {
			curBlock++;
		}
		
		
		//4. curBlock(현재 블록)으로 startNum(시작 번호), lastNum(마지막 번호) 구하기
		//  curBlock	startNum	lastNum
		//  1			1			10
		//  2			11			20
		//  3			21			30
		
		this.startNum = (this.curPage-1)*perPage+1;
		this.lastNum = this.curPage * this.perPage;
		
		
		//5. 현재 블록이 마지막 블록과 같으면
		if(curBlock == totalBlock) {
			//마지막 번호 = 전체 글 갯수
			this.lastNum = this.totalPage;
		}
		
		
		//6. 이전, 다음 유무
		if(curBlock > 1) {
			this.pre = true;
		}
		
		if(curBlock != totalBlock) {
			this.next = true;
		}
		
	}

	// get set

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
		
	
	
	// ----- 검색 -----
	private String kind; //검색할 컬럼명
	private String search;//검색어
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if(this.search == null) {
			//검색 값이 없으면 아무것도 검색 x
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		if(search== null) {
			//검색 값이 없으면 아무것도 검색 x
			search="";
		}
		this.search = search;
	}
}
