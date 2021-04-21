package com.shs.s1.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//회원가입
	@GetMapping("memberJoin")
	public ModelAndView memberJoin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public String memberJoin(MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		int result = memberService.memberJoin(memberDTO, session);				
		session.setAttribute("member", memberDTO);
		
		String message = "";	
		String path="";
		if(result>0) {
			message ="회원가입 성공";
			path="memberSuccess";
		} else {
			message="회원가입 실패";
			path="memberJoin";
		}
		//memberjoinResult로 model이용해 메시지 전송
		model.addAttribute("msg",message);
		model.addAttribute("path",path);
		return "common/commonResult";
	}
	
	//회원가입 성공 후 페이지
	@GetMapping("memberSuccess")
	public void memberSuccess() throws Exception {
		
	}
	
	//id 중복확인
	@GetMapping("memberIdCheck")
	public ModelAndView memberIdCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberIdCheck(memberDTO);
		int result = 1; //중복
		if(memberDTO == null) { 
			result = 0; //중복데이터 없음
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//로그인
	@GetMapping("memberLogin")
	public ModelAndView memberLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberLogin(memberDTO);
		
		if(memberDTO != null) {
			//index 페이지로 이동
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "로그인 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
			//mv.setViewName("redirect:../");
			
		}else {
			//로그인 실패 메세지를 alert
			//로그인 입력 폼 으로 이동
			mv.addObject("msg", "로그인 실패");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/commonResult");
		}		
		return mv;
	}

	
	//로그아웃
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("memberIdFind")
	public void memberIdFind() throws Exception {
		
	}
	
	@PostMapping("memberIdFind")
	public ModelAndView memberIdFind(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		//사용자가 입력한 name과 email 받아오기
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		mv.addObject("dto", memberDTO);
		mv.addObject("name", name);
		mv.addObject("email", email);
		mv.setViewName("member/memberIdFind");
		
		if(name == memberDTO.getName() && email == memberDTO.getEmail()) {
			memberDTO = memberService.memberIdFind(memberDTO);
			System.out.println(memberDTO.getId());
		} else {
			
		}
		return mv;
	}
}
