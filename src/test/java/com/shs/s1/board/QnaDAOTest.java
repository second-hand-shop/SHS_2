package com.shs.s1.board;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;
import com.shs.s1.board.notice.NoticeDTO;
import com.shs.s1.board.qna.QnaDAO;
import com.shs.s1.board.qna.QnaDTO;

public class QnaDAOTest extends MyAbstractTest{

	@Autowired
	private QnaDAO qnaDAO;
	
	//@Test
	public void setReply() throws Exception{
		QnaDTO qnaDTO = new QnaDTO();
		
		qnaDTO.setProductNum(2);
		qnaDTO.setTitle("1");
		qnaDTO.setWriter("id2");
		qnaDTO.setContents("1");
		qnaDTO.setRef(qnaDTO.getNum());
		qnaDTO.setStep(1);
		qnaDTO.setDepth(1);
		
		int result = qnaDAO.setReply(qnaDTO);
		
		qnaDTO.getProductNum();
		
		assertNotNull(result);
		
	}
	
	//--------Delete
	@Test
	public void setDeleteTest() throws Exception{
		
		QnaDTO qnaDTO = new QnaDTO();
		
		qnaDTO.setNum(21);
		
		int result = qnaDAO.setDelete(qnaDTO);
		
		assertNotNull(result);
		
	}

}
