package com.shs.s1.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/**")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminHome")
	public void adminHome() throws Exception {
		
	}
}
