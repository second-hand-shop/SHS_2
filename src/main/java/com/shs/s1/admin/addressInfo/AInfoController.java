package com.shs.s1.admin.addressInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/addressInfo/**")
public class AInfoController {

	@Autowired
	private AInfoService aInfoService;

//	getList==================================================================
//===========================================================================
	@GetMapping("aInfoList")
	public ModelAndView getList(AInfoDTO aInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<AInfoDTO> ar = aInfoService.getList(aInfoDTO);
		mv.addObject("list", ar);
		mv.setViewName("admin/addressInfo/aInfoList");
		return mv;
	}
	
//	getXList=================================================================
//===========================================================================
	@GetMapping("aInfoXList")
	public ModelAndView getXList(AInfoDTO aInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<AInfoDTO> ar = aInfoService.getXList(aInfoDTO);
		mv.addObject("list", ar);
		mv.setViewName("admin/addressInfo/aInfoList");
		return mv;
	}
}
