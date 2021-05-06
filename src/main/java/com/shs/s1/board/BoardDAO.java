package com.shs.s1.board;

import java.util.List;

import com.shs.s1.util.BoardPager;

public interface BoardDAO {
	
	//Board List
	 public List<BoardDTO> getList(BoardPager boardPager) throws Exception;
	 
	//전체 글의 갯수
	public long getTotalCount(BoardPager boardPager)throws Exception;
	 
	//Board Insert
	//insert를 주석처리한 이유는 qnaDAO에 값을 넘길때 depth, step, ref가 필요한데
	//BoardDTO에는 해당 값이 없음. 그래서 insert는 각자 따로 값을 받기위해 override하지 않도록 함.
	//public int setInsert(BoardDTO boardDTO) throws Exception;
	 
	//Board Select
	 public BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
	 
	//Board Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	 
	//Board Delete
	public int setDelete(BoardDTO boardDTO) throws Exception;
	 
	//Board Hit Update
	public int setHitUpdate(BoardDTO boardDTO) throws Exception;
	
}
