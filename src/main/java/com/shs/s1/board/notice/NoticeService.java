package com.shs.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.Pager;
import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.BoardService;

@Service
public class NoticeService implements BoardService{

	@Autowired
	private NoticeDAO noticeDAO; 
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		
		// startRow, lastRow
		pager.makeRow();
		
		// -------------
		// 1. totalCount
		long totalCount = noticeDAO.getTotalCount(pager);
		
		// 페이징 계산
		pager.makeNum(totalCount);
		
		System.out.println(totalCount);
	
		return noticeDAO.getList(pager);

	}

	public int setInsert(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setInsert(boardDTO);
	}

	@Override
	// hit이 지금 2번씩 입력됨.
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		int result = noticeDAO.setHitUpdate(boardDTO);
		System.out.println("result : "+result);
		return noticeDAO.getSelect(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelect(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setDelete(boardDTO);
	}
	

}
