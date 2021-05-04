package com.shs.s1.board.comments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/comments/**")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	
	// Comments Insert
	@GetMapping("commentsInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommentsDTO commentsDTO = new CommentsDTO();
		
		mv.addObject("dto", commentsDTO);
		mv.setViewName("board/boardSelect");

		return mv;
	}
		
	@PostMapping("commentsInsert")
	public ModelAndView setInsert(CommentsDTO commentsDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = commentsService.setInsert(commentsDTO);
		
		mv.setViewName("redirect:../review/reviewList");
		
		return mv;
	}
	
	
	// Comments Delete
	@GetMapping("commentsDelete")
	public ModelAndView commentsDelete(CommentsDTO commentsDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = commentsService.setDelete(commentsDTO);
		String message = "삭제 실패";
		String path = "../review/reviewList";
		
		if(result > 0) {
			message = "삭제 성공";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
	}
	
	@GetMapping("commentsResult")
	public ModelAndView commentsResult(CommentsDTO commentsDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("comments", commentsDTO);
		mv.setViewName("comments/commentsResult");
		
		return mv;
		
	}

	
	

}
