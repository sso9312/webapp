<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	● 공통페이지 추가
	<%@ include file=""%>				JSP 디렉티브 (JSP코드가 많을 경우 추천)
	<jsp:include page=""></jsp:include>	액션태그

 --%>
    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home.jsp</title>
	<style>
		header{background:darkblue; color:white; text-align: center;}
		nav	  {background:lightblue;}
		footer{background:blue; color:white; text-align: center;}

	</style>
</head>
<body>

	<header>여행예약 프로그램 ver2018-12</header>
	
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	
	<section>
		<!-- 본문시작 -->
			<img src="../images/smile.png">
		<!-- 본문끝 -->
	</section>
	
	<footer>
		<p>
			HRDKOREA Copyright&copy;2018 All rights reserved.
			Human Resources Development Service of Korea
		</p>
	</footer>
	
	
</body>
</html>