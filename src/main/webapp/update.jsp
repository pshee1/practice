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
<script type="text/javascript">
function valuececk() {
	if(document.getElementById("custno").value==""){
		alert('회원번호가 입력되지 않았습니다.')
		document.getElementById("custno").focus();
		return;
	}
	document.forms[0].requestSubmit();
	alert('회원등록이 완료되었습니다.')
	
}
</script>
</head>
<body>
<h3>홈쇼핑 회원 정보 수정</h3>
<form action="updateproc.jsp" method="post">
<table>
 <% int custno=Integer.parseInt(request.getParameter("custno"));   
 
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

    String sql="select *from member_tbl_02 where custno=?";
    PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, custno);
    ResultSet rs=ps.executeQuery();
    String custname=null;
    String phone=null;
    String address=null;
    String joindate=null;
    String grade=null;
    String city=null;
    if(rs.next()){
    	custno=rs.getInt("custno");
    	custname=rs.getString("custname");
    	phone=rs.getString("phone");
    	address=rs.getString("address");
    	joindate=rs.getString("joindate");
    	grade=rs.getString("grade");
    	city=rs.getString("city");
    }
    rs.close();
    ps.close();
    conn.close();    
    %>
<tr>
<th>회원번호</th>
<td><input type="text" id="custno" name="custno" value=<%=custno %>></td>
</tr>
<tr>
<th>회원성명</th>
<td><input type="text" id="custname" name="custname" value=<%=custname%>></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" id="phone" name="phone" value=<%=phone%>></td>
</tr>
<tr>
<th>회원주소</th>
<td><input type="text" id="address" name="address" value=<%=address%>></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" id="joindate" name="joindate" value=<%=joindate%>></td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td><input type="text" id="grade" name="grade" value=<%=grade%>></td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" id="city" name="city" value=<%=city%>></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="수정" onclick="valuececk()">
<input type="button" value="조회" onclick="location.href='member.jsp'">
</td>
</tr>
</table>
</form>
</body>
</html>