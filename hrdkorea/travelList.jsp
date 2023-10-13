<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>travelList.jsp</title>
	<style>
		header{background:darkblue; color:white; text-align: center;}
		nav	  {background:lightblue;}
		footer{background:blue; color:white; text-align: center;}

	</style>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>

	<h3>*	예약 목록	*</h3>
	<p><a href="">[예약내역조회]</a></p>
	
	
	<table  class="table table-condensed, table-hover">
	<tr class="warning">
		<th>예약번호</th>
		<th>주민번호</th>
		<th>성명</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>여행상품</th>
		<th>상태</th>
		<th>금액</th>
	</tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url		="jdbc:oracle:thin:@localhost:1521:xe";
		String user		="system";
		String password	="1234";
		String driver	="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		con= DriverManager.getConnection(url, user, password);
	
		
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT tbl_reserve_01.tcode, rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tarea, tdate, ttime, tday, thotel, tmoney, tair ");
		sql.append(" FROM tbl_reserve_01 inner join tbl_tourcode_02");
		sql.append(" ON tbl_reserve_01.tcode = tbl_tourcode_02.tcode ");
		sql.append(" ORDER BY tbl_reserve_01.rno ");
		

		
		
		
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery();
		if(rs.next()){
			do{
%>
				<tr>
					
					<td><%=rs.getString("rno")%></td>	
					<td><%=rs.getString("tcode")%></td>	
				
	
				</tr>

<% 
			}while(rs.next());
		}else{
			out.println("<tr>");
			out.println("<td colspan='5'>글없음!!</td>");		
			out.println("</tr>");
		}//if end
		
	}catch (Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally {//자원반납(순서주의)
		try{
			if(rs!=null) {rs.close();}
		}catch (Exception e){}
		try{
			if(pstmt!=null) {pstmt.close();}
		}catch (Exception e){}
		try{
			if(con!=null) {con.close();}
		}catch (Exception e){}
	}//end


%>
	</table>
	


</body>
</html>