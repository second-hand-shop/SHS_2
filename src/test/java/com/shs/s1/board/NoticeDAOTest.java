package com.shs.s1.board;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;
import com.shs.s1.board.notice.NoticeDAO;
import com.shs.s1.board.notice.NoticeDTO;

public class NoticeDAOTest extends MyAbstractTest{

	@Autowired
	private NoticeDAO noticeDAO;
	
	//--------List
	//@Test
	public void getListTest() throws Exception{
		
		BoardDTO boardDTO = new BoardDTO();
		
		List<BoardDTO> ar = noticeDAO.getList(boardDTO);
		
		assertNotEquals(0, ar.size());
		
		System.out.println(ar.size());
		
	}
	
	//--------Insert
	//@Test
	public void setInsertTest() throws Exception{
		
		int result = 0;
		
		NoticeDTO noticeDTO = new NoticeDTO(); 
		
		noticeDTO.setTitle("nTitle4");
		noticeDTO.setWriter("id4");
		noticeDTO.setContents("nContents4");
		
		result = noticeDAO.setInsert(noticeDTO);
		
		System.out.println(noticeDTO.getNum());
		System.out.println(noticeDTO.getTitle());
		System.out.println(noticeDTO.getWriter());
		System.out.println(noticeDTO.getContents());
		
		assertNotNull(result);
		
	}
	
	
	//--------Select
	//@Test
	public void getSelect() throws Exception{
		
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setNum(3);
		
		noticeDTO = (NoticeDTO) noticeDAO.getSelect(noticeDTO);
		
		System.out.println(noticeDTO.getNum());
		System.out.println(noticeDTO.getTitle());
		System.out.println(noticeDTO.getWriter());
		
		assertNotNull(noticeDTO);
		
	}
	
	
	//--------Update
	//@Test
	public void setUpdateTest() throws Exception{
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(4);
		
		noticeDTO = (NoticeDTO) (noticeDAO.getSelect(noticeDTO));
		
		noticeDTO.setTitle("4");
		noticeDTO.setWriter("4");
		
		int result = noticeDAO.setUpdate(noticeDTO);
		
		assertNotNull(result);
		
		
	}
	
	//--------Delete
	//@Test
	public void setDeleteTest() throws Exception{
		
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setNum(4);
		
		int result = noticeDAO.setDelete(noticeDTO);
		
		assertNotNull(result);
		
	}

}
