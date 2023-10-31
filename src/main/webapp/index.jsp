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
<h3>쇼핑몰 회원관리 프로그램</h3>
<pre>
쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다
프로그램 작성 순서
1.회원정보 데이블을 생성한다.
2.매출정보 테이블을 생서안다.
3.회원정보,매출정보 테이블에 제시된 문제지와 참조데이터를 추가 생성한다
4.회우너정보 입력 화면 프로그램을 작성한다.
5.회원정보 조회 프로그램을 작성한다.
6.회원매출정보 조회 프로그램을 작성한다.
</pre>
</section>

<footer> HRDKOREA COMPANY~~~~~</footer>
</body>
</html>