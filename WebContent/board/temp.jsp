<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
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
body {
	display: flex;
	min-height: 35rem;
	align-items: center;
	justify-content: center;
	font-family: 'Josefin Sans', sans-serif;
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
		max-width: 1500px
	}
}

div{
	border:1px solid black;
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

.badge-wrap {
	display: flex;
	justify-content: center;
}

.badge-wrap a.badge {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 2.5rem;
	height: 2.5rem;
	margin: 0 .2rem;
	padding: 0;
	opacity: .7;
	border-radius: 50%;
	transition: opacity .3s ease-in;
	font-size: 1rem;
	color: #fff;
	text-decoration: none;
	cursor: pointer;
}

.badge-wrap a.badge:hover {
	opacity: 1;
	color: #fff;
}

.btn {
	color: #fff !important;
	width: 10em;
	transition: all .4s;
	border-radius: 20px;
	border: 2px solid transparent;
}

.btn.btn-back {
	position: absolute;
	top: 0;
	left: 0;
	border-radius: 0;
	width: 3rem;
	height: 3rem;
	font-size: 1.5rem;
	border: 0;
}

.btn.btn-back:hover {
	border: 0 !important;
}

.form-control {
	font-family: 'Handle', cursive;
}

.form-control::-webkit-input-placeholder {
	font-family: 'Josefin Sans', sans-serif;
	letter-spacing: .1em;
	font-size: .9rem;
}

.form-control:-ms-input-placeholder {
	font-family: 'Josefin Sans', sans-serif;
	letter-spacing: .1em;
	font-size: .9rem;
}

.form-control::-ms-input-placeholder {
	font-family: 'Josefin Sans', sans-serif;
	letter-spacing: .1em;
	font-size: .9rem;
}

.form-control::placeholder {
	font-family: 'Josefin Sans', sans-serif;
	letter-spacing: .1em;
	font-size: .9rem;
}

.card--welcome {
	z-index: 3;
}

.card--welcome .card-title {
	color: #ee9ca7;
}

.card--welcome .btn-wrap {
	display: flex;
	flex-direction: column;
}

.card--welcome .btn {
	color: #fff;
	transition: all .3s;
}

.card--welcome .btn:hover {
	background-color: rgba(238, 156, 167, .25);
	font-weight: bold;
}

.card--welcome .btn-register {
	margin-bottom: .8em;
	background-color: #ee9ca7;
}

.card--welcome .btn-register:hover {
	color: #ee9ca7;
}

.card--welcome .btn-login {
	background-color: #a7bfe8;
}

.card--register .card-title {
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

* {
	box-sizing: border-box;
}

.cnt{
	width:1200px;
}

/* 헤더 */
.logo {
	text-align: center;
}

.boardlistMain { /*신고내역컬럼*/
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	height: 70px;
	line-height: 60px;
}

.boardlist { /*신고내역명단*/
	border-bottom: 1px solid gray;
	line-height: 45px;
}

.boardlist>#titleMove>a {
	color: black;
	text-decoration: none;
} /*신고게시물이동*/
.boardlist>#titleMove>a:hover {
	color: gray;
}

#delBtn {
	height: 35px;
	width: 35px;
	line-height: 10px;
	margin-top: 10px
}

.search_box {
	width: 1000px;
	margin: auto;
}
</style>
<script>
	$(function(){
		
		const cards = document.querySelectorAll('.card');

		/* View Controller
		-----------------------------------------*/
		const btns = document.querySelectorAll('.js-btn');
		btns.forEach((btn) => {
		  btn.addEventListener('click', on_btn_click, true);
		  btn.addEventListener('touch', on_btn_click, true);
		});

		function on_btn_click (e) {
		  const nextID = e.currentTarget.getAttribute('data-target');
		  const next = document.getElementById(nextID);
		  if(!next) return;
		  bg_change(nextID);
		  view_change(next);
		  return false;
		}

		/* Add class to the body */
		function bg_change(next) {
		  document.body.className = '';
		  document.body.classList.add('is-'+next);
		}

		/* Add class to a card */
		function view_change(next) {
		  cards.forEach((card) => { card.classList.remove('is-show'); });
		  next.classList.add('is-show');
		}	
		
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
					<br><br>
				


					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">No.</div>
								<div class="col-1">Title</div>
								<div class="col-4">Writer</div>
								<div class="col-4">Date</div>
								<div class="col-1">View</div>
							</div>

							<c:forEach var="i" items="${list}">
								<div class="row boardlist">
									<div class="col-2">${i.board_num}</div>
									<div class="col-1">${i.title}</div>
									<div class="col-4">${i.nickname}</div>
									<div class="col-4">${i.write_date}</div>
									<div class="col-1">${i.view_count}</div>
								</div>
							</c:forEach>
						</div>
						<div class="search_box">
							<form
								action="${pageContext.request.contextPath}/list.board?cpage=1"
								method="post">
								<div class="row">
									<div class="col-3">
										<select class="form-control" name="category" id="srch_item">
											<option value="" selected>선택하세요.</option>
											<option value="writer">작성자</option>
											<option value="title">제목</option>
											<option value="contents">내용</option>
										</select>
									</div>
									<div class="col-7">
										<input type="text" class="form-control mb-2" name="keyword"
											id="" placeholder="검색할 내용을 입력해 주세요." value=""> <input
											type="hidden" name="cpage" value="1">
									</div>
									<div class="col-2">
										<button type="submit" class="btn btn-dark mb-2 w-100"
											id="btn_srch">검색</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>