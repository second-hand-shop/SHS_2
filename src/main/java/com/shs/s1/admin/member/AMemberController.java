package com.shs.s1.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.util.AdminPager;

@Controller
@RequestMapping("admin/member/**")
public class AMemberController {

	@Autowired
	private AMemberService aMemberService;
	
//	회원 getList================================================================
//	=======================================================================
	@GetMapping("memberList")
	public ModelAndView getList(AdminPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<AMemberDTO> ar = aMemberService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
//	비회원 getList================================================================
//	=======================================================================	
	@GetMapping("xMemberList")
	public ModelAndView getXList(AdminPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<XMemberDTO> ar = aMemberService.getXList(pager);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("admin/member/xMemberList");
		return mv;
	}
	
	
	
	
}
