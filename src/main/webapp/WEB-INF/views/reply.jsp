<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글작성</title>
</head>
<h1>답글작성</h1>
<body>
<sec:authentication property="principal" var="principal"/>
<form action="/reply-process" method="post">
	<input type="hidden" name="rWriter" value="${principal.uName }">
	<input type="hidden" name="bId" value="${board.bId}">
	<p> 작성자 : ${principal.uName }</p>
	<P> 제목 : RE: <input type="text" name="rTitle" placeholder="제목을 입력하세요."></P>
	<textarea  name="rReply" rows="10" cols="100" placeholder="내용을 입력하세요"></textarea>
	<input type="submit" value="답글작성">	
</form>
</body>
</html>