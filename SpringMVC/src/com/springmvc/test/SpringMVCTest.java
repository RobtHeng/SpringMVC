package com.springmvc.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.crud.Dao.EmployeeDao;
import com.springmvc.crud.enties.Employee;

@Controller
public class SpringMVCTest {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@RequestMapping(value="testConversionServiceConverer")
	public String TestConverter(@RequestParam("employee") Employee employee){
		System.out.println("save"+employee);
		employeeDao.save(employee);
		return "redirect:/ListAllEmployees";
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	
}
