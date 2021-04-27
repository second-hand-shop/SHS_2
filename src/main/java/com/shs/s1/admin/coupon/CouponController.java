package com.shs.s1.admin.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.util.CouponPager;

@Controller
@RequestMapping("admin/coupon/**")
public class CouponController {
	
	@Autowired
	private CouponService couponService;
//----------------------------------------------------------------------------------
	// getList ===================================================
	@GetMapping("couponList")
	public ModelAndView getList(CouponPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CouponDTO> ar = couponService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("admin/coupon/couponList");
		return mv;
	}
	
	// getSelect ===================================================
	@GetMapping("couponSelect")
	@ResponseBody
	public CouponDTO getSelect(CouponDTO couponDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
		couponDTO = couponService.getSelect(couponDTO);
//		mv.addObject("result", couponDTO);
//		mv.setViewName("common/ajaxResult");
		return couponDTO;
	}
	
	// setInsert ===================================================
	@PostMapping("couponInsert")
	public ModelAndView setInsert(CouponDTO couponDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = couponService.setInsert(couponDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// setDelete ===================================================
	@PostMapping("couponDelete")
	public ModelAndView setDelete(CouponDTO couponDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = couponService.setDelete(couponDTO);	
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// setUpdate ===================================================	
//	@PostMapping("couponUpdate")
//	public ModelAndView setUpdate(CouponDTO couponDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		int result = couponService.setUpdate(couponDTO);
//		String message = "Update 실패";
//		String path = "../coupon/couponList";
//		if(result>0) {
//			message = "Update 성공";
//		}
//		mv.addObject("message", message);
//		mv.addObject("path", path);
//		mv.setViewName("common/commonResult");
//		return mv;
//	}
	
}
