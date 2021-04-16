package com.shs.s1.product;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	
	
	
	@GetMapping("productInsert")
	public String setInsert() throws Exception{
		
		return "product/productInsert";
	}
	
	@PostMapping("productInsert")
	public String setInsert(ProductDTO productDTO) throws Exception{
				
		int result = productService.setInsert(productDTO);
		
		return "redirect:./productList";
	}
	
	
	
	@PostMapping("productDelete")
	public String setDelete(ProductDTO productDTO) throws Exception{
		
		int result = productService.setDelete(productDTO);
		
		return "redirect:./productList";
		
	}
	
	@GetMapping("productUpdate")
	public String setUpdate(ProductDTO productDTO,Model model) throws Exception{
		
		productDTO = productService.getSelect(productDTO);
		model.addAttribute("dto",productDTO);
		return "product/productUpdate";
		
	}
	
	@PostMapping("productUpdate")
	public String setUpdate(ProductDTO productDTO) throws Exception{
		
		int result = productService.setUpdate(productDTO);
		
		
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
			System.out.println(productDTO.getProductNum());
		}
		return "redirect:./productList";
	}
	
	
	
	
	
	
	



	
	
	
	
	
}
