package com.shs.s1.board.comments;

import java.sql.Date;

public class CommentsDTO {
	
	private long num;
	private long reviewNum;
	private String writer;
	private String contents;
	private Date regDate;
	
	
	//get set
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(long reviewNum) {
		this.reviewNum = reviewNum;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	

}
