package com.shs.s1.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.shs.s1.admin.AdminDAO.";

}
