package com.shs.s1.admin.orderInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.util.AdminPager;

@Controller
@RequestMapping("admin/orderInfo/**")
public class OInfoController {

	@Autowired
	private OInfoService oInfoService;
	
//	getList==================================================================
	@GetMapping("orderList")
	public ModelAndView getList(AdminPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OInfoDTO> ar = oInfoService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.addObject("path", "admin/orderInfo/orderList");
		return mv;
	}
	
//	getSelect============================================================
	@GetMapping("selectList")
	public ModelAndView getSelect(OInfoDTO oInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OInfoDTO> ar = oInfoService.getSelect(oInfoDTO);
		mv.addObject("list", ar);
		mv.addObject("path", "admin/orderInfo/selectList");
		return mv;
	}
	
//	setShippingUpdate============================================================
	@PostMapping("shippingUpdate")
	public ModelAndView setShippingUpdate(OInfoDTO oInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = oInfoService.setShippingUpdate(oInfoDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
//	setShippingNum============================================================
	@PostMapping("shippingNumUpdate")
	public ModelAndView setShippingNum(OInfoDTO oInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = oInfoService.setShippingNum(oInfoDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
//	modifyShippingNum============================================================
	@GetMapping("shippingNumModify")
	public ModelAndView modifyShippingNum(OInfoDTO oInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = oInfoService.setShippingNum(oInfoDTO);
		oInfoDTO = oInfoService.getShippingSelect(oInfoDTO);
		mv.addObject("DTO", oInfoDTO);
		mv.setViewName("admin/orderInfo/selectShipList");
		return mv;
	}
	
//	getShippingSelect============================================================
	@GetMapping("selectShipList")
	public ModelAndView getShippingSelect(OInfoDTO oInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		oInfoDTO = oInfoService.getShippingSelect(oInfoDTO);
		mv.addObject("DTO", oInfoDTO);
		mv.setViewName("admin/orderInfo/selectShipList");
		return mv;
	}
	
}
