<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.struts2.helloworld.Person" %>
<%@ page import="java.util.*" %>
<%@ page import="com.struts2.helloworld.PersonComparator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
	
	ProductId:${productId};
	<br /><br />
	
	ProductName:${productName};
	<s:property value="#request.test.productName"/>
	<br /><br />
	
	ProductDesc:${productDesc};
	<br /><br />
	
	ProductPrice:${productPrice};
	<br /><br />

	<s:set name="productName" value="'productName'" scope="request"></s:set>
	ProductName:${requestScope.productName}
	<br /><br />
	
	<%
		Person person = new Person();
		person.setPersonName("hznaid");
		person.setId(23);
		request.setAttribute("person", person);
	%>
	
	<s:push value="#request.person">
		${personName}
	</s:push>
	<br /><br />
		<s:property value="#request.person.personName"/>
	<br /><br />
	
	<s:if test="productPrice >1000">
		I7
	</s:if>
	<s:elseif test="productPrice >800">
		I5
	</s:elseif>
	<s:else>
		I3
	</s:else>	
	<br /><br />
	<%
		List<Person> personList = new ArrayList<Person>();
		personList.add(new Person("AA",11));
		personList.add(new Person("DD",12));
		personList.add(new Person("CC",13));
		personList.add(new Person("BB",14));
		
		request.setAttribute("personList", personList);
	%>
	
	<s:iterator value="#request.personList" status="status">
		index:${status.index}-count:${status.count}:${personName}-${id}<br />
	</s:iterator>
	<br /><br />
	<%
		PersonComparator pc=new PersonComparator();
		
		request.setAttribute("PersonComparator", pc);
	
	%>
	
	<s:sort comparator="#request.PersonComparator" source="#request.personList" var="personList2"></s:sort>
	
	<br /><br/>
	<s:iterator value="#attr.personList2">
		${personName }-${id }<br />
	</s:iterator>
	<%
		Date date=new Date();
		request.setAttribute("date", date);
	%>
	
	<br /><br />
	
	<s:date name="#request.date" format="yyyy-MM-dd" var="date2" />
	date:${date2 }
	<br /><br/>
	
	<s:iterator value="#request.personList">
		<s:a href="gerPerson.action?personName=%{personName}">${personName}</s:a>
	</s:iterator>
	<br /><br />
	
	<%
		List<Person> products= new ArrayList<Person>();
		products.add(new Person("GG",101));
		products.add(new Person("FF",102));
		products.add(new Person("HH",103));
		
		request.setAttribute("products", products);
	
		
	%>


	<s:form action="save">
		
		<s:hidden name="userId"></s:hidden>
		
		<s:textfield name="userName" label="UserName"></s:textfield>
		<s:password name="password" label="Password" showPassword="true"></s:password>
		<s:textarea name="desc" label="Desc"></s:textarea>
		<s:checkbox name="married" label="Married"></s:checkbox>
		<s:checkboxlist name="person" label="Persons"
			list="#request.products"
			listKey="id"
			listValue="personName">
		</s:checkboxlist>
		<s:radio name="gender" list="#{'1':'Male','0':'Femal'}" label="Gender"></s:radio>
		<s:select name="person" label="Persons"
			list="#request.products"
			listKey="id"
			listValue="personName"
			headerKey="" headerValue="请选择"
			>
			<s:optgroup label="其他" list="#{104:'II',105:'JJ'}"></s:optgroup>
		</s:select>
		
		<s:submit></s:submit>
		
	</s:form>
</body>
</html>