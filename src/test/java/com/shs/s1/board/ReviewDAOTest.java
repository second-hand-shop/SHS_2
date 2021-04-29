package com.shs.s1.board;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;
import com.shs.s1.board.notice.NoticeDTO;
import com.shs.s1.board.review.ReviewDAO;
import com.shs.s1.board.review.ReviewDTO;

public class ReviewDAOTest extends MyAbstractTest{

	@Autowired
	private ReviewDAO reviewDAO; 
	
	//--------Select
	@Test
	public void getSelect() throws Exception{
		
		ReviewDTO reviewDTO = new ReviewDTO();
		
		reviewDTO.setNum(2);
		
		reviewDTO = (ReviewDTO)(reviewDAO.getSelect(reviewDTO));
		
		System.out.println(reviewDTO.getNum());
		System.out.println(reviewDTO.getTitle());
		System.out.println(reviewDTO.getWriter());
		
		assertNotNull(reviewDTO);
		
	}

}
