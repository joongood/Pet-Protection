<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date date = new Date();
SimpleDateFormat dateFommat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = dateFommat.format(date);

out.print(today);
%>
</body>
</html>