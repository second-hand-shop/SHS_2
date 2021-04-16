package com.shs.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.util.ProductPager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	
	public List<ProductDTO> getList(ProductPager pager) throws Exception{
		
	pager.makeRow();
	long totalCount = productDAO.getTotalCount();
	pager.makeNum(totalCount);
		
		
		
		
		return productDAO.getList(pager);
		
	}
	
	public ProductDTO getSelect(ProductDTO productDTO) throws Exception{
		
		return productDAO.getSelect(productDTO);
	}
	
	
	
	
	public int setInsert(ProductDTO productDTO)throws Exception{
		
		return productDAO.setInsert(productDTO);
	}
	
	public int setUpdate(ProductDTO productDTO)throws Exception{
		return productDAO.setUpdate(productDTO);
	}
	
	public int setDelete(ProductDTO productDTO)throws Exception{
		
		return productDAO.setDelete(productDTO);
	}
	
	
}
