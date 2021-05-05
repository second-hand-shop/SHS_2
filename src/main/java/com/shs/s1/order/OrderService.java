package com.shs.s1.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shs.s1.member.MemberDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public int setCartInsert(CartDTO cartDTO)throws Exception{
		
		
		return orderDAO.setCartInsert(cartDTO);
	}
	
	public List<CartDTO> getCartList(MemberDTO memberDTO)throws Exception{

		return orderDAO.getCartList(memberDTO);
	}
	
	
	
	
	public int setAddrInsert(AddressInfoDTO addressInfoDTO)throws Exception{
		
		
		return orderDAO.setAddrInsert(addressInfoDTO);
	}
	
	public AddressInfoDTO getAddrOne(AddressInfoDTO addressInfoDTO)throws Exception{
		
		
		return orderDAO.getAddrOne(addressInfoDTO);
	}
	
	public List<AddressInfoDTO> getAddrList(AddressInfoDTO addressInfoDTO)throws Exception{
		
		
		return orderDAO.getAddrList(addressInfoDTO);
	}
	
	public int setOrderInfoInert(AddressInfoDTO addressInfoDTO)throws Exception{
		
		return orderDAO.setOrderInfoInsert(addressInfoDTO);
	}
}
