<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal" var="principal"/>
	<h1>댓글 수정</h1>
	<form action="/commentProcess" method="post">
	<input type="hidden" name="cWriter" value="${principal.uName }">
	<input type="hidden" name="cId" value="${comment.cId}">
	<p> 작성자 : ${principal.uName }</p>
	<textarea  name="cComment" rows="5" cols="100">${comment.cComment}</textarea>
	<input type="submit" value="댓글수정완료">	
	</form>
</body>
</html>