<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
		<form action="/loginPro" method="post">
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="text" name="username" placeholder="id를 입력해주세요.">
            <input type="password" name="password" placeholder="password를 입력해주세요.">
             <input id = "remember_me" name ="remember-me" type = "checkbox"/>Remember me
            <button type="submit" class="btn-default">로그인</button>
		</form>
</body>
</html>