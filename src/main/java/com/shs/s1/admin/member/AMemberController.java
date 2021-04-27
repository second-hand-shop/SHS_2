package com.shs.s1.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/member/**")
public class AMemberController {

	@Autowired
	private AMemberService aMemberService;
	
//	getList================================================================
//	=======================================================================
	@GetMapping("memberList")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<AMemberDTO> ar = aMemberService.getList();
		mv.addObject("list", ar);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
	
	
}
