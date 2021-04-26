package com.shs.s1.board.qna;

import com.shs.s1.board.BoardDTO;

public class QnaDTO extends BoardDTO {
	
	private long productNum;
	private long ref;
	private long step;
	private long depth;
	
	
	//get set
	
	public long getProductNum() {
		return productNum;
	}
	
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	
	public long getRef() {
		return ref;
	}
	
	public void setRef(long ref) {
		this.ref = ref;
	}
	
	public long getStep() {
		return step;
	}
	
	public void setStep(long step) {
		this.step = step;
	}
	
	public long getDepth() {
		return depth;
	}
	
	public void setDepth(long depth) {
		this.depth = depth;
	}
	
	

}
