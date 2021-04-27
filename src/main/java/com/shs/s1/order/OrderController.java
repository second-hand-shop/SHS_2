package com.shs.s1.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shs.s1.product.ProductDTO;
import com.shs.s1.product.ProductService;

@Controller
public class OrderController {

@Autowired	
private OrderService orderService;
@Autowired
private ProductService productService;
	
	
	public String setCartInsert(CartDTO cartDTO,HttpSession session)throws Exception{
		
		
		//MemberDTO memberDTO = session.getAttribute("");
		//cartDTO.setId(memberDTO.get)
		
		int result = orderService.setCartInsert(cartDTO);
		return "common/ProductAjaxResult";
		
	}
	
	@PostMapping("order/orderForm")
	public void getSelectOrder(ProductDTO productDTO,Model model)throws Exception{
		
		System.out.println(productDTO);
		productDTO = productService.getSelect(productDTO);
		model.addAttribute("dto", productDTO);
		
	}
	
	
	
	
}
