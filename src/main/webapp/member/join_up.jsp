<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
String sql = "select * from member where id = '"+session_id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);


if(rs.next()){	
%>

<table width=100% border-spacing=0>
	<tr>
		<td align=center>
			<table width=800>
					<tr>
						<td width=400>
							<table>
								<tr>
									<td><img src="/img/5.jpg" style="border-radius:10px;width:100%; height:600px;"></td>
								</tr>
							</table>
						</td>
						<td width=400>
							<table style="height:600px;" border=0> 
								<form action="join_update.jsp" method="post" onsubmit="return join()">
								<tr>
									<td align=center vertical-aling=top height=70><h1 style="font-size:32px;"><img src="/img/6.jpg" style="width:30px; height:30px;">회원수정<img src="/img/7.png" style="width:30px; height:30px;"></h1></td>
								</tr>
								<tr>
							        <td>
							            <table border=0; width=100%;">
							               <tr>
							                  <td align=right width=70 style="font-weight:bold; font-size:15px;">아이디 : </td>
							                  <td><input class="joininp" placeholder="아이디를 입력하세요" type="text" name="id" id="id" value="<%=rs.getString("id")%>" readonly></td>
							               </tr>
							               <tr>
							                  <td align=right width=70 style="font-weight:bold; font-size:15px;">비밀번호 : </td>
							                  <td><input class="joininp" placeholder="비밀번호를 입력하세요" type="password" name="pass" id="pass"></td>
							               </tr>
							            </table>
							            <table height=20>
							            	<tr>
							            		<td></td>
							            	</tr>
							            </table>
							            <table border=0; width=100%;>
							               <tr>
							                  <td align=right width=70 style="font-weight:bold; font-size:15px;">이름 : </td>
							                  <td><input class="joininp" placeholder="이름을 입력하세요" type="type" name="name" id="name" value="<%=rs.getString("name")%>"></td>
							               </tr>
							               <tr>
							                  <td align=right width=70 style="font-weight:bold; font-size:15px;">이메일 : </td>
							                  <td><input class="joininp" placeholder="이메일을 입력하세요" type="email" name="email" id="email" value="<%=rs.getString("email")%>"></td>
							               </tr>
							            </table>
							            <table height=20>
							            	<tr>
							            		<td></td>
							            	</tr>
							            </table>
							            <table width=100%>
							               <tr>
							               		<td align=center><button class="btn3">회원수정</button></td>
							               </tr>
							            </table>            
							        </td>
							    </tr>
							    </form>
							</table>
						</td>
					</tr>
			</table>
		</td>
	</tr>
</table>

<script>
function join(){
	if(document.getElementById('pass').value == "" || document.getElementById('pass').value == null){    
        alert("비밀번호를 입력하세요.");
        document.getElementById('pass').focus();
        return false;
    }else if(document.getElementById('name').value == "" || document.getElementById('name').value == null){    
        alert("이름을 입력하세요.");
        document.getElementById('name').focus();
        return false;
    }else if(document.getElementById('email').value == "" || document.getElementById('email').value == null){    
        alert("메일을 입력하세요.");
        document.getElementById('email').focus();
        return false;
    }
}
</script>
<%
}

rs.close();
stmt.close();
conn.close();
%>

<%@ include file="/include/footer.jsp" %>
