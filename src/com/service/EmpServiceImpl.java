package com.service;

import com.dao.EmpDaoImpl;
import com.dao.IEmpDao;

public class EmpServiceImpl implements IEmpService{
	private IEmpDao dao;

	public EmpServiceImpl() {
		dao = new EmpDaoImpl();
	}

	@Override
	public boolean checkEmp(String username, String password) {
		return dao.checkEmp(username, password);
	}

}
