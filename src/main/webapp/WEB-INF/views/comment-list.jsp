<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<table>
	<tr>
		<th>No</th>
		<th>작성자</th>
		<th>댓글</th>
		<th></th>
	</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td><a href="/comment-detail/${item.cId}">${item.cId }</a></td>
					<td>${item.cWriter}</td>
					<td style="width: 500px;">${item.cComment}</td>
					<td>
						<sec:authorize access="${ principal.uName == item.cWriter}">
							<button class="editcomment" cId="${item.cId }">수정</button>	
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN') or ${ principal.uName == item.cWriter }">
							<button class="deletecomment" cId="${item.cId }" >삭제</button>
						</sec:authorize>
					</td>
     </tr>

	</c:forEach>
</table>
