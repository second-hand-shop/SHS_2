package com.shs.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.board.qna.QnaDTO;
import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.BoardService;
import com.shs.s1.util.BoardPager;

@Service
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO; 
	
	@Override
	public List<BoardDTO> getList(BoardPager boardPager) throws Exception {
		
		// startRow, lastRow
		boardPager.makeRow();
		
		// -------------
		// 1. totalCount
		long totalCount = qnaDAO.getTotalCount(boardPager);
		
		// 페이징 계산
		boardPager.makeNum(totalCount);
		
		System.out.println(totalCount);
		
		return qnaDAO.getList(boardPager);
	}

	public int setInsert(QnaDTO qnaDTO) throws Exception {
		return qnaDAO.setInsert(qnaDTO);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		int result = qnaDAO.setHitUpdate(boardDTO);
		return qnaDAO.getSelect(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return qnaDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelect(BoardDTO boardDTO) throws Exception {
		return qnaDAO.setDelete(boardDTO);
	}
	
	
	public int setReply(QnaDTO qnaDTO) throws Exception{
		//부모글의 ref, step depth 조회
		BoardDTO boardDTO = qnaDAO.getSelect(qnaDTO);
		QnaDTO parent = (QnaDTO)boardDTO;
		System.out.println(parent.getRef());
		System.out.println(parent.getStep());
		System.out.println(parent.getDepth());
		
		qnaDTO.setRef(parent.getRef());
		qnaDTO.setStep(parent.getStep()+1);
		qnaDTO.setDepth(parent.getDepth()+1);
		
		int result = qnaDAO.setReplyUpdate(parent);
		result = qnaDAO.setReply(qnaDTO);
		
		return result;
	}


}
