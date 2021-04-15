package com.shs.s1.board;

import java.util.List;

public interface BoardService {
	
	//Board List
	public List<BoardDTO> getList(BoardDTO boardDTO) throws Exception;
	
	//Board Insert
	public int setInsert(BoardDTO boardDTO) throws Exception;
	
	//Board Select
	public int getSelect(BoardDTO boardDTO) throws Exception;
	
	//Board Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
	//Board Delete
	public int setDelect(BoardDTO boardDTO) throws Exception;
}
