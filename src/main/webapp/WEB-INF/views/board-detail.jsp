<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
	.comment-list table{
		border-collapse:collapse;
	}
	.comment-list tr th {
		font-weight:700;
	}
	.comment-list tr td, .comment-list tr th {
		border:1px solid #818181;
		width:100px;
		text-align:center;
	}
	.comment-list a {
		text-decoration:none;
		color:#000;
		font-weight:700;
		border:none;
		cursor:pointer;
		padding:10px;
		display:inline-block;
	}
	
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
	table a {
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
			<td style="border:none;">
				<a href="/reply/${board.bId}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >답글작성</a>
			</td>
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
	
	<div id="div-comment">
		<table class="comment-list">
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
							<!-- a href="/commentProcess/${board.bId}" id='editcomment' style="width:70%;font-weight:70;background-color:#818181;color:#fff;" >수정</a-->
							<button class="editcomment" cId="${item.cId }">수정</button>	
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN') or ${ principal.uName == item.cWriter }">
							<!-- a href="/comment-delete/${board.bId}"style="width:70%;font-weight:70;background-color:red;color:#fff;">삭제</a-->
							<button class="deletecomment" cId="${item.cId }" >삭제</button>
						</sec:authorize>
					</td>
			    </tr>
			</c:forEach>
		</table>
	</div>
	
	<form action="/comment-result" method="post">
		<input type="hidden" name="cWriter" value="${principal.uName }">
		<input type="hidden" name="bId" value="${board.bId}">
		<p> 작성자 : ${principal.uName }</p>
		<textarea  name="cComment" id="txt-comment" rows="5" cols="100" placeholder="댓글을 입력하세요"></textarea>
		<input type="button" id="btn-comment" value="댓글작성">	
	</form>

<script>
$(document).on('click', '#btn-comment', function () {

	let txtComment = $('#txt-comment').val();

	$.ajax({
		method: "POST",
		url: "/comment-list",
		data: {
				cComment: txtComment,
				cWriter: '${principal.uName}',
				bId: ${board.bId}
			  }
	})
	.done(function( html ) {
		$('#div-comment').html(html);
		$('#txt-comment').val('');
		//console.log("console: "+html);
	});
});


// 댓글 수정 폼 클릭 이벤트 핸들러
$(document).on('click', '.editcomment', function () {

	let commentValue = $(this).parent().prev().text();
	let input = "<input type='text' class='commentContent' size=50 value='"+ commentValue +"'>";

	$(this).text('등록');
	$(this).attr('class', 'editcomment2');
	$(this).parent().prev().html(input);
/*	let txtComment = $('#txt-comment').val();

	$.ajax({
		method: "POST",
		url: "/comment-list",
		data: {
				cComment: txtComment,
				cWriter: '${principal.uName}',
				bId: ${board.bId}
			  }
	})
	.done(function( html ) {
		console.log(html);
	});*/
});	

//댓글 수정 클릭 이벤트 핸들러
$(document).on('click', '.editcomment2', function () {
	let cId = $(this).attr('cId');
	let txtComment = $(this).parent().prev().find('input').val();
	$.ajax({
		method: "POST",
		url: "/comment-list",
		data: {
				cComment: txtComment,
				cWriter: '${principal.uName}',
				bId: ${board.bId},
				cId:cId
				
			  }
	})
	.done(function( html ) {
		console.log(html);
		$('#div-comment').html(html);
		//$('.editcomment').val('');	
	});
});

//삭제
$(document).on('click', '.deletecomment', function () {
	let txtComment = $('#txt-comment').val();
	let cId = $(this).attr('cId');
	
	$.ajax({
		method: "POST",
		url: "/comment-remove",
		data: {
				cComment: txtComment,
				cWriter: '${principal.uName}',
				bId: ${board.bId},
				cId:cId
		  }
	})
	.done(function( html ) {
		console.log(html);
		$('#div-comment').html(html);
	});
});
</script>

</body>
</html>