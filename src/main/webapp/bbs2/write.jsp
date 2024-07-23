<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String code = request.getParameter("code"); //db : table 명
String uid = request.getParameter("uid");
String page_now = request.getParameter("page_now");

String bbs_title = ""; //게시판 이름
if(code.equals("notice")){
	bbs_title = "공지사항";
}else if(code.equals("free")){
	bbs_title = "자유게시판";
}else if(code.equals("gallery")){
	bbs_title = "갤러리게시판";
}else if(code.equals("qna")){
	bbs_title = "Q&A게시판";
}
%>

<style>
.write_inp{
	border:2px solid #BAE7AE;
	background: white;
	border-radius:5px;
}
</style>

<center>
<table width=1000 height=50 border=0>
	<tr>
		<td align=center style="width:500px;font-size:14px;font-weight:bold; background-color:#007A4F; color:#F4F3CC;">[후기]_글쓰기</td>
	</tr>
</table>

<form method="post" action="insert.jsp" ENCTYPE="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<input type="hidden" name="uid" value="<%=uid%>">
<input type="hidden" name="page_now" value="<%=page_now%>">
<table style="width:1000px; height:600px;" border="0" cellpadding="0" cellspacing="0">
	<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
	<tr>
		<td height=26 align=center>옵션</td>
		<td>
			<%if(session_level != null && session_level.equals("10")){ %>
			<input type="radio" name="gongji" value="1">공지			
			<%}	%> 
			<input type="radio" name="gongji" value="2" checked>일반 
			<input type="radio" name="gongji" value="3">비밀 
		</td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
	<tr>
		<td height=26 align=center>제목</td>
		<td><input class="write_inp" name="subject" style="height:20px;width:99%;"></td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
	<tr>
		<td align=center>내용</td>
		<td>
			<textarea class="write_inp" name="comment" style="height:96%;width:99%;font-size:15px;font-weight:bold;"></textarea>
		</td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
	<tr>
		<td align=center height=50>첨부</td>
		<td>
			<input class="write_inp" type="file" name="file1">
		</td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#d1dee2></td></tr>
</table>
<br>
<table width="1000" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><button class="btn2">작성완료</button></td>
	</tr>
</table>
<br>
</form>
</center>

<%@ include file="/include/footer.jsp" %>
