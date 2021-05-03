package com.shs.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	/*public List<ReviewDTO> memberMyBoard(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.memberMyBoard(reviewDTO);
	}*/
}
