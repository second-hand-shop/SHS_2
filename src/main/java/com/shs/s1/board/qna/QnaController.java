package com.shs.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.qna.QnaDTO;
import com.shs.s1.member.MemberDTO;
import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
		//list
		@GetMapping("qnaList")
		public ModelAndView getList(BoardPager boardPager) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			List<BoardDTO> ar = qnaService.getList(boardPager);
			long totalCount = qnaService.totalCount(boardPager);
			BoardDTO boardDTO = new BoardDTO();
			
			
			mv.addObject("list", ar);
			mv.addObject("board", "qna");
			mv.addObject("dto", boardDTO);

			mv.addObject("boardPager", boardPager);
			mv.addObject("totalCount", totalCount);
			
			mv.setViewName("board/boardList");
			
			return mv;
		}
		
		//insert
		@GetMapping("qnaInsert")
		public ModelAndView setInsert() throws Exception{
			
			QnaDTO qnaDTO = new QnaDTO();
			
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("dto", qnaDTO);
			mv.setViewName("board/boardInsert");
			mv.addObject("board", "qna");
			
			return mv;
		}
		
		@PostMapping("qnaInsert")
		public ModelAndView setInsert(QnaDTO qnaDTO) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			
			String message="등록 실패";
			
			int result = qnaService.setInsert(qnaDTO);	
			
			if(result>0) {
				message="등록 성공";
			}
			
			mv.addObject("msg", message);
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/commonResult");

			return mv;
			
		}
		
		
		//select
		@GetMapping("qnaSelect")
		public ModelAndView getSelect(BoardDTO boardDTO) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			QnaDTO qnaDTO = new QnaDTO();
			MemberDTO memberDTO = new MemberDTO();
			
			boardDTO = qnaService.getSelect(boardDTO);
			
			mv.addObject("board", "qna");
			mv.addObject("dto", boardDTO);
			
			mv.addObject("member", memberDTO);
			
			mv.setViewName("board/boardSelect");
		
			return mv;
		}
		
		
		//Delete
		@GetMapping("qnaDelete")
		public ModelAndView setDelete(BoardDTO boardDTO) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			String message = "삭제 실패";
			String path = "./qnaList";
			
			int result = qnaService.setDelect(boardDTO);
			
			if(result > 0) {
				message = "삭제 성공";
			}
			
			mv.addObject("msg", message);
			mv.addObject("path", path);
			
			mv.setViewName("common/commonResult");
			
			return mv;
		}
		
		
		//Update
		@GetMapping("qnaUpdate")
		public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
			ModelAndView mv = new ModelAndView();
			
			boardDTO = qnaService.getSelect(boardDTO);
			
			mv.addObject("dto", boardDTO);
			mv.addObject("board", "qna");
			mv.setViewName("board/boardUpdate");
			
			return mv;
		}
		
		@PostMapping("qnaUpdate")
		public ModelAndView setUpdate(BoardDTO boardDTO, ModelAndView mv) throws Exception{
			
			int result = qnaService.setUpdate(boardDTO);		

			//성공하면 리스트로 이동
			if(result > 0) {
				System.out.println("수정 성공");
				mv.setViewName("redirect:./qnaList");
			} 
			
			//실패하면 alert창, 리스트로 이동
			else {

				System.out.println("수정 실패");
				mv.setViewName("redirect:./qnaList");

			}
			
			
			return mv;
		}
		
		
		//reply
		@GetMapping("qnaReply")
		public ModelAndView setReply() throws Exception{
			
			ModelAndView mv = new ModelAndView();
			QnaDTO qnaDTO = new QnaDTO();
						
			mv.addObject("board", "qna");			
			mv.setViewName("board/boardReply");
			
			return mv;
			
		}
		
		@PostMapping("qnaReply")
		public ModelAndView setReply(QnaDTO qnaDTO) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			int result = qnaService.setReply(qnaDTO);
			
			mv.setViewName("redirect:./qnaList");
			
			return mv;
			
		}

}
