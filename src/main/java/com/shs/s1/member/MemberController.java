package com.shs.s1.member;

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
	public void memberJoin() throws Exception {
		
	}
	
	@PostMapping("memberJoin")
	public String memberJoin(MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		int result = memberService.memberJoin(memberDTO, session);
		String message="회원가입 실패";
		String path="./memberJoin";
		if(result>0) {
			message="회원가입 성공";
			path="../";
		}
		model.addAttribute("message",message);
		model.addAttribute("path",path);
		
		return "common/commonResult";
	}
	
	//id 중복확인
	@GetMapping("memberIdCheck")
	public String memberIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.memberIdCheck(memberDTO);
		String result = "0";
		if(memberDTO == null) {
			result ="1";
		}
		model.addAttribute("result", result);
		return "common/ajaxResult";
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
	
	//아이디 찾기
	@GetMapping("memberIdFind")
	public void memberFind() throws Exception {
		
	}
	
	@PostMapping("memberIdFind")
	public ModelAndView memberIdFind(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		memberDTO = memberService.memberIdFind(memberDTO);
		
		if(memberDTO != null) {
			mv.addObject("msg", "회원님의 아이디는 "+memberDTO.getId()+" 입니다");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "등록된 아이디가 없습니다");
			mv.addObject("path", "./memberIdFind");
			mv.setViewName("common/commonResult");
		}		
		return mv;
	}
}
