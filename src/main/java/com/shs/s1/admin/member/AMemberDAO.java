package com.shs.s1.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.util.AdminPager;

@Repository
public class AMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.shs.s1.admin.member.AMemberDAO.";
	
//	getTotalCount==========================================================
//	=======================================================================
	public long getTotalCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount");
	}
	
	
//	getList================================================================
//	=======================================================================
	public List<AMemberDTO> getList(AdminPager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	
	
}
