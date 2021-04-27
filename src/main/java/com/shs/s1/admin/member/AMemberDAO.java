package com.shs.s1.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.shs.s1.admin.member.AMemberDAO.";
	
//	getList================================================================
//	=======================================================================
	public List<AMemberDTO> getList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	
	
}
