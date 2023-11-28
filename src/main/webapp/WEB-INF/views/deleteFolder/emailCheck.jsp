<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function emailok(){
	self.close();
};

</script>
</head>
<body>

	<h2>이메일 중복확인</h2>
	<form method="post" name="frm">
		이메일 <input type="text" name="userid" value="${email }"> <input
			type="submit" value="중복체크" onclick="idok()"> <br>
		<c:if test="${result==1 }">
			<script type="text/javascript">
				opener.document.frm.userid.value = "";
			</script>
${email }는 이미 사용 중인 아이디입니다.
</c:if>
		<c:if test="${result==-1 }">
${email }는 사용 가능한 아이디입니다.
<input type="button" value="종료" onclick="emailok()">
		</c:if>
	</form>
</body>
</html>