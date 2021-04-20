package com.shs.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	HttpSession session;
	ModelAndView mv = new ModelAndView();
	
	public int memberJoin(MemberDTO memberDTO, HttpSession session) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	
	public MemberDTO memberIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberIdCheck(memberDTO);
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberLogin(memberDTO);
	}
	
	public MemberDTO memberIdFind(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberIdFind(memberDTO);
	}
	
}
