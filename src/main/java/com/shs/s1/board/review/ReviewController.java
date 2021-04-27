package com.shs.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
	//Review List
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

}
