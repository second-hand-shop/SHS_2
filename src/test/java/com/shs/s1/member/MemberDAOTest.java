package com.shs.s1.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;

public class MemberDAOTest extends MyAbstractTest {

	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void memberJoinTest() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("id4");
		memberDTO.setPw("pw4");
		memberDTO.setName("name4");
		memberDTO.setPhone("phone4");
		memberDTO.setEmail("email4");		
		int result = memberDAO.memberJoin(memberDTO);
		
		assertEquals(1, result);
	}

	@Test
	public void memberLoginTest() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("id1");
		memberDTO.setPw("pw1");
		memberDTO = memberDAO.memberLogin(memberDTO);
		
		assertNotNull(memberDTO);
	}
	
	@Test
	public void memberIdFind() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName("name1");
		memberDTO.setEmail("email1");
		memberDTO = memberDAO.memberIdFind(memberDTO);
		
		assertNotNull(memberDTO);
	}
}
