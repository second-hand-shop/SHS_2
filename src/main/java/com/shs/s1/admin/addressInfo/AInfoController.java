package com.shs.s1.admin.addressInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/address/**")
public class AInfoController {

	@Autowired
	private AInfoService aInfoService;

//	getAddress==================================================================
//==============================================================================
	@PostMapping("memberAddress")
	@ResponseBody
	public List<AInfoDTO> getAddress(AInfoDTO aInfoDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
		List<AInfoDTO> ar = aInfoService.getAddress(aInfoDTO);
//		mv.addObject("result", ar);
//		mv.setViewName("common/ajaxResult");
		return ar;
	}
}
