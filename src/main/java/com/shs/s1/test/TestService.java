package com.shs.s1.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Autowired
	private TestDAO testDAO;
	
	public List<TestDTO> getList() throws Exception {
		return testDAO.getList();
	}
}
