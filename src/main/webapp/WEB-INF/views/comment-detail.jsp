<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글상세</title>
<style>
	table{
		border-collapse:collapse;
	}
	table tr th {
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		width:200px;
		text-align:center;
	}
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
		border:none;
		cursor:pointer;
		padding:10px;
		display:inline-block;
	}
	
</style>
</head>
<body>
	<sec:authentication property="principal" var="principal"/>	
	<h1>댓글상세</h1>
	<table>
		<tr>
			<td>No</td>
			<td>작성자</td>
			<td>댓글</td>
		</tr>
		
		<tr>
			<td>${comment.cId }</td>
			<td>${comment.cWriter }</td>
			<td>${comment.cComment }</td>
		</tr>
		<tr style="height:50px;">
		<sec:authorize access="${ principal.uName == comment.cWriter}">
			<td style="border:none;">
				<a href="/comment-edit/${comment.cId}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
			</td>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN') or ${ principal.uName == comment.cWriter }">
			<td style="border:none;">
				<a href="/comment-delete/${comment.cId}"style="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
			</td>
		</sec:authorize>
		</tr>		
	</table>
</body>
</html>