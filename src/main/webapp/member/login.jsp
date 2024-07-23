<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/style.css">

<table width=100% height=100% border=0 style="border-spacing:0px">
	<tr>
		<td height=100></td>
	</tr>
	<tr>
		<td align=center><a href="/"><img src="/img/return.webp" width=300 height=70></a></td>
	</tr>
	<tr>
		<td align=center>
			<form action="login_update.jsp" method="post" onsubmit="return login()">
				<table border=1 style="width:500px; height:600px;">
					<tr>
						<td align=center height=70><h1 style="font-size:32px;"><img src="/img/6.jpg" style="width:30px; height:30px;">로그인<img src="/img/7.png" style="width:30px; height:30px;"></h1></td>
					</tr>
					<tr>
						<td>
							<table border=0; width=100%;">
								<tr>
							    	<td align=right width=100 style="font-weight:bold; font-size:15px;">아이디 : </td>
							        <td><input class="joininp" placeholder="아이디를 입력하세요" type="text" name="id" id="id"></td>
							    </tr>
							    <tr>
							        <td align=right width=100 style="font-weight:bold; font-size:15px;">비밀번호 : </td>
							        <td><input class="joininp" placeholder="비밀번호를 입력하세요" type="password" name="pass" id="pass"></td>
							    </tr>
							 </table>
							 <table height=20 align=right>
							    <tr>
							        <td><a href="/member/join.jsp">[회원가입]</a></td>
							        <td width=85></td>
							    </tr>
							 </table>
							 <table height=30>
							 	<tr>
							 		<td></td>
							 	</tr>
							 </table>
							 <table width=100%>
							    <tr>
							        <td align=center><button class="btn3" style="font-weight:bolder;font-size:22px;">로그인</button></td>
							    </tr>
							 </table>            
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td height=100></td>
	</tr>
</table>
<script>
function login(){
    if(document.getElementById('id').value == "" || document.getElementById('id').value == null){    
        alert("아이디를 입력하세요.");
        document.getElementById('id').focus();
        return false;        
    } else if(document.getElementById('pass').value == "" || document.getElementById('pass').value == null){    
        alert("비밀번호를 입력하세요.");
        document.getElementById('pass').focus();
        return false;
    }
}
</script>