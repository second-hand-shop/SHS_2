package com.shs.s1.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.shs.s1.test.TestDAO.";
	
	public List<TestDTO> getList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList");
	}
}
