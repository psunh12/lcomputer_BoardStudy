<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<table >

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