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
font-size: 30px;
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
h3{ text-align: center; font-size: 25px;}
form{margin-top: 20px;}
</style>
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
<section>
<h3>회원매출조회</h3>
<form style="display: flex;  justify-content: center;">
<table border="1" >
<tr>
<th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
</tr>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

String sql="select me.custno,custname,grade,sum(price) from member_tbl_02 me, money_tbl_02 mo group by me.custno,custname,grade";
PreparedStatement ps=conn.prepareStatement(sql);

ResultSet rs=ps.executeQuery();

while(rs.next()){
%>
<tr>
<td><%=rs.getInt("custno")%></a></td>
<td><%=rs.getString("custname")%></td>
<td><%=(rs.getString("grade").charAt(0)=='A')? "VIP" :
	(rs.getString("grade").charAt(0)=='B')? "일반" : "직원"%></td>
<td><%=rs.getString("sum(price)")%></td>
</tr>
<%}
rs.close();
ps.close();
conn.close();

%>

</table>
</form>
</section>
<footer> HRDKOREA COMPANY~~~~~</footer>
</body>
</html>