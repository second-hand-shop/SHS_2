package com.shs.s1.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.shs.s1.member.MemberDAO.";
	
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		int result = sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
		return result;
	}
}
