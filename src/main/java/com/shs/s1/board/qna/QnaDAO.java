package com.shs.s1.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.board.qna.QnaDTO;
import com.shs.s1.board.BoardDAO;
import com.shs.s1.board.BoardDTO;
import com.shs.s1.util.BoardPager;

@Repository
public class QnaDAO implements BoardDAO{
	
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "com.shs.s1.board.qna.QnaDAO.";
	

	@Override
	public List<BoardDTO> getList(BoardPager boardPager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", boardPager);
	}

	@Override
	public long getTotalCount(BoardPager boardPager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", boardPager);
	}


	public int setInsert(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setInsert", qnaDTO);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setHitUpdate", boardDTO);
	}
	
	public int setReplyUpdate(QnaDTO qnaDTO) throws Exception{	
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnaDTO);
	}
	
	public int setReply(QnaDTO qnaDTO) throws Exception{
		
		System.out.println("dao ref : "+qnaDTO.getRef());
		System.out.println("dao step : "+qnaDTO.getStep());
		System.out.println("dao depth : "+qnaDTO.getDepth());
		
		System.out.println("dao num : "+qnaDTO.getNum());
		System.out.println("dao productNum : "+qnaDTO.getProductNum());
		System.out.println("dao title : "+qnaDTO.getTitle());
		System.out.println("dao writer : "+qnaDTO.getWriter());
		System.out.println("dao contents : "+qnaDTO.getContents());
		System.out.println("dao boardPw : "+qnaDTO.getBoardPw());
		System.out.println("dao pwSet : "+qnaDTO.getPwSet());
		
		return sqlSession.insert(NAMESPACE+"setReply", qnaDTO);
	}

}
