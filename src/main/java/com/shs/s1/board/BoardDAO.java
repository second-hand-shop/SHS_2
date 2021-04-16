package com.shs.s1.board;

import java.util.List;

public interface BoardDAO {
	
	//Board List
	 public List<BoardDTO> getList(BoardDTO boardDTO) throws Exception;
	 
	//Board Insert
	 public int setInsert(BoardDTO boardDTO) throws Exception;
	 
	//Board Select
	 public BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
	 
	 //Board Update
	 public int setUpdate(BoardDTO boardDTO) throws Exception;
	 
	 //Board Delete
	 public int setDelete(BoardDTO boardDTO) throws Exception;
	 
	 //Board Hit Update
	 public int setHitUpdate(BoardDTO boardDTO) throws Exception;
	
}
