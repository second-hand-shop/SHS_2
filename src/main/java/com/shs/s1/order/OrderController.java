package com.shs.s1.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shs.s1.member.MemberDTO;
import com.shs.s1.product.ProductDTO;
import com.shs.s1.product.ProductService;
import com.shs.s1.util.ProductPager;

@Controller
public class OrderController {

@Autowired	
private OrderService orderService;
@Autowired
private ProductService productService;
	
	@PostMapping("order/cartInsert")
	public String setCartInsert(ProductDTO productDTO,CartDTO cartDTO,HttpSession session,Model model)throws Exception{
		
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		cartDTO.setProductNum(productDTO.getProductNum());
		
		int result = orderService.setCartInsert(cartDTO);
		model.addAttribute("result", result);
		return "common/productAjaxResult";
		
	}
	
	@GetMapping("order/cartList")
	public String getCartList(Model model,MemberDTO memberDTO,HttpSession session) throws Exception{
		
		//세션에 멤버가 있다면 실행해줘라~
		memberDTO = (MemberDTO)(session.getAttribute("member"));
		if(memberDTO!=null) {
		List<CartDTO> ar = orderService.getCartList(memberDTO);
		model.addAttribute("list", ar);
		}else {
			model.addAttribute("list", null);
		}
		
		
		
		return "order/cartList";
	}
	
	
	
	
	@PostMapping("order/orderForm")
	public void getSelectOrder(long productNum,ProductDTO productDTO,Model model)throws Exception{
		
		System.out.println(productNum);
		productDTO.setProductNum(productNum);
		System.out.println(productDTO);
		System.out.println(productNum);
		productDTO = productService.getSelect(productDTO);
		System.out.println(productDTO);
		System.out.println(productNum);
		model.addAttribute("dto", productDTO);
		//ar로 넘겨야 2개 이상 받을수 있음
		
	}
	
	
	
	
	
	
}
