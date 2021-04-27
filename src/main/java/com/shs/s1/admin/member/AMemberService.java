package com.shs.s1.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.AdminPager;

@Service
public class AMemberService {

	@Autowired
	private AMemberDAO aMemberDAO;
	
//	getList================================================================
//	=======================================================================
	public List<AMemberDTO> getList(AdminPager pager) throws Exception {
		long totalCount=aMemberDAO.getTotalCount();
		pager.makeRow();
		pager.makePaging(totalCount);
		return aMemberDAO.getList(pager);
	}
	
	
}
