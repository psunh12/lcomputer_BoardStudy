<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	ul{
		width:600px;
		height:50px;
		margin:10px auto;
		}
	li{
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		text-align:center;
		margin:0 5px;
		border-radius:5px;
		}	
</style>
<body>
<h1>글목록</h1>
<div id ="search">
	<select class="controlbox" name="searchType">
		<option value="id">아이디</option>
		<option value="title">제목</option>
		<option value="content">내용</option>			
	</select>
	<input type="text" name="searchbox" size="30">
	<button class="gosearch">검색하기</button>
</div>
<p></p>

<div id ="writelist">
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
		 <c:choose>
		 	<c:when test="${item.bOrder > 1}">
		 		<c:set var="replyColor" value="background-color: gray" />
		 		<c:set var="replyIcon" value="<img src='https://static.thenounproject.com/png/88514-200.png' style='width: 20px; height: 15px;'>" />
		 	</c:when>
		 	<c:otherwise>
		 		<c:set var="replyColor" value="background-color: white" />
		 		<c:set var="replyIcon" value="" />
    		</c:otherwise>
		 </c:choose>
		 <tr style="${replyColor}">
			<td>${replyIcon}<a href="/board-detail/${item.bId}">${item.bId }</a></td>
			<td>${item.bOrder}</td>
			<td>${item.bWriter}</td>
			<td>${item.bTitle}</td>
			<td>${item.bContent}</td>
	     <tr>
	</c:forEach>
</table>

	
<a href="/">돌아가기</a>
	
<div style="margin-top: 20px;">
	<c:choose>
		<c:when test="${pagination.startPage > pagination.pageUnit }">
			<li style="">
				<a href="/write-list/${pagination.prevPage }">◀</a>
			</li>
		</c:when>
	</c:choose>			
	<c:forEach var="i" begin="${pagination.startPage }" end="${pagination.endPage }" step="1">
		<c:choose>
			<c:when test="${pagination.page == i }">
			<li style="background-color:#ededed;">
				<a href="write-list">${i}</a>
			</li>
			</c:when>
			<c:when test="${pagination.page != i }">
			<li>
				<a href="/write-list/${i}">${i}</a>
			</li>
			</c:when>
		</c:choose>		
	</c:forEach>
	
	<c:choose>
		<c:when test="${pagination.endPage < pagination.lastPage }">
			<li style="">
				<a href="/write-list/${pagination.nextPage }">▶</a>
			</li>
		</c:when>
	</c:choose>			
</div>
</div>
<script>
$(document).on('click', '.gosearch', function () {
	let searchbox = $('input[name="searchbox"]').val();
	let searchtype = $("select[name='searchType']").val();

	//console.log("box:"+searchbox);
	//console.log("type:"+searchtype);
	
	$.ajax({
		method: "GET",
		url: "/search-list",
		data: {
			searchType: searchtype, 
			keyword: searchbox
		  }
	})
	.done(function( html ) {
		console.log(html);
		$('#writelist').html(html);
	});
});
</script>
</body>
</html>