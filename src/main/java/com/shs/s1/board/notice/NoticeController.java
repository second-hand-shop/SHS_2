package com.shs.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//Notice List
	@GetMapping("noticeList")
	public ModelAndView getList(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> ar = noticeService.getList(boardDTO);
		
		mv.addObject("list", ar);
		mv.setViewName("board/boardList");
		mv.addObject("board", "notice");
		
		return mv;
		
	}
	
	
	//Notice Select
	@GetMapping("noticeSelect")
	public ModelAndView getSelect(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		boardDTO = noticeService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/boardSelect");
		mv.addObject("board", "notice");

		return mv;
		
	}
}
