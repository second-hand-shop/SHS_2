package com.shs.s1.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.admin.orderInfo.OInfoDTO;
import com.shs.s1.util.AdminPager;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.shs.s1.admin.AdminDAO.";
	
	public List<OInfoDTO> getList(AdminPager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public long getTotalCount(AdminPager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
//	public long getPrice() throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"getPrice");
//	}

}
