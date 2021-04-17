package com.shs.s1.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE="com.shs.s1.coupon.CouponDAO.";
//------------------------------------------------------------------------------------------
	// getList ===================================================
	public List<CouponDTO> getList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	// setInsert ===================================================
	public int setInsert(CouponDTO couponDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setInsert", couponDTO);
	}
	
	// setDelete ===================================================
	public int setDelete(CouponDTO couponDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", couponDTO);
	}
	
	// setUpdate ===================================================
	public int setUpdate(CouponDTO couponDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", couponDTO);
	}
}
