<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/include/header.jsp" %>

<script>
$(document).ready(function() {
		var totalNum = $(".vis > div").length
		var currentNum = 1;
		$(".page_n > span:first").text(currentNum);
		$(".page_n > span:last").text(totalNum);
		$(".next_b").click(function() {
			currentNum++;
			if (currentNum > totalNum) {
				currentNum = 1;
			}
			$(".vis div:first").insertAfter(".vis div:last");
			$(".page_n > span:first").text(currentNum);
		});
		$(".prev_b").click(function() {
			currentNum--;
			if (currentNum < 1) {
				currentNum = totalNum;
			}
			$(".vis div:last").insertBefore(".vis div:first");
			$(".page_n > span:first").text(currentNum);
		});
	});
	
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

//현재 시간을 업데이트하는 함수
function updateTime() {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    
    // 시, 분, 초를 2자리로 포맷팅
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    
    // 현재 시간을 문자열로 조합
    var currentTimeString = hours + ":" + minutes + ":" + seconds;
    
    // 테이블 셀에 현재 시간 업데이트
    document.getElementById("current-time").innerText = currentTimeString;
}

// 페이지 로드시 현재 시간 업데이트 시작
window.onload = function() {
    updateTime();
    // 1초마다 현재 시간 업데이트
    setInterval(updateTime, 1000);
};
</script>
<%
String sql = "select * from member where id = '"+session_id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>
<table width=100% border=0>
	<tr>
		<td align=center>
			<table border=0 width=1000; height=550px style="border-spacing:0px; align:center;">
				<tr>
					<td width=350px align = center>
						<table width=100%>
							<tr>
								<td width= 70></td>
								<td width= 250 align=center style="font-size:18px; font-weight:bolder">보호소</td>
								<td width= 30><a href="/more/more.jsp">more+</a></td>
							</tr>
						</table>									
						<table border=1 width=100% style="border-radius:5px">
							<tr>
								<td style="border:none">서울</td>
							</tr>
							<tr>
								<td style="border:none">한국 동물구조 관리협회 tel.031-867-9119</td>
							</tr>								
						</table>
						<table border=1 width=100% style="border-radius:5px">
							<tr>
								<td style="border:none">부산</td>
							</tr>
							<tr>
								<td style="border:none">부산 동물 보호센터 tel.051-832-7119</td>
							</tr>								
						</table>
						<table border=1 width=100% style="border-radius:5px">
							<tr>
								<td style="border:none">대구</td>
							</tr>
							<tr>
								<td style="border:none">대구 유기동물 보호센터 tel.053-964-6258</td>
							</tr>								
						</table>
						<table border=1 width=100% style="border-radius:5px">
							<tr>
								<td style="border:none">인천</td>
							</tr>
							<tr>
								<td style="border:none">인천 수의사회 유기동물 tel.032-515-7567</td>
							</tr>								
						</table>
						<table border=1 width=100% style="border-radius:5px">
							<tr>
								<td style="border:none">광주</td>
							</tr>
							<tr>
								<td style="border:none">광주 동물보호소 tel.062-571-2808</td>
							</tr>								
						</table>
						<table border=1 style="border-radius:5px" width=100%>
							<tr>
								<td style="border:none">제주</td>
							</tr>
							<tr>
								<td style="border:none">제주 동물 보호센터 tel.064-710-4065</td>
							</tr>								
						</table>
						<table border=1 style="border-radius:5px" width=100%>
							<tr>
								<td style="border:none">대전</td>
							</tr>
							<tr>
								<td style="border:none">대전 동물 보호센터 tel.042-825-1118</td>
							</tr>								
						</table>
						<table border=1 style="border-radius:5px" width=100%>
							<tr>
								<td style="border:none">울산</td>
							</tr>
							<tr>
								<td style="border:none">울산 유기동물 보호센터 tel.052-238-6113</td>
							</tr>								
						</table>
					</td>
					<td width=350px align=center>
						<div id="wrap">
							<div class="page">
								<span class="page_n">
									<span></span> / <span></span>
								</span>
								<button class="prev_b">&lt; 이전</button>
								<button class="next_b">&gt; 다음</button>
							</div>
							<div class="vis">
								<div><a href="#"><img src="/img/1.jpg" width=100% height=100%></a></div>
								<div><a href="#"><img src="/img/2.jpg" width=100% height=100%></a></div>
								<div><a href="#"><img src="/img/3.jpg" width=100% height=100%></a></div>
								<div><a href="#"><img src="/img/4.jpg" width=100% height=100%></a></div>
							</div>
						</div>
					</td>
					<td width=350px>
					<table border=0 width=100%  class="login_box">
			        	<tr>
			            	<td>
			                	<%
								if(session_id !=null){//로그인 후
								%>			                            		
			                    <table width=100% border=1 style="border-radius:10px;">
			                    	<tr>
			                        	<td align=center style="font-size:20px; border:0px; font-weight:bolder;">[반갑습니다.<%=session_id %>님]</td>
			                        </tr>
			                        <form action="/member/join_up.jsp" method="post">
			                        <tr>			                                        	
			                            <td align=center style="border:0px"><a href="/member/join_up.jsp"><button class="btn2">회원수정</button></a></td>
			                        </tr>
			                        </form>
			                        <form action="/member/logout.jsp" method="post">	                                        			                                        
			                        <tr>			                                        	
			                            <td align=center style="border:0px"><button class="btn2">로그아웃</button></td>
			                        </tr>
			                        </form>
			                    </table>			                                	
			                    	<%
									}else{//로그인 전
									%>			                            		
			                    <form action="/member/login_update.jsp" method="post" onsubmit="return login()">
			                    <table width=100% border=0>			                                		
			                    	<tr>
			                        	<td colspan=2 align=right><a href="/member/join.jsp" width=70>[회원가입]</a></td>                                                  
			                        </tr>
			                        <tr>
			                        	<td width=20px align=center style="font-size:20px">ID</td>
			                            <td><input placeholder="아이디" style="width: 260px; height:30px; font-weight:bolder; background-color:#F8F9FA; border-radius:5px;" name="id" id="id" type=text></td>
			                        </tr>
			                        <tr>
			                            <td width=20px align=center style="font-size:20px">PASS</td>			                                            
			                            <td><input placeholder="비밀번호" style="width: 260px; height:30px; font-weight:bolder; background-color:#F8F9FA; border-radius:5px;" name="pass" id="pass" type=password></td>
			                        </tr>
			                        <tr>			                                        	
			                            <td colspan=2 align=center><button class="btn2">로그인</button></td>
			                        </tr>
			                     </table>
			                     </form>
			                     	<%
									}
									%>
			         	 		</td>
			           	 	</tr>	
			           	 	<tr>
			           	 		<td align=center>
					           	 	<table border=1 width=150px style="border-radius:5px;">
						           	 	<tr>
						           	 		<td style="border-top:none; border-bottom:none; border-left:none; border-right:none;" align=center>현재시간 :</td>	           	 		
						           	 		<td style="border-top:none; border-bottom:none; border-left:none; border-right:none;" id="current-time" align=center></td>
						           	 	</tr>
					           	 	</table>
			           	 		</td>
			           	 	</tr>
			      		</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%

rs.close();
stmt.close();
conn.close();
%>
<%@ include file="/include/footer.jsp" %>