<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>travelBook.jsp</title>
	<style>
		header{background:darkblue; color:white; text-align: center;}
		nav	  {background:lightblue;}
		footer{background:blue; color:white; text-align: center;}

	</style>
	
	<script>
	function validate() {
		//유효성 검사
		// /from/02_form.jsp 참조
		
		//1)예약번호 글자 갯구가 8글자 인지 확인
		let rno=document.getElementById("rno").value;
		rno=rno.trim();
		if(rno.length!=8){
			alert("예약번호 8글자 입력해 주세요~");
			document.getElementById("rno").focus();
			return false;
		}//if end
		
		//2)상품코드를 선택했는지 확인
		let tcode=document.getElementById("tcode").value;
		tcode=tcode.trim();
		if(tcode.length==0){
			alert("상품코드를 선택해주세요~");
			
			return false;
		}//if end
		
		//3)주민번호가 각각 6글자, 7글자, 숫자형으로 입력되었는지
		let rjumin1=document.getElementById("rjumin1").value;
		rjumin1=rjumin1.trim();
		if(isNAN(rjumin1)|| rjumin1.length!=6){
			alert("주민번호 숫자 6글자 입력해 주세요~");
			document.getElementById("rjumin1").focus();
			return false;
		}//if end
		
		let rjumin2=document.getElementById("rjumin2").value;
		rjumin2=rjumin2.trim();
		if(isNAN(rjumin2)|| rjumin2.length!=7){
			alert("주민번호 숫자 7글자 입력해 주세요~");
			document.getElementById("rjumin2").focus();
			return false;
		}//if end
	}//validate()end
	</script>
</head>
<body>

	<header>여행예약 프로그램 ver2018-12</header>
	
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	
	<section>
		<!-- 본문시작 -->
			<h3>예약등록</h3>
			<form name="" id="" method="post" action="travelProc.jsp" onsubmit="return validate()">
				<table border="1">
			    <tr>
			           <th>예약번호</th>
			           <td>
			               <input type="text" name="rno" id="rno" size="8" maxlength="8" required>
			           </td>
			    </tr>
			    <tr>
			           <th>상품코드</th>
			           <td>
			           	   <select name="tcode" id="tcode">
			           	       <option value="">상품선택</option>
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
					sql.append(" SELECT tcode ");
					sql.append(" , '[' || tcode || ']' || tarea ");
					sql.append(" || substr(tdate, 1, 4) || '-' || substr(tdate, 5, 2) || '-' || substr(tdate, 7, 2)");
					sql.append("  || '출발' as tname ");
					sql.append(" from tbl_tourcode_02 ");
					sql.append(" order by tcode ");
					
					pstmt=con.prepareStatement(sql.toString());
					rs=pstmt.executeQuery();
					if(rs.next()){
						do{
							out.println("<option value='" + rs.getString("tcode") + "'>");
							out.println(rs.getString("tname"));
							out.println("</option>");
						}while(rs.next());
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
		 
			           	   </select>
			           </td>
			    </tr>
				<tr>
			           <th>주민번호</th>
			           <td>
			               <input type="text" name="rjumin1" id="rjumin1" size="6" maxlength="6" required>
			               -
			               <input type="text" name="rjumin2" id="rjumin2" size="7" maxlength="7" required>
			           </td>
			    </tr>
			    <tr>
			           <th>예약자성명</th>
			           <td>
			               <input type="text" name="rname" id="rname" size="20" maxlength="20" required>
			           </td>
			    </tr>
				<tr>
			           <th>예약자전화</th>
			           <td>
			               <input type="text" name="rphone1" id="rphone1" size="3" maxlength="3" required>
			               <input type="text" name="rphone2" id="rphone2" size="4" maxlength="4" required>
			               <input type="text" name="rphone3" id="rphone3" size="4" maxlength="4" required>
			           </td>
			    </tr>
			    <tr>
				           <th>고객이메일</th>
			           <td>
			               <input type="text" name="remail" id="remail" size="30" maxlength="30" required>
			           </td>
			    </tr>  
			    <tr>
			           <th>결제상태</th>
			           <td>
			               <input type="radio" name="rstat" id="rstat" value="1" checked>미납
			               <input type="radio" name="rstat" id="rstat" value="2">완납
			           </td>
			    </tr>
				<tr>
			           <td colspan="2">
			               <input type="submit" value="예약">
			               <input type="reset"  value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!!');">
			           </td>
			   </tr>
			   </table>			
			
	
			</form>
	
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