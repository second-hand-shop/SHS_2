package com.shs.s1.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/coupon/**")
public class CouponController {
	
	@Autowired
	private CouponService couponService;
//----------------------------------------------------------------------------------
	// getList ===================================================
	@GetMapping("couponList")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CouponDTO> ar = couponService.getList();
		
		mv.addObject("list", ar);
		mv.setViewName("coupon/couponList");
		return mv;
	}
	
	// setInsert ===================================================
	@GetMapping("couponInsert")
	public ModelAndView setInsert(CouponDTO couponDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = couponService.setInsert(couponDTO);
		
		return mv;
	}
	
}
