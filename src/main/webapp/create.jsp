<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{padding: 0;margin: 0}
header{
width: 100%;
height: 100px;
line-height: 100px;
color: white;
background-color: blue;
text-align: center;
}
nav{
width: 100%;
height: 80px;
line-height: 80px;

background-color: purple;

}
li{
display:inline-block;
margin-left: 25px;
color: white;
}
section{
width: 100%;
height: 500px;

color: white;
background-color: gray;
}
footer{
width: 100%;
height: 100px;
line-height: 100px;
color: white;
background-color: blue;
text-align: center;
}
</style>
<script type="text/javascript">
function checkvalue() {
	if(document.getElementById("custname").value==""){
		alert('회원이름이 작성되지 않았습니다.')
		document.getElementById("custname").focus();
		return;
	}
	if(document.getElementById("phone").value==""){
		alert('회원전화가 작성되지 않았습니다.')
		document.getElementById("phone").focus();
		return;
	}
	if(document.getElementById("address").value==""){
		alert('회원주소가 작성되지 않았습니다.')
		document.getElementById("address").focus();
		return;
	}
	if(document.getElementById("joindate").value==""){
		alert('가입일자가 작성되지 않았습니다.')
		document.getElementById("joindate").focus();
		return;
	}
	if(document.getElementById("grade").value==""){
		alert('고객등급이 작성되지 않았습니다.')
		document.getElementById("grade").focus();
		return;
	}
	if(document.getElementById("city").value==""){
		alert('도시코드 작성되지 않았습니다.');
		document.getElementById("city").focus();
		return;
	}
	document.forms[0].requestSubmit();
	
	
}





</script>
</head>
<body>
<header>쇼핑몰 회원관리ver1.0</header>
<nav>
<ul>
<li><a href="create.jsp">회원등록</a></li>
<li><a href="member.jsp">회원목록/수정</a></li>
<li><a href="sales.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul>
</nav>
</head>
<section>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

String sql="select max(custno) from member_tbl_02";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
int custno=0;
if(rs.next()){
	custno=rs.getInt("max(custno)");
	
}


%>
<form action="createproc.jsp" method="post">
<table border="1">
<tr>
<th>회원번호(자동발생)</th>
<td><input type="text" name="custno" id="custno" value="<%=custno+1%>"></td>
</tr>

<tr>
<th>회원성명</th>
<td><input type="text" name="custname" id="custname"></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" name="phone" id="phone" ></td>
</tr>
<tr>
<th>회원주소</th>
<td><input type="text" name="address" id="address" ></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" name="joindate" id="joindate"></td>
</tr>
<tr>
<th>고객등급[A:vip,B:일반,C:직원]</th>
<td><input type="text" name="grade" id="grade"></td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" name="city" id="city"></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="checkvalue()">
<input type="button" value="조회" onclick="location.href='member.jsp'">
</td>
</tr>
</table>
</form>
</section>
<footer> HRDKOREA COMPANY~~~~~</footer>
</body>
</html>