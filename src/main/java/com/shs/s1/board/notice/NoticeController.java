package com.shs.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.util.BoardPager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//Notice List
	@GetMapping("noticeList")
	public ModelAndView getList(BoardPager boardPager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//현재 페이지 확인
		//System.out.println("curPage : "+boardPager.getCurPage());
		
		List<BoardDTO> ar = noticeService.getList(boardPager);
		
		mv.addObject("list", ar);
		mv.addObject("board", "notice");
		mv.addObject("boardPager", boardPager);
		
		System.out.println("Start : "+boardPager.getStartNum());
		System.out.println("Last : "+boardPager.getLastNum());
		
		mv.setViewName("board/boardList");
		
		return mv;
		
	}
	
	//Notice Insert
	@GetMapping("noticeInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = new BoardDTO();
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardInsert");

		return mv;
	}
	
	
	@PostMapping("noticeInsert")
	public String setInsert(BoardDTO boardDTO, Model model) throws Exception{

		int result = noticeService.setInsert(boardDTO);
		
		String message="등록 실패";
		
		if(result>0) {
			message="등록 성공";
		}

		model.addAttribute("msg", message);
		model.addAttribute("path", "./noticeList");
		
		return "common/commonResult";
		
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
	public ModelAndView setUpdate(BoardDTO boardDTO, ModelAndView mv) throws Exception{
		
		int result = noticeService.setUpdate(boardDTO);
		
		//실행이 되었다면
		if(result>0) {
			//앞에서 실행되어 수정이 되었다면, 수정된 값을 boardlist로 보여주기 위해 redirect를 이용해  
			//다시 boardlist로 주소값을 보내준다.
			mv.setViewName("redirect:./noticeList");
		}
		
		//실행 되지 않았다면
		else {
			System.out.println("수정 실패");
			mv.setViewName("redirect:./noticeList");
		}
		
		return mv;
		
	}
	
	//Notice Delete
	@GetMapping("noticeDelete")
	public ModelAndView setDelete(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setDelect(boardDTO);
		
		String message="삭제 실패";
		String path = "./noticeList";
		
		if(result > 0) {
			message="삭제 성공";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
	}
	
	
}
