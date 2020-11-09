<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
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
	}
	
</style>
</head>
	<body>
	<h1>글상세</h1>
		<table>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성자</td>
			</tr>

			<c:forEach items="${list2}" var="board">
		 	<tr>
				<td>${board.bId}</td>
				<td>${board.bTitle}</td>
				<td>${board.bContent}</td>
				<td>${board.bWriter}</td>
	     	</tr>
			</c:forEach>
		</table>		

	</body>
</html>