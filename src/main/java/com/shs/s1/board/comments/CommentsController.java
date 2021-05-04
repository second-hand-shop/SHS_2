package com.shs.s1.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;


@Controller
@RequestMapping("/comments/**")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	@PostMapping("commentsDelete")
	public void commentsDelete() throws Exception{

	}
	
	@GetMapping("commentsInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommentsDTO commentsDTO = new CommentsDTO();
		
		mv.addObject("dto", commentsDTO);
		mv.setViewName("board/boardSelect");

		return mv;
	}
		
	@PostMapping("commentsInsert")
	public String setInsert(CommentsDTO commentsDTO, Model model) throws Exception{
		
		int result = commentsService.setInsert(commentsDTO);
		
//		String message="등록 실패";
//		
//		if(result>0) {
//			message="등록 성공";
//		}
//
//		model.addAttribute("message", message);
//		model.addAttribute("path", "./reviewList");
		
		return "redirect:../review/reviewSelect";
	}

	
	

}
