<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
     </tr>

	</c:forEach>
</table>
