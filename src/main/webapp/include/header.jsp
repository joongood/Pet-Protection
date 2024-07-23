<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/dbconnection.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Web</title>
	<link rel="stylesheet" href="/css/style.css">
	<style>
		.search_box{
			width:100%;
			height:100%;
			border:2px solid #00DC64;
			border-radius:15px;
		}
		.search_logo{
			width: 550px;
			height: 65px;
			cursor:pointer;
			box-sizing: border-box;
			font-size:20px;
			font-weight:bolder;
			border:0px;
			border-radius:15px;
			outline: none;
		}
		.search_btn{
			width: 40px;
			height: 45px;
			cursor:pointer;
			background-color:white;
			border:0px;
		}
		.search_img{
			width: 40px;
			height: 45px;
			cursor:pointer;
		}
		.login_box{
			font-family: "Noto Sans KR", sans-serif;
			font-optical-sizing: auto;
  			font-weight: 600;
  			font-style: normal;
		}		
	</style>
</head>
<body>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");
%>
session_id :<%=session_id %><br>
session_level :<%=session_level %><br>
<center>
<table height=50>
	<tr>
		<td></td>
	</tr>
</table>
<script>
function search_ok(){
	if(!keyword.value){
		alert("검색어 입력해주세요");
		return false;
	}
}
</script>
<table width=1000 height=50>
	<tr>
		<td width=200 align=left><a href="/"><img src="/img/mainlogo.png" width=90 height=50 align=center></a></td>
		<td width=600 style="border:1px">
			<form action="/search/list.jsp" onsubmit="return search_ok()" style="width:100%; height:100%;">
			<table class="search_box">
				<tr>
					<td>
					<input type="text" name="keyword" class="search_logo">
					</td>
					<td>
					<button type="submit" class="search_btn">
					<img src="/img/search.png" class="search_img">
					</button>
					</td>
				</tr>
			</table>
			</form>
		</td>
		<td align=right text-align=bottom>
			<%
			if(session_id !=null){//로그인 후			
			%>
			<a href="/member/logout.jsp">[로그아웃]</a>
			<a href="/member/join_up.jsp">[회원수정]</a>
			<%
			}else{//로그인 전
			%>
			<a href="/member/login.jsp" width=70>[로그인]</a>
			<a href="/member/join.jsp" width=70>[회원가입]</a>
			<%
			}
			%>
		</td>
	</tr>
</table>
<table height=50>
	<tr>
		<td></td>
	</tr>
</table>
<table border=0>
	<tr>
		<td><button class="btn" onclick="location.href='/bbs/list.jsp?code=notice'">게시판</button></td>
		<td><button class="btn" onclick="location.href='/bbs2/list.jsp?code=free'">후기</button></td>
		<td><button class="btn" onclick="location.href='/bbs3/list.jsp?code=gallery'">자랑</button></td>
		<td><button class="btn" onclick="location.href='/bbs4/list.jsp?code=qna'">실종/제보</button></td>		
	</tr>
</table>
</center>
