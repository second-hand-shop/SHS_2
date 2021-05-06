package com.shs.s1.admin.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.util.AdminPager;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE="com.shs.s1.admin.coupon.CouponDAO.";
//------------------------------------------------------------------------------------------
	// getList ===================================================
	public List<CouponDTO> getList(AdminPager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	// getTotalCount ===================================================	
	public long getTotalCount(AdminPager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	// getSelect ===================================================
	public CouponDTO getSelect(CouponDTO couponDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", couponDTO);
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
