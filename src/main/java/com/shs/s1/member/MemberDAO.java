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
	
	public MemberDTO memberIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", memberDTO);
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
	
	public MemberDTO memberIdFind(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberIdFind", memberDTO);
	}
	
	public MemberDTO memberPwFind(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberPwFind", memberDTO);
	}
	
	public int memberModify(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"memberModify", memberDTO);
	}
	
}
