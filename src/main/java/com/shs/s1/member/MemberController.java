package com.shs.s1.member;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.board.BoardDTO;
import com.shs.s1.email.MailUtil;


@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("memberPwFind")
	public void memberPwFind() throws Exception {

	}

	@PostMapping("memberPwFind")
	public ModelAndView memberPwFind (MemberDTO memberDTO, ModelAndView mv) throws Exception {	
		memberDTO = memberService.memberPwFind(memberDTO);  	  	
		System.out.println(memberDTO); //pw값 확인

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";		
		String hostSMTPid = ""; // 본인의 아이디 입력		
		String hostSMTPpwd = ""; // 비밀번호 입력

		// 보내는 사람 EMail, 제목, 내용 
		String fromEmail = "shs@naver.com"; // 보내는 사람 eamil
		String fromName = "SHS";  // 보내는 사람 이름
		String subject = "이메일 발송 테스트"; // 제목

		// 받는 사람 E-Mail 주소
		String mail = "hyemin386@gmail.com";  // 받는 사람 email		

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);	// SMTP 포트 번호 입력

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p>이메일 발송 테스트 입니다.</p>"); // 본문 내용
			email.send();			
		} catch (Exception e) {
			System.out.println(e);
		}

		/*if(memberDTO != null) {
    		String subject ="비밀번호 찾기";
        	String msg = memberDTO.getId()+" 님의 비밀번호는 "+memberDTO+"입니다!"; 
        	String email = memberDTO.getEmail();

    		MailUtil.sendMail(email, subject, msg);

    		mv.addObject("msg","메일 전송 성공");
    		mv.addObject("path", "./memberLogin");
    		mv.setViewName("common/commonResult");
    	}*/

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
			session.setAttribute("member", memberDTO);
			message="회원가입 성공";
			path="./memberSuccess";
		}
		model.addAttribute("msg",message);
		model.addAttribute("path",path);

		return "common/commonResult";
	}

	//join 후 성공했을 떄 페이지
	@GetMapping("memberSuccess")
	public void memberSuccess(MemberDTO memberDTO) throws Exception {

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
			mv.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
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

	//내가 쓴글 조회
	@GetMapping("memberMyBoard")
	public ModelAndView memberMyBoard(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = new BoardDTO();		
		memberDTO = (MemberDTO)session.getAttribute("member");		

		List<BoardDTO> ar = memberService.memberMyBoard(boardDTO);
		
		mv.addObject("list", ar);
		mv.addObject("board", "review");
		mv.setViewName("board/boardList");
		
		if(memberDTO == null) {
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/Result");
		} 
		
		return mv;
	}
}
