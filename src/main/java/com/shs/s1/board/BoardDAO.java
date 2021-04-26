package com.shs.s1.board;

import java.util.List;

import com.shs.s1.util.BoardPager;

public interface BoardDAO {
	
	//Board List
	 public List<BoardDTO> getList(BoardPager boardPager) throws Exception;
	 
	//전체 글의 갯수
	public long getTotalCount(BoardPager boardPager)throws Exception;
	 
	//Board Insert
//	 public int setInsert(BoardDTO boardDTO) throws Exception;
	 
	//Board Select
	 public BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
	 
	//Board Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	 
	//Board Delete
	public int setDelete(BoardDTO boardDTO) throws Exception;
	 
	//Board Hit Update
	public int setHitUpdate(BoardDTO boardDTO) throws Exception;
	
}
