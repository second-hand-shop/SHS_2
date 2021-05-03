package com.shs.s1.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.board.review.ReviewDTO;


@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
		
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
	
	public MemberDTO memberPwFind(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberPwFind(memberDTO);
	}
	
	public int memberModify(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberModify(memberDTO);
	}
	
	public int memberDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		return memberDAO.memberDelete(memberDTO);
	}
	
	public List<ReviewDTO> memberMyBoard (MemberDTO memberDTO) throws Exception {
		return memberDAO.memberMyBoard(memberDTO);
	}
	
}
