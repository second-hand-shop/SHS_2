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
		int result = 0;
		for(int i=4;i<6;i++) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId("id"+i);
			memberDTO.setPw("pw"+i);
			memberDTO.setName("name"+i);
			memberDTO.setPhone("phone"+i);
			memberDTO.setEmail("email"+i);
			result = memberDAO.memberJoin(memberDTO);
		}
		assertEquals(1, result);
	}
}
