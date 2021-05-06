package com.shs.s1.admin.addressInfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.shs.s1.admin.addressInfo.AInfoDAO.";
	
//	getList==================================================================
	public List<AInfoDTO> getList(AInfoDTO aInfoDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", aInfoDTO);
	}
	
//	getXList==================================================================
	public List<AInfoDTO> getXList(AInfoDTO aInfoDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getXList", aInfoDTO);
	}
}
