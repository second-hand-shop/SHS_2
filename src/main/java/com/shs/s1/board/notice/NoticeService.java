package com.shs.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.BoardPager;
import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.BoardService;

@Service
public class NoticeService implements BoardService{

	@Autowired
	private NoticeDAO noticeDAO; 
	
	public long totalCount(BoardPager boardPager) throws Exception{
		long totalCount = noticeDAO.getTotalCount(boardPager);
		
		return totalCount;
	}
	
	@Override
	public List<BoardDTO> getList(BoardPager boardPager) throws Exception {
		
		// startRow, lastRow
		boardPager.makeRow();
		
		// -------------
		// totalCount
		long totalCount = noticeDAO.getTotalCount(boardPager);
		
		// 페이징 계산
		boardPager.makeNum(totalCount);
		
		System.out.println(totalCount);
		System.out.println("Service Kind : "+boardPager.getKind());
		System.out.println("Service Search : "+boardPager.getSearch());
	
		return noticeDAO.getList(boardPager);

	}

	public int setInsert(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setInsert(boardDTO);
	}

	@Override
	// hit이 지금 2번씩 입력됨. ??
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		int result = noticeDAO.setHitUpdate(boardDTO);
		System.out.println("result : "+result);
		return noticeDAO.getSelect(boardDTO);
	}

	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelect(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setDelete(boardDTO);
	}
	

}
