package com.shs.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.comments.CommentsDTO;
import com.shs.s1.board.comments.CommentsService;
import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
	// Review List
	@GetMapping("reviewList")
	public ModelAndView getList(BoardPager boardPager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("curPage : "+boardPager.getCurPage());
		
		List<BoardDTO> ar = reviewService.getList(boardPager);
		
		mv.addObject("list", ar);
		mv.addObject("board", "review");
		mv.addObject("boardPager", boardPager);
		
		System.out.println("Start : "+boardPager.getStartNum());
		System.out.println("Last : "+boardPager.getLastNum());
		
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	
	// Review Insert
	@GetMapping("reviewInsert")
	public ModelAndView setInsert() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = new BoardDTO();
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		mv.setViewName("board/boardInsert");
		
		return mv;
		
	}
	
	
	@PostMapping("reviewInsert")
	public ModelAndView setInsert(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setInsert(boardDTO);
		
		String message = "등록 실패";
		String path = "./reviewList";
		
		if(result > 0) {
			message = "등록 성공";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
		
	}
	
	
	// Review Select
	@GetMapping("reviewSelect")
	public ModelAndView getSelect(BoardDTO boardDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		CommentsService commentsService = new CommentsService();
		CommentsDTO commentsDTO = new CommentsDTO(); 
		
		boardDTO = reviewService.getSelect(boardDTO);
		commentsDTO = commentsService.getSelect(commentsDTO);
		
		
		mv.addObject("comments", commentsDTO);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		
		mv.setViewName("board/boardSelect");
		
		return mv;
		
	}
	
	
	// Review Update
	@GetMapping("reviewUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//선택한 값 가져오기
		boardDTO = reviewService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
	@PostMapping("reviewUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO, ModelAndView mv) throws Exception {
		
		int result = reviewService.setUpdate(boardDTO);
		
		if(result > 0) {
			System.out.println("수정 성공");
			mv.setViewName("redirect:./reviewList");
		}
		
		else {
			System.out.println("수정 실패");
			mv.setViewName("redirect:./reviewList");
		}
		
		return mv;
		
	}
	
	
	// Review Delete
	@GetMapping("reviewDelete")
	public ModelAndView setDelete(BoardDTO boardDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setDelect(boardDTO);
		String message = "삭제 실패";
		String path = "./reviewList";
		
		if(result > 0) {
			message = "삭제 성공";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
		
	}
	

}
