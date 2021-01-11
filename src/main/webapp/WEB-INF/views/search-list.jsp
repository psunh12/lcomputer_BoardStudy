<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<table >
	<tr>
		<td colspan = "5" >검색된 게시글 수 : ${pagination.count }</td>
	</tr>
	<tr>
		<th>No</th>
		<th>답글번호</th>
		<th>ID</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<c:forEach items="${list2}" var="item">
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
				<a href="/search-list/${pagination.prevPage }">◀</a>
			</li>
		</c:when>
	</c:choose>			
	<c:forEach var="i" begin="${pagination.startPage }" end="${pagination.endPage }" step="1">
		<c:choose>
			<c:when test="${pagination.page == i }">
			<li style="background-color:#ededed;">
				<a href="search-list">${i}</a>
			</li>
			</c:when>
			<c:when test="${pagination.page != i }">
			<li>
				<a href="/search-list/${i}">${i}</a>
			</li>
			</c:when>
		</c:choose>		
	</c:forEach>
	
	<c:choose>
		<c:when test="${pagination.endPage < pagination.lastPage }">
			<li style="">
				<a href="/search-list/${pagination.nextPage }">▶</a>
			</li>
		</c:when>
	</c:choose>			
</div>			



	