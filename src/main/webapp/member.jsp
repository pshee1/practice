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
<h3>회원목록조회/수정</h3>
<table border="2">
<tr>
<th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
</tr>
<% 
Class.forName("oracle.jdbc.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

String sql="select *from member_tbl_02";
PreparedStatement ps=conn.prepareStatement(sql);

ResultSet rs=ps.executeQuery();

while(rs.next()){
%>
<tr>
<td><a href="update.jsp?custno=<%=rs.getInt("custno")%>"><%=rs.getInt("custno")%></a></td>
<td><%=rs.getString("custname")%></td>
<td><%=rs.getString("phone")%></td>
<td><%=rs.getString("address")%></td>
<td><%=rs.getString("joindate")%></td>
<td><%=(rs.getString("grade").charAt(0)=='A')? "VIP" :
	(rs.getString("grade").charAt(0)=='B')? "일반" : "직원"%></td>
<td><%=rs.getString("city")%></td>
</tr>
<%}
rs.close();
ps.close();
conn.close();
%>
</table>
</section>
<footer> HRDKOREA COMPANY~~~~~</footer>
</body>
</html>