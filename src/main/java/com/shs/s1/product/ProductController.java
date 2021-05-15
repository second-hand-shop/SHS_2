package com.shs.s1.product;



import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.shs.s1.util.ProductFileManager;
import com.shs.s1.util.ProductPager;

@Controller
@RequestMapping("/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("productList")
	public String getList(Model model,ProductPager pager) throws Exception{
		
		List<ProductDTO> ar = productService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
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
	public String setInsert(ProductDTO productDTO,MultipartFile[] files,Model model) throws Exception{
//		System.out.println(files);
		int result = productService.setInsert(productDTO,files);
		
		//String path="./productList";
		
		//model.addAttribute("path", path);
		
		//return "common/commonResult";
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
		}
		return "redirect:./productList";
	}
	
	@PostMapping("productFileDelte")
	public String setFileDelte(ProductImageDTO productImageDTO) throws Exception{
		
		productImageDTO = productService.getFileselect(productImageDTO);
		int result = productService.setFileDelete(productImageDTO);
		String rtn = "redirect:./productUpdate?productNum="+productImageDTO.getProductNum();
		
		
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		System.out.println(productImageDTO.getProductNum());
		
		
		return rtn;
	}
	
	

	
	
	
	
	



	
	
	
	
	
}
