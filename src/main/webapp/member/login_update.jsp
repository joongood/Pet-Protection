<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8"); //한글 깨짐 방지

String id = request.getParameter("id");
String pass = request.getParameter("pass");

String sql="select count(*) from member where id='"+id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

int total = 0;
while(rs.next()){
	total = rs.getInt(1);
}
if(total == 1){ //존재하는 아이디
	String sql2="select count(*) from member where id='"+id+"'and pass='"+pass+"'";

	Connection conn2 = DriverManager.getConnection(url, user, password);
	Statement stmt2 = conn2.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sql2);

	int total2 = 0;
	if(rs2.next()){
		total2 = rs2.getInt(1);
	}
	
	if(total2 == 1){
		//세션 처리 - 로그인 완료 처리
		String sql3="select * from member where id='"+id+"'and pass='"+pass+"'";
%>
	<script>
		location.href="/";
		alert("로그인에 성공하였습니다.");
	</script>
<%
		Connection conn3 = DriverManager.getConnection(url, user, password);
		Statement stmt3 = conn3.createStatement();
		ResultSet rs3 = stmt2.executeQuery(sql3);

		if(rs3.next()){
			session.setAttribute("id", rs3.getString("id"));
			session.setAttribute("name", rs3.getString("name"));
			session.setAttribute("level", rs3.getString("level"));
		}
	}else{
%>
	<script>
		alert("비밀번호가 틀립니다.");
		history.back();
	</script>
<%		
	}
}else{
%>
	<script>
		alert("아이디가 존재하지 않습니다.");
		history.back();
	</script>
<%		
}
%>