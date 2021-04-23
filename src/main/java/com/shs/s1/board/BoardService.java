package com.shs.s1.board;

import java.util.List;

import com.shs.s1.util.Pager;

public interface BoardService {
	
	//Board List
	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	//Board Select
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
	
	//Board Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
	//Board Delete
	public int setDelect(BoardDTO boardDTO) throws Exception;
	
}
