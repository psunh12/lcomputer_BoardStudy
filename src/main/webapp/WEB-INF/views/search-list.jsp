<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>
<h1>검색 결과</h1>
<table >
	<tr>
		<td colspan = "5" >전체 게시글 수 : ${pagination.count }</td>
	</tr>
	
	<tr>
		<th>No</th>
		<th>답글번호</th>
		<th>ID</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<c:forEach items="${list}" var="item">
	
	</c:forEach>
	
</table>	
</body>
</html>