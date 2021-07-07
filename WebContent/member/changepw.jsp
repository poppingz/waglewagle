<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password Change Page</title>
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
<script>
	$(function(){		
		let pwInput = document.getElementById("pw");
		let pwcheck = document.getElementById("newpw");
		let pwRegex = /[a-z][a-z0-9]{7,15}$/;

		$("#newpw").focusout(function() {
			let pwResult1 = pwInput.value;
			let pwResult2 = pwcheck.value;
			let regexResult = pwRegex.test($("#newpw").val());
			
			if (pwResult1 == pwResult2) {
				if(regexResult){
					let style = document.getElementById("msg").getAttribute("style");
					document.getElementById("msg").setAttribute("style", "color: dodgerblue;");
				    document.getElementById("msg").innerHTML = "패스워드가 일치합니다."	
				}else{
					let style = document.getElementById("msg").getAttribute("style");
		          	document.getElementById("msg").setAttribute("style", "color:orangered;");
		          	document.getElementById("msg").innerHTML = "8~16자의 영문 소문자, 숫자만 사용 가능합니다."	
				}
				
			} else {
				let style = document.getElementById("msg").getAttribute("style");
	          	document.getElementById("msg").setAttribute("style", "color:orangered;");
	          	document.getElementById("msg").innerHTML = "패스워드가 일치하지 않습니다."
			}
		})
	})
</script>
<style>
card {
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
</style>
</head>
<body>
	<div class="card border-0 shadow card--login" id="login">
		<div class="card-body">
			<h2 class="card-title">비밀번호 변경</h2><br>
			<form action="${pageContext.request.contextPath}/changepw.mem" method="post">
				<div class="form-group">
					<input class="form-control" type="password" id="pw" placeholder="비밀번호를 입력해주세요." required />
				</div>
				<div class="form-group">
					<input class="form-control" type="password" id="newpw" name="newpw" placeholder="한번 더 입력해주세요." required />
				</div>
				<div id="msg"></div>					
				<button class="btn btn-lg" type="submit">변경</button>
			</form>
		</div>
	</div>
</body>
</html>