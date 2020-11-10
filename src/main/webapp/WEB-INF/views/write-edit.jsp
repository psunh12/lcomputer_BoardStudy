<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
	<sec:authentication property="principal" var="principal"/>
	<h1>글 수정</h1>
	<form action="/editProcess" method="post">
		<input type="hidden" name="bId" value="${board.bId }">
		<input type="hidden" name="bwriter" value="${principal.uName }">
		<p> 작성자 : ${principal.uName }</p>
		<P> 제목 : <input type="text" name="bTitle" value="${board.bTitle }"></P>
		<textarea  name="bContent" rows="10" cols="100" >${board.bContent }</textarea>
		<input type="submit" value="수정완료">	
	</form>
</body>
</html>