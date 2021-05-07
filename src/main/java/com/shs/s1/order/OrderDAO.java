package com.shs.s1.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.admin.coupon.CouponDTO;
import com.shs.s1.member.MemberDTO;

@Repository
public class OrderDAO {

@Autowired
private SqlSession sqlSession;

final String NAMESPACE = "com.shs.s1.order.OrderDAO.";	
	
	
	public List<CouponDTO> getCouponList(MemberDTO memberDTO)throws Exception{
	return	sqlSession.selectList(NAMESPACE+"getCouponList", memberDTO);
	}
	
public int setCartInsert(CartDTO cartDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setCartInsert", cartDTO);
	}

public int setAddrInsert(AddressInfoDTO addressInfoDTO)throws Exception{
	
	
	return sqlSession.insert(NAMESPACE+"setAddrInsert", addressInfoDTO);
}

public AddressInfoDTO getAddrOne(AddressInfoDTO addressInfoDTO)throws Exception{
	
	return sqlSession.selectOne(NAMESPACE+"getAddrOne", addressInfoDTO);
}

public List<AddressInfoDTO> getAddrList(AddressInfoDTO addressInfoDTO)throws Exception{
	return sqlSession.selectList(NAMESPACE+"getAddrList", addressInfoDTO);
}



public List<CartDTO> getCartList(MemberDTO memberDTO)throws Exception{
	return sqlSession.selectList(NAMESPACE+"getCartList",memberDTO);
}

public int setOrderInfoInsert(AddressInfoDTO addressInfoDTO)throws Exception{
	return sqlSession.insert(NAMESPACE+"setOrderInfoInsert", addressInfoDTO);
}

}
