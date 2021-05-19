package com.shs.s1.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.admin.orderInfo.OInfoDTO;
import com.shs.s1.util.AdminPager;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public List<OInfoDTO> getList(AdminPager pager) throws Exception {
		long totalCount= adminDAO.getTotalCount(pager);
		pager.makeRow();
		pager.makePaging(totalCount);
		return adminDAO.getList(pager);
	}
	
//	public long getPrice() throws Exception {
//		return adminDAO.getPrice();
//	}
}
