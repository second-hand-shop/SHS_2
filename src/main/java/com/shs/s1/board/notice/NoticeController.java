package com.shs.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//Notice Update
	//update 시작하면 실행!
	@GetMapping("noticeUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//먼저 값 가져오기
		boardDTO = noticeService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		
		mv.setViewName("board/boardUpdate");
		
		return mv;
		
	}
	
	//update 버튼을 눌러 값을 보내면 실행!
	//앞에서 보낸 ModelAndView값을 받아옴
	@PostMapping("noticeUpdate")
	public void setUpdate(BoardDTO boardDTO, ModelAndView mv) throws Exception{
		
		int result = noticeService.setUpdate(boardDTO);
		
		//실행이 되었다면
		if(result>0) {
							// 왜 redirect를 썻을까?
			mv.setViewName("redirect:./boardList");
		}
		
		//실행이 되지 않았다면
		else {
			
		}
		
	}
	
	
	
}
