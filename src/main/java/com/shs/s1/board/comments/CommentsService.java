package com.shs.s1.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentsService {

	@Autowired
	private CommentsDAO commentsDAO;
	
	// Comments Select
	public CommentsDTO getSelect(CommentsDTO commentsDTO)throws Exception{
		return commentsDAO.getSelect(commentsDTO);
	}
	
	// Comments Insert
	public int setInsert(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.setInsert(commentsDTO);
	}
	
	// Comments Delete
	public int setDelete(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.setDelete(commentsDTO);
	}
	
	// Comments Update
	public int setUpdate(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.setUpdate(commentsDTO);
	}
	
}
