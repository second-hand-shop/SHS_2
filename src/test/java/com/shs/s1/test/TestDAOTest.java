package com.shs.s1.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shs.s1.MyAbstractTest;

public class TestDAOTest extends MyAbstractTest {

	@Autowired
	private TestDAO testDAO;
	
	
	
	@Test
	public void getListTest() throws Exception {
		List<TestDTO> ar = testDAO.getList();
		
		assertEquals(1, ar.size());
	}
	
}
