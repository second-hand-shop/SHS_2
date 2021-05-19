package com.shs.s1.admin.ledger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/ledger/**")
public class LedgerController {
	
//	@Autowired
//	private LedgerService ledgerService;
	
	@GetMapping("ledgerList")
	public ModelAndView getLedgerList() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/ledger/ledgerList");
		return mv;
	}
	

}
