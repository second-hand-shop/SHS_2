package com.shs.s1.admin.orderInfo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.AdminPager;

@Service
public class OInfoService {

	@Autowired
	private OInfoDAO oInfoDAO;
	
//	getList==================================================================
	public List<OInfoDTO> getList(AdminPager pager) throws Exception {
		long totalCount= oInfoDAO.getTotalCount(pager);
		pager.makeRow();
		pager.makePaging(totalCount);
		return oInfoDAO.getList(pager);
	}
	
//	getSelect============================================================
	public List<OInfoDTO> getSelect(OInfoDTO oInfoDTO) throws Exception {
		return oInfoDAO.getSelect(oInfoDTO);
	}

//	setShippingUpdate============================================================
	public int setShippingUpdate(OInfoDTO oInfoDTO) throws Exception {
		return oInfoDAO.setShippingUpdate(oInfoDTO);
	}
	
//	setShippingNum============================================================
	public int setShippingNum(OInfoDTO oInfoDTO) throws Exception {
		return oInfoDAO.setShippingNum(oInfoDTO);
	}
	
//	getShippingSelect============================================================
	public OInfoDTO getShippingSelect(OInfoDTO oInfoDTO) throws Exception {
		return oInfoDAO.getShippingSelect(oInfoDTO);
	}
}
