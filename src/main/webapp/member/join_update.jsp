<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8"); //한글 깨짐 방지

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");


//회원수정 처리 부분
String sql = "update member set pass = '"+pass+"' , name = '"+name+"' , email = '"+email+"' where id = '"+id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
	
response.sendRedirect("/");//페이지 이동

%>
