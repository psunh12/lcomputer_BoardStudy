<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<sec:authentication property="principal" var="principal"/>
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
		<tr style="height:50px;">
			<sec:authorize access="${ principal.uName == board.bWriter}">
			<td style="border:none;">
				<a href="/write-edit/${board.bId}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
			</td>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN') or ${ principal.uName == board.bWriter }">
			<td style="border:none;">
				<a href="/write-delete/${board.bId}"style="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
			</td>
			</sec:authorize>
		</tr>		
	</table>
	
	<table>
	<tr>
		<th>No</th>
		<th>작성자</th>
		<th>댓글</th>
	</tr>
	<c:forEach items="${list}" var="item">
		 <tr>
			<td><a href="/comment-detail/${item.cId}">${item.cId }</a></td>
			<td>${item.cWriter}</td>
			<td>${item.cComment}</td>
	     <tr>
	</c:forEach>
	</table>
	
	<form action="/comment-result" method="post">
	<input type="hidden" name="cWriter" value="${principal.uName }">
	<input type="hidden" name="bId" value="${board.bId}">
	<p> 작성자 : ${principal.uName }</p>
	<textarea  name="cComment" rows="5" cols="100" placeholder="댓글을 입력하세요"></textarea>
	<input type="submit" value="댓글작성">	
	</form>

</body>
</html>