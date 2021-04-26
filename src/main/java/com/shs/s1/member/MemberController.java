package com.shs.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.email.Email;
import com.shs.s1.email.EmailSender;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//메일전송 관련
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	@GetMapping("memberPwFind")
	public void memberPwFind() throws Exception {
		
	}
	
    @PostMapping("memberPwFind")
    public ModelAndView memberPwFind (MemberDTO memberDTO, ModelAndView mv) throws Exception {
    	memberDTO = memberService.memberPwFind(memberDTO);

        if(memberDTO != null) {
            email.setContent("비밀번호는 "+memberDTO.getPw()+" 입니다.");
            email.setReceiver(memberDTO.getEmail());
            email.setSubject(memberDTO.getName()+"님 비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(email);
            mv.addObject("msg", "회원님의 이메일로 비밀번호를 전송해드렸습니다.");
            mv.addObject("path","../");
            mv.setViewName("common/commonResult");
        }else {
			mv.addObject("msg", "등록된 정보가 없습니다");
			mv.addObject("path", "./memberPwFind");
			mv.setViewName("common/commonResult");
        }
        return mv;
    }

	//약관동의
	@RequestMapping("memberJoinCheck")
	public void memberJoinCheck()throws Exception{
		
	}
	
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
	public void memberIdFind() throws Exception {
		
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
	
	//마이페이지
	@GetMapping("memberAccount")
	public void memberAccount() throws Exception {
		
	}
	
	//회원 정보 수정
	@GetMapping("memberModify")
	public void memberModify(MemberDTO memberDTO) throws Exception {
		
	}
	
	@PostMapping("memberModify")
	public ModelAndView memberModify(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.memberModify(memberDTO);
		if(result>0) {	
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "회원정보 수정 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "회원정보 수정 실패");
			mv.addObject("path", "./memberModify");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}
	
	//회원 탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
	    memberDTO = (MemberDTO)session.getAttribute("member");
		
		int result = memberService.memberDelete(memberDTO, session);
		if(result>0) {		
			session.invalidate();
			mv.addObject("msg", "정상적으로 탈퇴되었습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "탈퇴 실패");
			mv.addObject("path", "./memberModify");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}
}
