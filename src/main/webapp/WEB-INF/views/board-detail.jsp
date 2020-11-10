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
		border:none;
		cursor:pointer;
		padding:10px;
		display:inline-block;
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
		 	<tr>
				<td>${board.bId}</td>
				<td>${board.bTitle}</td>
				<td>${board.bContent}</td>
				<td>${board.bWriter}</td>
	     	</tr>
		</table>		
	<tr style="height:50px;">
		<td style="border:none;">
			<a href="/write-edit/${board.bId}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
		</td>
		<td style="border:none;">
			<a href="/write-delete/${board.bId}"style="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
		</td>
	</tr>

	</body>
</html>