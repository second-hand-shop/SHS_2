package com.shs.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.ReviewFileDTO;
import com.shs.s1.board.comments.CommentsDTO;
import com.shs.s1.board.comments.CommentsService;
import com.shs.s1.member.MemberDTO;
import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CommentsService commentsService; 
	
	
	// Review List
	@GetMapping("reviewList")
	public ModelAndView getList(BoardPager boardPager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		CommentsDTO commentsDTO = new CommentsDTO();
		BoardDTO boardDTO = new BoardDTO();
		
		System.out.println("curPage : "+boardPager.getCurPage());
		
		List<BoardDTO> ar = reviewService.getList(boardPager);
		long totalCount = reviewService.totalCount(boardPager);
		
		mv.addObject("list", ar);
		mv.addObject("board", "review");
		mv.addObject("dto", boardDTO);
		mv.addObject("boardPager", boardPager);
		mv.addObject("totalCount", totalCount);
			
		mv.addObject("comments", commentsDTO);
		
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
		long getNum = reviewService.getNum();
		
		mv.addObject("getNum", getNum);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		mv.setViewName("board/boardInsert");
		
		return mv;
		
	}
	
	
	@PostMapping("reviewInsert")
	public ModelAndView setInsert(BoardDTO boardDTO, MultipartFile [] files) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setInsert(boardDTO, files);
		
		String message = "?????? ??????";
		String path = "./reviewList";
		
		if(result > 0) {
			message = "?????? ??????";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
		
	}
	
	
	// Review Select
	@GetMapping("reviewSelect")
	public ModelAndView getSelect(BoardDTO boardDTO, CommentsDTO commentsDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		boardDTO = reviewService.getSelect(boardDTO);
		
		MemberDTO memberDTO = new MemberDTO();
		
		// Comments Select
		commentsDTO = commentsService.getSelect(commentsDTO); 
		
		mv.addObject("comments", commentsDTO);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		mv.addObject("name", "comments");
		mv.addObject("member", memberDTO);
		
		mv.setViewName("board/boardSelect");
		
		return mv;
		
	}
	
	
	// Review Update
	@GetMapping("reviewUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//????????? ??? ????????????
		boardDTO = reviewService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "review");
		
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
	@PostMapping("reviewUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO, ModelAndView mv, MultipartFile [] files) throws Exception {
		
		int result = reviewService.setUpdate(boardDTO, files);
		
		if(result > 0) {
			System.out.println("?????? ??????");
			mv.setViewName("redirect:./reviewList");
		}
		
		else {
			System.out.println("?????? ??????");
			mv.setViewName("redirect:./reviewList");
		}
		
		return mv;
		
	}
	
	
	// Review Delete
	@GetMapping("reviewDelete")
	public ModelAndView setDelete(BoardDTO boardDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setDelect(boardDTO);
		String message = "?????? ??????";
		String path = "./reviewList";
		
		if(result > 0) {
			message = "?????? ??????";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
		
	}
	
	
	
	//file upload
	@PostMapping("summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boolean result = reviewService.setSummerFileDelete(fileName);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
	@PostMapping("summerFileUpload")
	public ModelAndView setSummerFileUpload(MultipartFile file)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Summer File Upload");
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getName());
		String fileName = reviewService.setSummerFileUpload(file);
		fileName = "../resources/upload/review/"+fileName;
		
		mv.addObject("result", fileName);
		mv.setViewName("common/ajaxResult");
		
		return mv;
		
	}
	

//	 @GetMapping("fileDelete") 
//	 public ModelAndView setFileDelete(ReviewFileDTO
//		 reviewFileDTO) throws Exception { ModelAndView mv = new ModelAndView(); int
//		 result = reviewService.setFileDelete(reviewFileDTO);
//		 
//		 mv.addObject("result", result); mv.setViewName("common/ajaxResult");
//		 
//		 return mv; 
//	}

	

}
