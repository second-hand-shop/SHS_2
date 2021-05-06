package com.shs.s1.board;

import java.sql.Date;


public class BoardDTO {
	
	private long num;
	private String title;
	private String writer;
	private String contents;
	private Date regdate;
	private long hit;
	
	private String boardPw;
	private long productNum;
	
	
	private String pwSet;
	
	//get set
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	
	public String getBoardPw() {
		return boardPw;
	}
	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}
	
	public long getProductNum() {
		return productNum;
	}
	
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	
	
	
	public String getPwSet() {
		return pwSet;
	}

	public void setPwSet(String pwSet) {
		this.pwSet = pwSet;
	}



}
