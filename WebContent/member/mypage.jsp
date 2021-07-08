<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
<script>
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/page.mem",
			type : "get",
			dataType : "json"
		}).done(function(resp) {
			console.log(resp);
			console.log(resp.id);
			console.log(resp.pw);
			console.log(resp.reg_date)

			$("#id").text(resp.id + "");
			$("#reg_date").text("Member Since " + resp.reg_date);
		});
		$(".titleClick").on("click", function() {
			let boardNum = $(this).prev().text();
			console.log(boardNum);
			window.opener.location.href="${pageContext.request.contextPath}/boardView.board?board_num="+boardNum;
			close();
		})
	})
</script>
<style>
/* body{margin: 0 auto;} */
.member-container {
	width: 35%;
	height: 30%;
}

body {
	display: flex;
	min-height: 35rem;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.mypage-container {
	width: 590px;
}

.nameTag {
	font-family: 'Josefin Sans', sans-serif;
	font-weight: bold;
	color: #ee9ca7;
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

.shadow {
	width: 1500px;
}

.card--welcome {
	z-index: 3;
}

.card--welcome .card-title {
	color: #ee9ca7;
}

body {
	/* background: linear-gradient(to right, #ffdde1, #ee9ca7, #a7bfe8, #6190e8); */
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

* {
	box-sizing: border-box;
}

.cnt {
	width: 100%;
	margin: 0 auto;
}

/* 헤더 */
.logo {
	text-align: center;
}

.boardlistMain { /*게시물 컬럼*/
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	height: 70px;
	line-height: 60px;
}

.boardlist { /*게시글 리스트*/
	border-bottom: 1px solid gray;
	line-height: 45px;
}

.boardlist>#titleMove>a { /* 타이틀 클릭시 효과 */
	color: black;
	text-decoration: none;
}

.btns {
	text-align: right;
}

.search_box {
	width: 1000px;
	margin: auto;
}

.date {
	text-align: center;
}

.view_count {
	text-align: center;
}
</style>
</head>
<body>
	<div class="mypage-container">
		<div class="member-container">
			<div id="id" name="id" class="nameTag"></div>
			<div id="reg_date" name="reg_date" class="nameTag"></div>
		</div>
		<hr>
		<div>내가 쓴 글</div>
		<div class="row body cnt">
			<div class="col-12">
				<div class="row boardlistMain">
					<div class="col-2">글번호</div>
					<div class="col-4">제목</div>
					<div class="col-3 date">작성일</div>
					<div class="col-2 view_count">조회수</div>
				</div>
				<c:forEach var="i" items="${list}">
					<div class="row boardlist">
						<div class="col-2">${i.board_num}</div>
						<div class="col-4 titleClick">
							<a href="">${i.title}</a>
						</div>
						<div class="col-3 date">${i.write_date}</div>
						<div class="col-2 view_count">${i.view_count}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>