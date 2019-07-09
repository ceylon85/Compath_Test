<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.mypage.scrapbook.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<% String url = request.getContextPath(); %>
<h1><%= url %></h1><br>


 <form name="bull_entity" method = "POST"  action="<%=url%>/bulletin_update.do">
	private scrapbook_num:	 <input type="text" readonly="readonly" name="scrapbook_num" value="${found.scrapbook_num }" /> <br>
	private String title:	 <input type="text" name="title" value="${found.title }" /><br>
	private Date write_time: <input type="text" readonly="readonly" name="write_time" value="${found.write_time }" /><br>
	private String ID:       <input type="text" name="ID" readonly="readonly" value="${found.ID }" /><br>
	private String write_form:<input type="text" readonly="readonly" name="write_form" value="${found.write_form }" /><br>
	private String contents:<input type="text" name="contents" value="${found.contents }" /><br>
	private String input_URL1:<input type="text" name="input_URL1" value="${found.input_URL1 }" /><br>
	private String input_URL2:<input type="text" name="input_URL2" value="${found.input_URL2 }" /><br>
	private String input_URL3:<input type="text" name="input_URL3" value="${found.input_URL3 }" /><br>
	<input type="submit" value="수정!!" />
</form>

<%-- <form action="/bulletinTest/bulletin_update.do"  method="POST">
	
	scrapbook_num <form:input path="scrapbook_num"/><br>
	title <form:input path="title"/><br>
	write_time <form:input path="write_time"/><br>
	ID <form:input path="ID"/><br>
	write_form <form:input path="write_form"/><br>
	contents <form:input path="contents"/><br>
	input_URL1 <form:input path="input_URL1"/><br>
	input_URL2 <form:input path="input_URL2"/><br>
	input_URL3 <form:input path="input_URL3"/><br>
	<input type="submit" value="수정!!"/>
</form> --%>
