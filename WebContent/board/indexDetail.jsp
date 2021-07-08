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

/* 템플릿 */
body {
	display: flex;
	min-height: 55rem;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.container {
	margin: auto;
}

.card {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 100%;
	padding-top: 1rem;
	padding-bottom: 1rem;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.card-wrap {
	position: relative;
	margin: 0 auto;
}

@media ( min-width : 1400px) {
	.card-wrap {
		max-width: 1500px;
	}
}

.card-body {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.card-body p {
	font-size: 1.1rem;
}

.card-title {
	font-weight: bold;
	font-size: 1.8rem;
}

.shadow { /*UI중 가장 흰 바탕 크기 조절*/
	width: 1500px;
}

.card--welcome {
	z-index: 3;
}

.card--welcome .card-title {
	color: #ee9ca7;
}

body {
	background: linear-gradient(to right, #ffdde1, #ee9ca7, #a7bfe8, #6190e8);
	background-size: 500% 500%;
	transition: background 3s ease;
	background-position: 50% 50%;
}

.card {
	transition: all .3s .1s ease-out;
}

.card:not(.is-show) {
	opacity: 0;
	-webkit-transform: translate(-50%, -50%) rotateX(95deg);
	transform: translate(-50%, -50%) rotateX(95deg);
}

.card.is-show {
	opacity: 1;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	z-index: 5;
}

/* 여기부터 꾸미기 시작 */

/* 게시판 부분 */
.board {
	width: 1000px;
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
#con {
	width: 1000px;
	height: 100px;
	border: 1px solid gray;
	overflow-y: scroll;
}

#userid {
	border: 1px solid gray;
	width: 200px;
	margin-bottom: 5px;
}

#btn {
	margin: 10px;
}

/* 리플 부분 */
</style>

<script>
	$(function() {
		// 뒤로가기
     	$("#back").on("click", function(){
        	location.href = "${pageContext.request.contextPath}/select.board?category=${Board_Context.category}"
      	})
      	
      	// 수정하기
      	$("#modify").on("click", function(){
         	location.href = "${pageContext.request.contextPath}/modifyView.board?board_num=${Board_Context.board_num}";
		})
		
		// 신고하기
      	$("#report").on("click", function(){
         	location.href = "${pageContext.request.contextPath}/report.board?board_num=${Board_Context.board_num}";
		})
		
		// 삭제하기
      	$("#delete").on("click", function(){
         	location.href = "${pageContext.request.contextPath}/delete.board?board_num=${Board_Context.board_num}&&category=${Board_Context.category}";
		})
	})
</script>
</head>

<body>
	<div class="container">
		<div class="card-wrap">
			<div class="card border-0 shadow card--welcome is-show" id="welcome">
				<div class="card-body">
					<div class="logo">
						<img src="logo.png">
					</div>

					<br> <br>

					<!-- 여기부터 꾸미기 시작 -->

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

						<hr>

						<!-- 리플 -->
						<form
							action="${pageContext.request.contextPath}/delete.comment?parent_board=${Board_Context.board_num}"
							method="post">
							<c:forEach var="i" items="${comments}">
								<div class="row comment">
									<div class="col-1">${i.nickname}</div>
									<div class="col-5">${i.comments}</div>
									<button id="cdelete">X</button>
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

			</div>

		</div>

	</div>

</body>

</html>