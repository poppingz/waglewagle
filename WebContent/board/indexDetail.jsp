<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W.W indexDetail</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>

.logo {
	text-align: center;
}
.board {
	width: 1100px;
}

#hr {
	height: 1px;
	background-color: rgb(148, 148, 148);
}

span {
	color: gray;
	width: 3px;
}

/* 댓글 부분 */
#userid {
	border: 1px solid gray;
	width: 200px;
	margin-bottom: 5px;
}

#con {
	width: 1074px;
	height: 100px;
	border: 1px solid gray;
	overflow-y: scroll;
}

#btn {
	margin: 10px;
}

/* 리플 부분 */

#box{border-top: 1px solid gray; width: 1100px; padding: 5px;}
#replyhead{height: 50px; text-align: left;}
#con2{text-align: left;}
.row{margin-left:0;}
</style>

<script>

	$(function() {
		// 뒤로가기
     	$("#back").on("click", function(){
        	location.href = "${pageContext.request.contextPath}/select.board?category=${Board_Context.category}&cpage=1"
      	})
      	
      	// 수정하기
      	$("#modify").on("click", function(){
         	location.href = "${pageContext.request.contextPath}/modifyView.board?board_num=${Board_Context.board_num}&category=${param.category}";
		})
		
		// 신고하기
      	$("#report").on("click", function(){
      		window.open("${pageContext.request.contextPath}/manager/reportForm.jsp?title=${Board_Context.title}&board_num=${Board_Context.board_num}&login=${Board_Context.id}","","width=500, height=500"); 
         	location.href = "${pageContext.request.contextPath}/report.board?board_num=${Board_Context.board_num}";
		})
		
		// 삭제하기
      	$("#delete").on("click", function(){
    		let result = confirm("게시글을 삭제하시겠습니까?");
    			if(result){
    				location.href = "${pageContext.request.contextPath}/delete.board?board_num=${Board_Context.board_num}&&category=${Board_Context.category}";
    			}else{
    				return false;
    			}

		})
		
		// 댓글 삭제하기
		$(".cdelete").on("click",function(){
			let result = confirm("댓글을 삭제하시겠습니까?");
			if(result) {
				$("#replyDelete").submit();
			}else{
				return false;
			}
		})
	})

</script>
</head>

<body>
	<div class="container">
		<div class="logo">
			<img src="logo.png">
		</div>

		<br>
		${param.category }
		<div class="board" id="board">
			<div class="viewTitle" id="viewTitle" align=left>
				<h3>${Board_Context.title}</h3>
			</div>

			<hr id="hr">

			<div class="row etcBox">
				<div class="col-6" align=left>
					${Board_Context.nickname} <span>l</span>
					${Board_Context.write_date}
				</div>

				<div class="col-6" align=right>
					조회수 : ${Board_Context.view_count} <span>l</span> 신고수 :
					${Board_Context.report}
				</div>
			</div>

			<hr>

			<!-- 작성글 -->
			<div class="content" id="content" align=left>
				${Board_Context.contents}</div>

			<hr>
			<!-- 게시글 삭제 권한 -->
			<c:choose>
				<c:when test="${login.id==Board_Context.id}">
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="delete">삭제</button>
						<button type="button" class="btn btn-outline-secondary"
							id="modify">수정</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:when>
				<c:when test="${login.id_num==1}">
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="delete">삭제</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="report">신고</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:otherwise>
			</c:choose>

			<hr id="hr">

			<!-- 댓글 -->
			<div class="col-12" align="left">
				<b>댓글</b>
			</div>

			<hr>

			<!-- 댓글 작성 -->
			<form
				action="${pageContext.request.contextPath}/insert.comment?parent_board=${Board_Context.board_num}"
				method="post">
				<div class="row comment">

					<div class="col-12" align=left>
						<input type="text" id="userid" name="nickname">
					</div>

					<div class="col-12" align=left>
						<input type="text" id="con" name="comments">
					</div>

					<div class="col-12" align=right>
						<button class="btn btn-outline-info" id="btn">등록</button>
					</div>

				</div>
			</form>

			<!-- 리플 -->
			<form
				action="${pageContext.request.contextPath}/delete.comment?parent_board=${Board_Context.board_num}"
				method="post" id="replyDelete">
				<c:forEach var="i" items="${comments}">
					<div class="row comment" id="box">
						<div class="col-12" id="replyhead">${i.nickname}님의 댓글<button id="cdelete" class="btn btn-outline-dark btn-sm cdelete">X</button></div>
						<div class="col-12" id="con2">${i.comments}</div>
					</div>
					<input type="text" name="comm_num" value="${i.comm_num}"
						style="visibility: hidden;">
					<input type="text" name="parent_board" value="${i.parent_board}"
						style="visibility: hidden;">
				</c:forEach>
			</form>

			<hr id="hr">

		</div>



	</div>

</body>

</html>