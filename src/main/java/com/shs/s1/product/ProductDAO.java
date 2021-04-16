package com.shs.s1.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.util.ProductPager;

@Repository
public class ProductDAO {

	
	@Autowired
	SqlSession sqlSession;
	
	final String NAMESPACE="com.shs.s1.product.ProductDAO.";
	
	public List<ProductDTO> getList(ProductPager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	
	public ProductDTO getSelect(ProductDTO productDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getSelect", productDTO);
				
	}
	
	
	public Long getTotalCount()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount");
	}
	
	
	
	
	
	
	
	
	public int setInsert(ProductDTO productDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setInsert", productDTO);
	}
	
	
	public int setUpdate(ProductDTO productDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"setUpdate", productDTO);
	}
	
	public int setDelete(ProductDTO productDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE+"setDelete", productDTO);
	}
	
	
}
