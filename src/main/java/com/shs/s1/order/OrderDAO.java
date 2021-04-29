package com.shs.s1.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

@Autowired
private SqlSession sqlSession;

final String NAMESPACE = "com.shs.s1.order.OrderDAO.";	
	
	
	
	
public int setCartInsert(CartDTO cartDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setCartInsert", cartDTO);
	}

public int setAddrInsert(AddressInfoDTO addressInfoDTO)throws Exception{
	
	
	return sqlSession.insert(NAMESPACE+"setAddrInsert", addressInfoDTO);
}





}
