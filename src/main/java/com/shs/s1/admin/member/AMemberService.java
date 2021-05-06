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
	public List<AMemberDTO> getList(AdminPager pager) throws Exception {
		long totalCount=aMemberDAO.getTotalCount(pager);
		pager.makeRow();
		pager.makePaging(totalCount);
		return aMemberDAO.getList(pager);
	}
	
//	%%%%%%%%%%%%%%%%%%%%%%%%%% XMember %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
//	getXList================================================================
	public List<XMemberDTO> getXList(AdminPager pager) throws Exception {
		long totalCount = aMemberDAO.getXTotalCount(pager);
		pager.makeRow();
		pager.makePaging(totalCount);
		return aMemberDAO.getXList(pager);
	}
	
	
	
	
}
