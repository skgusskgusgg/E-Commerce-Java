<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function login() {
		var email = $('#email').val();
		var password = $('#password').val();
		$.ajax({
			url : '/login',
			type : "post",
			data : {
				"email" : email,
				"password" : password,
			},
			dataType : 'text',
			success : function(data) {
				if (data == "fail") {
					$('#Msg').html("로그인 정보가 틀렸습니다");
				} else {
					alert('로그인 완료');
					location.href="/home";
				}
			}
		})
	
	}
</script>
</head>
<body>
</body>
</html>