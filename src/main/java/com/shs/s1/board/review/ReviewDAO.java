package com.shs.s1.board.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "com.shs.s1.board.review.ReviewDAO.";
	
}
