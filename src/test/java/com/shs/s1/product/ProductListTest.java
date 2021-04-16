package com.shs.s1.product;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;
import com.shs.s1.util.ProductPager;


public class ProductListTest extends MyAbstractTest{

	@Autowired
	private ProductDAO productDAO;
	
	@Ignore
	public void productListTest(ProductPager pager) throws Exception{
		
	List<ProductDTO> ar = productDAO.getList(pager);
	assertNotNull(ar);
		
	}
	
	@Ignore
	public void getSelectTEst() throws Exception{
		
		ProductDTO dto = new ProductDTO();
		dto.setProductNum(3);
		
		dto= productDAO.getSelect(dto);
		assertNotNull(dto);
		
	}
	
	@Test
	public void setInsertTEst() throws Exception{
		
		for(int i =101;i<150;i++) {
		ProductDTO dto = new ProductDTO();
		dto.setAmount(i);
		dto.setContents("contents"+i);
		dto.setKinds("kinds"+i);
		dto.setPrice(i);
		dto.setProductName("productName"+i);
		int result = productDAO.setInsert(dto);
		}
		
		
		
	}
	
	@Ignore
	public void setUpdateTest() throws Exception{
		ProductDTO dto = new ProductDTO();
		dto.setProductNum(4);
		dto.setAmount(1000);
		dto.setContents("얼룬 ");
		dto.setKinds("프로젝트");
		dto.setPrice(100000000);
		dto.setProductName("끝내고 맛있는거 먹으러가자");
		
		int result = productDAO.setUpdate(dto);
		assertNotEquals(result, 0);
		
	}
	
	@Ignore
	public void setDeleteTEst() throws Exception{
		ProductDTO dto = new ProductDTO();
		dto.setProductNum(4);
		int result = productDAO.setDelete(dto);
		assertNotEquals(result, 0);
	}





}
