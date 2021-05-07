package com.shs.s1.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.admin.orderInfo.OInfoDTO;
import com.shs.s1.util.AdminPager;

@Controller
@RequestMapping("admin/**")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminHome")
	public ModelAndView adminHome(AdminPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OInfoDTO> ar = adminService.getList(pager);
		long price = adminService.getPrice();
		mv.addObject("price", price);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.addObject("path", "admin/orderInfo/orderList");
		return mv;
	}
	
}
