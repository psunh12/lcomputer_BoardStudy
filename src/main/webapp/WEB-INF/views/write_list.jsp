<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<style>
	h1{
		text-align:center;
	}
	table {
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
<body>
<h1>글목록</h1>
<table >
		<tr>
			<td colspan = "3" >전체 게시글 수 : ${boardcount }</td>
		</tr>
		
		<tr>
			<th>No</th>
			<th>ID</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${list}" var="item">
			 <tr>
				<td><a href="board-detail.do?bId=${item.bId}">${item.bId }</a></td>
				<td>${item.bWriter}</td>
				<td>${item.bContent}</td>
		     <tr>
		</c:forEach>
	</table>
	 <a href="/">돌아가기</a>
</body>
</html>