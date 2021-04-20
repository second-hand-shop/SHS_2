package com.shs.s1.coupon;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.Pager;

@Service
public class CouponService {

	@Autowired
	private CouponDAO couponDAO;
//---------------------------------------------------------------------------------------
	// getList ===================================================	
	public List<CouponDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = couponDAO.getTotalCount(pager);
		pager.makePaging(totalCount);
		
		return couponDAO.getList(pager);
	}
	
	// getSelect ===================================================
	public CouponDTO getSelect(CouponDTO couponDTO) throws Exception {
		return couponDAO.getSelect(couponDTO);
	}
	
	// setInsert ===================================================
	public int setInsert(CouponDTO couponDTO) throws Exception {
		Calendar calendar = Calendar.getInstance();
		long time = calendar.getTimeInMillis();
		String couponNum = time+"";
		
		couponDTO.setCouponNum(couponNum);
		
		return couponDAO.setInsert(couponDTO);
	}
	
	// setDelete ===================================================
	public int setDelete(CouponDTO couponDTO) throws Exception {
		return couponDAO.setDelete(couponDTO);
	}
	
	// setUpdate ===================================================
	public int setUpdate(CouponDTO couponDTO) throws Exception {
		return couponDAO.setUpdate(couponDTO);
	}
}
