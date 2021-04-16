package com.shs.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
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
	
	@PostMapping("memberLogin")
	public void memberLogin() throws Exception {
		
	}
	

}