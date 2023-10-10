<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukIns.jsp</title>
</head>
<body>
	<h3>*성적 결과 페이지*</h3>
	<p><a href="sungjukList.jsp">[성적목록]</a></p>
	
<form action="sungjukIns.jsp">
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="uname" id="uname" maxlength="50" required autofocus></td>
		</tr>	
		<tr>
			<th>국어</th>
			<td><input type="number" name="kor" id="kor" size="5" min="0" max="100" placeholder="국어점수"></td>
		</tr>	
		<tr>
			<th>영어</th>
			<td><input type="number" name="eng" id="eng" size="5" min="0" max="100" placeholder="국어점수"></td>
		</tr>	
		<tr>
			<th>수학</th>
			<td><input type="number" name="mat" id="mat" size="5" min="0" max="100" placeholder="국어점수"></td>
	<tr>
			<th>주소</th>
			<td>
				<select name="addr" id="addr">
					<option value="Seoul">서울</option>
					<option value="Jeju">제주</option>
					<option value="Suwon">수원</option>
					<option value="Busan">부산</option>
				</select>		
			</td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
				<input type="submit" value="전송">
				<input type="reset"  value="취소">
			</td>
		</tr>
		</table>
</form>	
-----------------------------------------------------

</body>
</html>