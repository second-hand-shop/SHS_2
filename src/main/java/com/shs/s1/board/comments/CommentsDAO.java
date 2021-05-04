package com.shs.s1.board.comments;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommentsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.shs.s1.board.comments.CommentsDAO.";

	public CommentsDTO getSelect(CommentsDTO commentsDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", commentsDTO);
	}
	
	public int setInsert(CommentsDTO commentsDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", commentsDTO);
	}
}
