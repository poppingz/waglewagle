<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID/PW</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>
body {
	display: flex;
	height: 100vh;
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

@media ( min-width : 769px) {
	.card-wrap {
		max-width: 450px
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

.card--welcome .btn-findID {
	margin-bottom: .8em;
	background-color: #ee9ca7;
}

.card--welcome .btn-findID:hover {
	color: #ee9ca7;
}

.card--welcome .btn-findPW {
	background-color: #a7bfe8;
}

.card--findID .card-title {
	color: #ee9ca7;
}

.card--findID .badge {
	background-color: #ee9ca7;
}

.card--findID .btn {
	background-color: #ee9ca7;
}

.card--findID .btn:hover {
	background-color: #fff;
	color: #ee9ca7 !important;
	font-weight: bold;
	border: 2px solid rgba(238, 156, 167, .25);
}

.card--findID .btn:focus {
	box-shadow: 0 0 0 0.2rem rgba(238, 156, 167, .25);
}

.card--findID .form-control {
	color: #ee9ca7;
	border-color: rgba(238, 156, 167, .25);
}

.card--findID .form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(238, 156, 167, .25);
}

.card--findPW .card-title {
	color: #a7bfe8;
}

.card--findPW .badge {
	background-color: #a7bfe8;
}

.card--findPW .btn {
	background-color: #a7bfe8;
}

.card--findPW .btn:hover {
	background-color: #fff;
	color: #a7bfe8 !important;
	font-weight: bold;
	border: 2px solid rgba(167, 191, 232, .25);
}

.card--findPW .btn:focus {
	box-shadow: 0 0 0 0.2rem rgba(167, 191, 232, .25);
}

.card--findPW .form-control {
	color: #a7bfe8;
	border-color: rgba(167, 191, 232, .25);
}

.card--findPW .form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(167, 191, 232, .25);
}

body {
	background: linear-gradient(to right, #ffdde1, #ee9ca7, #a7bfe8, #6190e8);
	background-size: 500% 500%;
	transition: background 3s ease;
	background-position: 50% 50%;
}

body.is-findID {
	background-position: 0% 50%;
}

body.is-findPW {
	background-position: 100% 50%;
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

#hidden{display:none;}


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
	
	$(".toIndex").on("click",function(){
		location.href="${pageContext.request.contextPath}/index.jsp";
	})
	

	$("#idBtn").on("click",function(){
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/findid.mem", data : {"email" : $('#email').val()}
		}).done(function(resp) {
			if (resp == "null") {
				$("#idBox").text("존재하지 않는 이메일입니다.");
				$("#idBox").css("color", "orangered");
			} else if (resp != "null") {
				$("#idBox").text("아이디는 " + resp + " 입니다.");
				$("#idBox").css("color", "dodgerblue");
			}
		});
	})
	
	$("#pwBtn").on("click",function(){
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if ($("#email2").val() == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/findpw.mem", data : {"id" : $('#id').val(), "email2" : $('#email2').val()}
		}).done(function(resp) {
			if (resp == "false") {
				$("#pwBox").text("존재하지 않는 아이디/이메일 입니다.");
				$("#pwBox").css("color", "orangered");
			} else {
				$('#hidden').css('display', 'block');
			}
		});
	})
	

	
})
</script>
</head>
<body>
 <div class="container">
		<div class="card-wrap">
		
			<!-- 인덱스 -->
			<div class="card border-0 shadow card--welcome is-show" id="welcome">
				<div class="card-body">
					<h2 class="card-title">아이디/비밀번호를</h2>
					<h2 class="card-title">잊으셨나요?</h2>
					<p></p>
					<div class="btn-wrap">
						<a class="btn btn-lg btn-findID js-btn" data-target="findID">아이디 찾기</a>
						<a class="btn btn-lg btn-findPW js-btn" data-target="findPW">비밀번호 변경</a>
					</div>
				</div>
				<button class="btn btn-back js-btn toIndex"> <!-- 뒤로가기 버튼 -->
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
			
			<!-- 아이디 찾기 -->
			<div class="card border-0 shadow card--findID" id="findID">
				<div class="card-body">
					<h2 class="card-title">Find ID</h2><br>
						<div class="form-group">
							<input class="form-control" type="email" placeholder="이메일" id="email"
								required />
						</div>
						<div id="idBox"></div><br>
						<button class="btn btn-lg" type="submit" id="idBtn">아이디 찾기</button>
						<p></p>
						<button class="btn btn-lg toIndex">메인으로 돌아가기</button>
				</div>
				<button class="btn btn-back js-btn" data-target="welcome"> <!-- 뒤로가기 버튼 -->
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
			
			<!-- 비밀번호 찾기 -->
			<div class="card border-0 shadow card--findPW" id="findPW">
				<div class="card-body">
					<h2 class="card-title">Change PW</h2><br>
						<form action="${pageContext.request.contextPath}/changepw.mem" method="post">
							<div class="form-group">
								<input class="form-control" type="text" placeholder="아이디" id="id"
									name="id" required />
							</div>
							<div class="form-group">
								<input class="form-control" type="email" placeholder="이메일" id="email2"
									required />
							</div>
							
							<div id="hidden">
								<div class="form-group">
									<input class="form-control" type="password" placeholder="비밀번호" id="pw"
										required />
								</div>
								<div class="form-group">
									<input class="form-control" type="password" placeholder="비밀번호 확인" id="repw"
										name="repw" required />
								</div>
								<button class="btn btn-lg" type="submit" id="modify">비밀번호 변경</button>
							</div>
						</form>
						<div id="pwBox"></div><br>
						<button class="btn btn-lg" type="submit" id="pwBtn">비밀번호 찾기</button>
						<p></p>
						<button class="btn btn-lg toIndex">메인으로 돌아가기</button>

				</div>
				<button class="btn btn-back js-btn" data-target="welcome"> <!-- 뒤로가기 버튼 -->
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
			
		</div>
	</div>
</body>
</html>