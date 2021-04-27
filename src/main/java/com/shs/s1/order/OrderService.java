package com.shs.s1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public int setCartInsert(CartDTO cartDTO)throws Exception{
		
		
		return orderDAO.setCartInsert(cartDTO);
	}
	
	
}
