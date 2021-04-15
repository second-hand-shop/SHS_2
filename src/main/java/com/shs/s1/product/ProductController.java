package com.shs.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("productList")
	public String getList(Model model) throws Exception{
		
		List<ProductDTO> ar = productService.getList();
		model.addAttribute("list", ar);
		return "product/productList";
	}
	
	@GetMapping("detail")
	public String getSelect(ProductDTO productDTO,Model model) throws Exception{
		productDTO=productService.getSelect(productDTO);
		model.addAttribute("dto",productDTO);
		return "product/productSelect";
	}
	
	
	
	
}
