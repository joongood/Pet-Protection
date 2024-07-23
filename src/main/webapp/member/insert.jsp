<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8"); //한글 깨짐 방지

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");

//아이디 중복 확인
String s = "select count(*) from member where id = '"+id+"'";
Connection c = DriverManager.getConnection(url, user, password);
Statement st = c.createStatement();
ResultSet rs = st.executeQuery(s);

int num = 0;
if(rs.next()){
	num = rs.getInt(1);
}

rs.close();
st.close();
c.close();

//가입 날짜
Date date = new Date();
SimpleDateFormat dateFommat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = dateFommat.format(date);

if(num == 1){//존재하는 아이디가 있다.
%>
	<script>
		alert("아이디가 존재합니다.\n 다른 아이디를 이용하세요.");
		history.back();
	</script>
<%	
}else{
	//회원가입 처리 부분
	String sql = "insert into member values ('"+id+"','"+pass+"','"+name+"','"+email+"','1')";

	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();	
%>
	<script>
	location.href = "/";
	alert("회원가입을 완료하였습니다.\n다시 로그인 해주세요.");
	</script>
<%
}
%>
