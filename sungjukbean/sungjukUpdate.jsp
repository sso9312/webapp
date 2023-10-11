<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h3>* 성적 수 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%

	int sno=Integer.parseInt(request.getParameter("sno"));
	dto = dao.read(sno);//수정하고자 하는 행을 DB에서 가져와서 dto에 담기
	if(dto==null){
		out.println("해당 글 없음");
	}else{
%>		
	<form name="sungjukfrm" id="sungjukfrm" method="get" action="sungjukUpdateProc.jsp">
	<input type="hidden" name="sno" value="<%=sno%>" >
				<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="uname" id="uname" value="<%=dto.getUname() %>" maxlength="50" required autofocus></td>
				</tr>	
				<tr>
					<th>국어</th>
					<td><input type="number" name="kor" id="kor" value="<%=dto.getKor() %>" size="5" min="0" max="100" placeholder="국어점수"></td>
				</tr>	
				<tr>
					<th>영어</th>
					<td><input type="number" name="eng" id="eng" value="<%=dto.getEng() %>" size="5" min="0" max="100" placeholder="국어점수"></td>
				</tr>	
				<tr>
					<th>수학</th>
					<td><input type="number" name="mat" id="mat" value="<%=dto.getMat() %>" size="5" min="0" max="100" placeholder="국어점수"></td>
				<tr>
					<th>주소</th>
					<td>
						<% String addr = dto.getAddr(); %>
						<select name="addr" id="addr">
							<option value="Seoul" <%if(addr.equals("Seoul")) {out.print("selected");}%>>서울</option>
							<option value="Jeju"  <%if(addr.equals("Jeju")) {out.print("selected");}%>>제주</option>
							<option value="Suwon" <%if(addr.equals("Suwon")) {out.print("selected");}%>>수원</option>
							<option value="Busan" <%if(addr.equals("Busan")) {out.print("selected");}%>>부산</option>
						</select>		
					</td>
				</tr>
				<tr>
				    <td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="reset"  value="취소">
					</td>
				</tr>
			</table>
	
	</form>

<% 
	}//if end

	
%>		
</body>
</html>


