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
	
//	getAddress==================================================================
//==============================================================================
	public List<AInfoDTO> getAddress(AInfoDTO aInfoDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getAddress", aInfoDTO);
	}
}
