package com.shs.s1.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AMemberService {

	@Autowired
	private AMemberDAO aMemberDAO;
	
//	getList================================================================
//	=======================================================================
	public List<AMemberDTO> getList() throws Exception {
		return aMemberDAO.getList();
	}
	
	
}
