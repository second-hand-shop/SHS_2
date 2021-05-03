package com.shs.s1.board.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	/*
	 * //내가 쓴 글 조회
	 * 
	 * @GetMapping("boardList") public ModelAndView memberMyBoard (BoardPager
	 * boardPager) throws Exception { ModelAndView mv = new ModelAndView() }
	 */
}
