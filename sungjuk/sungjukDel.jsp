<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukDel.jsp</title>
</head>
<body>

	<h3>* 성적 삭제 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	//예)sungjukRead.jsp?sno=21
	//out.print(request.getParameter("sno"));
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	
	try {
		String url		="jdbc:oracle:thin:@localhost:1521:xe";
		String user		="system";
		String password	="1234";
		String driver	="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		con= DriverManager.getConnection(url, user, password);
		
		
		StringBuilder sql=new StringBuilder();
		sql.append(" DELETE FROM sungjuk");
		sql.append(" WHERE sno=? ");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>성적 삭제 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("	alert('성적이 삭제되었습니다~');");		
			out.println("	location.href='sungjukList.jsp';");//목록페이지 이동
			out.println("</script>");
		}//if end

		
		
	}catch (Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally {//자원반납(순서주의)
		try{
			if(pstmt!=null) {pstmt.close();}
		}catch (Exception e){}
		try{
			if(con!=null) {con.close();}
		}catch (Exception e){}
	}//end
%>

</body>
</html>