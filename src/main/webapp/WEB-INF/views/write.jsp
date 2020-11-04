<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<h1>글쓰기</h1>
</body>
<sec:authentication property="principal" var="principal"/>
<form action="/write-process" method="post">
	<input type="hidden" name="bWriter" value="${principal.uName }">
	<p> 작성자 : ${principal.uName }</p>
	<P> 제목 : <input type="text" name="bTitle" placeholder="제목을 입력하세요."></P>
	<textarea  name="bContent" rows="10" cols="100" placeholder="내용을 입력하세요"></textarea>
	<input type="submit" value="글작성">	
</form>
	
</html>