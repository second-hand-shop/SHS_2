package com.shs.s1.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponService {

	@Autowired
	private CouponDAO couponDAO;
//---------------------------------------------------------------------------------------
	// getList ===================================================	
	public List<CouponDTO> getList() throws Exception {
		return couponDAO.getList();
	}
	
	// setInsert ===================================================
	public int setInsert(CouponDTO couponDTO) throws Exception {
		return couponDAO.setInsert(couponDTO);
	}
	
	// setDelete ===================================================
	public int setDelete(CouponDTO couponDTO) throws Exception {
		return couponDAO.setDelete(couponDTO);
	}
}
