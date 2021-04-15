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
	
	@GetMapping("noticeList")
	public ModelAndView getList(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> ar = noticeService.getList(boardDTO);
		
		mv.addObject("list", ar);
		mv.addObject("board", "NOTICE");
		mv.setViewName("board/boardList");
		
		return mv;
		
	}
}
