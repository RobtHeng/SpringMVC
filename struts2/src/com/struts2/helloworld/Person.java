package com.struts2.helloworld;

public class Person {
	private String personName;
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public Person() {

	}

	public Person(String personName, Integer id) {
		super();
		this.personName = personName;
		this.id = id;
	}

}
