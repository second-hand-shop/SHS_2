package com.shs.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public int memberJoin(MemberDTO memberDTO, HttpSession session) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
}
