package com.test;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class Customer {

	private String name;

	private String id;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return "Beijing";
	}

	public String getBrith() {
		return "1990-12-1";
	}
	
	public Customer(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}

	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper mapper=new ObjectMapper();
		
		Customer customer =new Customer("AtGuigu","1001");
		String jsonStr=mapper.writeValueAsString(customer);
		System.out.println(jsonStr);
		
	}

}
