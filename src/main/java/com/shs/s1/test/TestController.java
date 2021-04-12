package com.shs.s1.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("test/**")
public class TestController {

	@Autowired
	private TestService testService;

	@GetMapping("testList")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<TestDTO> ar = testService.getList();
		
		mv.addObject("list", ar);
		mv.setViewName("test/testList");
		return mv;
		
	}

}
