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
	
	
	//페이징 계산 함수
	public void makeNum() {
		
	}
		
}
