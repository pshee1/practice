<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int rs=0;
int custno=Integer.parseInt(request.getParameter("custno"));
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");
 Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
    
    String sql="insert into member_tbl_02 values(?,?,?,?,?,?,?)";
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setInt(1,custno);
    ps.setString(2, custname);
    ps.setString(3, phone);
    ps.setString(4, address);
    ps.setString(5, joindate);
    ps.setString(6, grade);
    ps.setString(7, city);
    
int result=ps.executeUpdate();
ps.close();
conn.close();

if(result>0){
	%>
	<script type="text/javascript">
	alert('g회원등록이 완료되었습니다');
	location.href='index.jsp';
</script>
	<%}else{ %>
	<script type="text/javascript">
	alert('g회원등록을 다시입력해주세요');
	location.href='create.jsp';
</script>
<%} %>
	

	