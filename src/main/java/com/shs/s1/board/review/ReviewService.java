package com.shs.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.BoardService;
import com.shs.s1.util.BoardPager;

@Service
public class ReviewService implements BoardService{

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List<BoardDTO> getList(BoardPager boardPager) throws Exception {
		
		// startRow, lastRow 만드는 메서드
		boardPager.makeRow();
		
		// totalCount 구하기
		long totalCount = reviewDAO.getTotalCount(boardPager);
		
		// 페이징 계산
		boardPager.makeNum(totalCount);
		
		System.out.println(boardPager);
		
		return reviewDAO.getList(boardPager);
	}

	
	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		// hit
		int result = reviewDAO.setHitUpdate(boardDTO);
		return reviewDAO.getSelect(boardDTO);
	}
	
	
	public int setInsert(BoardDTO boardDTO) throws Exception {
		return reviewDAO.setInsert(boardDTO);
	}

	
	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return reviewDAO.setUpdate(boardDTO);
	}

	
	@Override
	public int setDelect(BoardDTO boardDTO) throws Exception {
		return reviewDAO.setDelete(boardDTO);
	}
	
	
	
}
