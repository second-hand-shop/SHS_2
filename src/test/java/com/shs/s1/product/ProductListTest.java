package com.shs.s1.product;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;


public class ProductListTest extends MyAbstractTest{

	@Autowired
	private ProductDAO productDAO;
	
	@Ignore
	public void productListTest() throws Exception{
		
	List<ProductDTO> ar = productDAO.getList();
	assertNotNull(ar);
		
	}
	
	@Test
	public void getSelectTEst() throws Exception{
		
		ProductDTO dto = new ProductDTO();
		dto.setProductNum(3);
		
		dto= productDAO.getSelect(dto);
		assertNotNull(dto);
		
	}
	
	
	
}
