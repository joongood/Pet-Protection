<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String code = request.getParameter("code"); //db : table 명
String uid = request.getParameter("uid");
String field = request.getParameter("field");
String search = request.getParameter("search");
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
		#view_comment{
			width: 99%;
			height: 48px;
			font-size: 13px;
			border: 1px solid #DBF1D6;
			background: #CCF1C9;
			border-radius: 10px;
		}		
		.comment_btn{
			height:28px;
			background-color:#BBE8AD;
			border:1px solid #75773C;
			border-radius:5px;
			cursor:pointer;
			color:#75773C;
		}	
		.comment_inp{
			height:28px;
			background-color:#BBE8AD;
			border:1px solid #75773C;
			border-radius:5px;
			cursor:pointer;
			color:#75773C;
		}	
</style>

<center>
<table width=1000 height=50 border=0>
	<tr>
		<td align=center style="color:#F4F3CC;font-size:14px;font-weight:bold;background-color:#007A4F;border-radius:5px;">실종/제보_상세보기</td>
	</tr>
</table>

<%
String sql = "select * from "+code+" where uid="+uid;

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String id = "";//작성자

if(rs.next()){	
	String g = rs.getString("gongji");
	String g_h = "";
	if(g.equals("1")){
		g_h = "공지글";
	}else if(g.equals("2")){
		g_h = "일반글";
	}else{
		g_h = "비밀글";
	}	
	//commnet 개행처리
	String comment = rs.getString("comment");
	pageContext.setAttribute("cmt", comment);
	pageContext.setAttribute("LF", "\n");
	String file1 = rs.getString("file1"); //첨부파일
	
	id = rs.getString("id");
	
	//비밀글일때
	if(g.equals("3")){
		if(session_level != null && ( session_level.equals("10") || session_id.equals(id) )){
			
		}else{
%>
		<script>
			alert('비밀글입니다. 확인 하실 수 없습니다.');
			history.back();
		</script>

<%			
		}
	}
%>
<table width="1000" border="0" cellpadding="0" cellspacing="0">
	<tr><td colspan=3 height=1 width=100% bgcolor="#d1dee2"></td></tr>
	<tr>
		<td width=50 height=26>옵션</td>
		<td width=650><%=g_h %></td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor="#d1dee2"></td></tr>
	<tr>
		<td height=26>제목</td>
		<td><%=rs.getString("subject") %></td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor="#d1dee2"></td></tr>
	<tr>
		<td>내용</td>
		<td>
			${fn:replace(cmt, LF, '<br>')}<br>
			<%if(!file1.equals("")){ //첨부파일 존재 %>
			<img src="/upload4/<%=file1%>">
			<%} %>
		</td>
	</tr>
	<%if(!file1.equals("")){ //첨부파일 존재 %>
	<tr height=26>
		<td colspan=3>● 첨부 : <a href="/upload4/<%=file1 %>" download><%=file1 %></a></td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor="#d1dee2"></td></tr>
	<%} %>
	<tr><td colspan=3 height=1 width=100% bgcolor="#d1dee2"></td></tr>
</table>
<br>
<%
}
rs.close();
stmt.close();
con.close();
%>
<!-- 한줄 댓글 목록 -->
<%
//댓글 목록
String sql_comment="select * from comment where tb_table='"+code+"' and tb_uid="+uid;

Connection conn_comment=DriverManager.getConnection(url, user, password);
Statement stmt_comment=conn_comment.createStatement();
ResultSet rs_comment=stmt_comment.executeQuery(sql_comment);
%>
<table width="1000" border="0" cellpadding="0" cellspacing="0">
	<%
	while(rs_comment.next()){
		String mem_id = rs_comment.getString("tb_id");
		int mem_uid = rs_comment.getInt("uid");
	%>
	<tr>
		<td><%=rs_comment.getString("tb_id") %></td>
		<td>
			<%=rs_comment.getString("tb_comment") %>
			<%
			if(session_level != null && (session_level.equals("10") || mem_id.equals(session_id))){
			%>
			<img src="img/comment_del.gif" onclick="comment_delete(<%=mem_uid%>)">
			<%
			}
			%>
		</td>
		<td><%=rs_comment.getString("tb_date") %></td>		
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#97b1ec></td></tr>
	<%
	}
	%>
</table>

<form action="comment_insert.jsp" method="post" onsubmit="return send()">
<input type="hidden" name="code" value="<%=code %>">
<input type="hidden" name="uid" value="<%=uid %>">
<input type="hidden" name="page_now" value="<%=page_now %>">
<input type="hidden" name="field" value="">
<input type="hidden" name="search" value="">

<table width="1000" border="0" cellpadding="0" cellspacing="0">
	<tr height=50>
		<td width=50 align=left>댓글 :</td>
		<td width=890 border-radius=5px><input id="view_comment" name="view_comment"></td>
		<td width=60 align=center>
			<%if(session_id != null){ %>
			<button class="comment_btn">댓글등록</button>
			<%}else{ %>
			<input class="comment_inp" type="button" onclick="javascript:alert('로그인 후 사용 가능합니다..')" value="댓글등록">
			<%} %>
		</td>
	</tr>
	<tr><td colspan=3 height=1 width=100% bgcolor=#97b1ec></td></tr>
</table>
</form>

<table width="1000" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td><a href="list.jsp?code=<%=code%>&field=<%=field%>&search=<%=search%>&page_now=<%=page_now%>">[목록]</a></td>
		<td align=right>
			<a href="reply.jsp?code=<%=code%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>&page_now=<%=page_now%>">[답변]</a>
			<%if(session_level != null && ( session_level.equals("10") || session_id.equals(id) )){ %>
			<a href="modify.jsp?code=<%=code%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>&page_now=<%=page_now%>">[수정]</a>
			<a onclick="delete_go()">[삭제]</a>
			<%}else {%>
			<span onclick="alert('작성자만 수정하실 수 있습니다.')">[수정]</span> 
			<span onclick="alert('작성자만 삭제하실 수 있습니다.')">[삭제]</span>
			<%} %>
		</td>
	</tr>
</table>
<br>
</center>

<script>
	function send(){
		member_id = "<%=session_id%>";
		if(member_id == "null"){
			alert("로그인을 한 후 작성하실 수 있습니다.");
			return false;
		}
		if(!view_comment.value){
			alert("댓글 내용을 입력하세요.");
			view_comment.focus();
			return false;
		}
	}
	
	function delete_go(){
		result = confirm("삭제하시겠습니까?");
		if(result == true){
			location.href = "delete.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>";
		}		
	}
	
	function comment_delete(num){
		result = confirm("댓글을 삭제하시겠습니까?");
		if(result == true){
			location.href = "comment_delete.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>&mem_uid="+num;
		}		
	}
</script>
<%@ include file="/include/footer.jsp" %>