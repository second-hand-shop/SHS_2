package com.shs.s1.admin.addressInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AInfoService {

	@Autowired
	private AInfoDAO aInfoDAO;

//	getAddress==================================================================
//==============================================================================
	public List<AInfoDTO> getList(AInfoDTO aInfoDTO) throws Exception {
		return aInfoDAO.getList(aInfoDTO);
	}
}
