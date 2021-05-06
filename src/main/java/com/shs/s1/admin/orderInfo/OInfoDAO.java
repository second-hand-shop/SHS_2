package com.shs.s1.admin.orderInfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.util.AdminPager;

@Repository
public class OInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.shs.s1.admin.orderInfo.OInfoDAO.";
	
//	getList==================================================================
	public List<OInfoDTO> getList(AdminPager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
//	getTotalCount============================================================
	public long getTotalCount(AdminPager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
//	getSelect============================================================
	public List<OInfoDTO> getSelect(OInfoDTO oInfoDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getSelect", oInfoDTO);
	}
	
//	setShippingUpdate============================================================
	public int setShippingUpdate(OInfoDTO oInfoDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setShippingUpdate", oInfoDTO);
	}
	

}
