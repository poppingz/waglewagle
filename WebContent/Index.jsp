<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wagle Wagle</title>
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

.card--register .badge {
	background-color: #ee9ca7;
}

.card--register .btn {
	background-color: #ee9ca7;
}

.card--register .btn:hover {
	background-color: #fff;
	color: #ee9ca7 !important;
	font-weight: bold;
	border: 2px solid rgba(238, 156, 167, .25);
}

.card--register .btn:focus {
	box-shadow: 0 0 0 0.2rem rgba(238, 156, 167, .25);
}

.card--register .form-control {
	color: #ee9ca7;
	border-color: rgba(238, 156, 167, .25);
}

.card--register .form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(238, 156, 167, .25);
}

.card--login .card-title {
	color: #a7bfe8;
}

.card--login .badge {
	background-color: #a7bfe8;
}

.card--login .btn {
	background-color: #a7bfe8;
}

.card--login .btn:hover {
	background-color: #fff;
	color: #a7bfe8 !important;
	font-weight: bold;
	border: 2px solid rgba(167, 191, 232, .25);
}

.card--login .btn:focus {
	box-shadow: 0 0 0 0.2rem rgba(167, 191, 232, .25);
}

.card--login .form-control {
	color: #a7bfe8;
	border-color: rgba(167, 191, 232, .25);
}

.card--login .form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(167, 191, 232, .25);
}

body {
	background: linear-gradient(to right, #ffdde1, #ee9ca7, #a7bfe8, #6190e8);
	background-size: 500% 500%;
	transition: background 3s ease;
	background-position: 50% 50%;
}

body.is-register {
	background-position: 0% 50%;
}

body.is-login {
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

#id_check{margin-bottom:10px; font-size: 14px;}
#pwBox{font-size: 14px;}
.find{margin-bottom:10px; font-size: 14px;}

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
		
		document.getElementById("repw").oninput = function () {
	        let pw = document.getElementById("pw").value;
	        let repw = document.getElementById("repw").value;
	  
	        if (pw == repw) {
	          let style = document.getElementById("pwBox").getAttribute("style");
	          document.getElementById("pwBox").setAttribute("style", "color: dodgerblue;");
	          document.getElementById("pwBox").innerHTML = "패스워드가 일치합니다."
	        } else {
	          let style = document.getElementById("pwBox").getAttribute("style");
	          document.getElementById("pwBox").setAttribute("style", "color:orangered;");
	          document.getElementById("pwBox").innerHTML = "패스워드가 일치하지 않습니다."
	        }
	      }
		
		$("#id").focusout(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/idCheck.mem", data : {"id" : $('#id').val()}
			}).done(function(resp) {
				if (resp == "true") {
					$("#id_check").text("이미 사용중인 ID 입니다.");
					$("#id_check").css("color", "orangered");
				} else if (resp == "false") {
					$("#id_check").text("사용 가능한 ID 입니다.");
					$("#id_check").css("color", "dodgerblue");
				}
			});
		})
		
		let idRegex = /^[a-z]{5,16}$/;
		let pwRegex = /^[a-z\d]{8,16}$/;
		let emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{3}$/;
		
		$("#signup").on("click",function(){
			if($("#pwBox").text() == "패스워드가 일치하지 않습니다."){
				alert("비밀번호를 다시 확인해주세요.")
				return false;
			}
			
			let idResult = idRegex.test($("#id").val());
			let pwResult = pwRegex.test($("#repw").val());
			let emailResult = emailRegex.test($("#email").val());
			
			if (idResult) {
				if (pwResult) {
					if (emailResult) {
						document.getElementById("signupForm").submit();
					} else {
						alert("이메일 형식을 다시 확인해주세요.")
						return false;
					}
				} else {
					alert("비밀번호 형식을 다시 확인해주세요.\n8~16자의 영문 소문자, 숫자만 사용 가능합니다.")
					return false;
				}
			} else {
				alert("아이디 형식을 다시 확인해주세요.\n5~16자의 영문 소문자만 사용 가능합니다.")
				return false;
			}
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
					<h2 class="card-title">WELCOME TO</h2>
					<p></p>
					<div><img src="logo.png" width="400px"></div>
					<br>
					<div class="btn-wrap">
						<a class="btn btn-lg btn-register js-btn" data-target="register">SIGN UP</a>
						<a class="btn btn-lg btn-login js-btn" data-target="login">LOGIN</a>
					</div>
				</div>
			</div>
			
			<!-- 회원가입 -->
			<div class="card border-0 shadow card--register" id="register">
				<div class="card-body">
					<h2 class="card-title">Create Account</h2><br>
					<form action="${pageContext.request.contextPath}/insert.mem" method="post" id="signupForm">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="아이디" id="id"
								name="id" required />
						</div>
						<div id="id_check"></div>
						<div class="form-group">
							<input class="form-control" type="email" placeholder="이메일" id="email"
								name="email" required />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" id="pw"
								placeholder="비밀번호" required />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" id="repw"
								name="pw" placeholder="비밀번호 확인" required />
						</div>
						<div id="pwBox"></div><br>
						<button class="btn btn-lg" id="signup">회원가입</button>
					</form>
				</div>
				<button class="btn btn-back js-btn" data-target="welcome"> <!-- 뒤로가기 버튼 -->
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
			
			<!-- 로그인 -->
			<div class="card border-0 shadow card--login" id="login">
				<div class="card-body">
					<h2 class="card-title">Welcome Back!</h2><br>
					<form action="${pageContext.request.contextPath}/login.mem" method="post">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="아이디" name="id"
								required />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="pw"
								placeholder="비밀번호" required />
						</div>
						<div class="find">
							<a href="member/find.jsp">아이디 찾기/비밀번호 변경</a>
						</div>
						<button class="btn btn-lg">로그인</button>
					</form>
				</div>
				<button class="btn btn-back js-btn" data-target="welcome"> <!-- 뒤로가기 버튼 -->
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
			
		</div>
	</div>
</body>
</html>