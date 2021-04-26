package com.shs.s1.coupon;

import static org.junit.Assert.assertEquals;

import java.util.Calendar;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;

public class CouponDAOTest extends MyAbstractTest {

	@Autowired
	private CouponDAO couponDAO;
	
	@Test
	public void setInsertTest() throws Exception {
		int result = 0;
		for(int i=1;i<100;i++) {
			CouponDTO couponDTO = new CouponDTO();
			Calendar calendar = Calendar.getInstance();
			long time = calendar.getTimeInMillis();
			String couponNum=time+"";
			couponDTO.setCouponNum(couponNum);
			couponDTO.setId("id1");
			couponDTO.setDisRate(i);
			couponDTO.setDisPrice(i);
			couponDTO.setUsage("Y");
			result=couponDAO.setInsert(couponDTO);
		}
		assertEquals(1, result);
	}
}
