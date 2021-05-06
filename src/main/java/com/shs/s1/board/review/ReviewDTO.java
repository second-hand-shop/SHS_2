package com.shs.s1.board.review;

import java.util.List;

import com.shs.s1.board.ReviewFileDTO;
import com.shs.s1.board.BoardDTO;

public class ReviewDTO extends BoardDTO{
	
	private List<ReviewFileDTO> reviewFiles = null;

	//get set
	public List<ReviewFileDTO> getReviewFiles() {
		return reviewFiles;
	}

	public void setReviewFiles(List<ReviewFileDTO> reviewFiles) {
		this.reviewFiles = reviewFiles;
	}
	
}
