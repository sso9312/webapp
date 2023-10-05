<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02_form.jsp</title>
	<script>
		function validate() {
			//alert();
			//이름 5~20글자 이내에서 입력해야만 서버로 전송 (02_ok.jsp)
			//jQuery : $(#uname").val()
			let uname = document.getElementById("uname").value;
			uname = uname.trim();
			if(uname.length<5 || uname.length>20){
				alert("이름 5~20글자 이내에서 입력해 주세요");
				return false;
			}//if end
			
			return true; //onsubmit 이벤트에서 서버로 전송
			
		}//validate() end
	</script>
</head>
<body>

	<h3>*	성적 입력	*</h3>

	<form name="sungjukfrm" id="sungjukfrm" action="02_ok.jsp" method="post" onsubmit="return validate()">
		이름 : <input type="text" name="uname" id="uname" maxlength="20" placeholder="이름" required>
        <hr>
        국어 : <input type="number" name="kor" id="kor" min="0" max="100" size="5">
        <hr>
        영어 : <input type="number" name="eng" id="eng" min="0" max="100" size="5">
        <hr>
        수학 : <input type="number" name="mat" id="mat" min="0" max="100" size="5">
        <hr>
        <input type="submit"  value="전송">
        <input type="reset"   value="취소">
	</form>

	<!-- 
		●[<form> 관련 다양한 속성들]
		사용자가 입력한 정보를 서버로 전송하기 위한 방식
		name 	 : 폼이름, 서버에서 식별하기 위한 이름
		id		 : 폼아이디, Frontend단에서 식별자로 주로 사용
		action	 : 사용자가 요청한 정보를 서버가 받아서 처리할 결과 페이지
		method	 : 폼 전송방식. get | post 방식. 생략시 기본은 get방식
		enctype	 : 폼에서 파일을 첨부해서 서버로 전송하고자 할때 "multipart/form-data" 추가
		
		●[form 전송방식]
		
		1) method=get방식
			- 생략시 기본값
			- 사용자가 입력 요청한 정보가 URL 그대로 노출
			- 한글 안깨짐
			- ok.jsp?서버로전송되는값들
			  형식)요청페이지(또는 명령어) ? 변수 = 값
			  	예) ok.jsp?uname=무궁화&kor=1&eng=1&mat=1
			- 예)검색어
		2) method=post방식
			- 사용자가 요청한 정보가 URL에 노출되지 않고 팩키지화 되어서 서버로 전송
			- Tomcat 9 이하 버전에서는 한글 깨짐
			- 예) 비번, 주민번호, 카드번호 등
			
			※ 전송방식 put, delete는 <form>에서는 지원하지 않음
			※ http://pretyimo.cafe24.com/lectureRead.do?lectureno=409
			
		
	 -->







</body>
</html>