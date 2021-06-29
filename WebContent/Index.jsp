<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

body {
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	margin: auto;
	text-align:center;
	padding-top: 400px;
}

.container {
	width:800px; height:800px;
	display: inline-block;
	animation: fadein 3s;
	-webkit-animation: fadein 3s; /* Safari and Chrome */
}

@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 2;
    }
}

</style>
</head>
<body>
	<div class="container">
		<div><img src="logo.png"></div><br>
		<button type="button" class="btn btn-outline-warning" id="login">로그인</button>
		<button type="button" class="btn btn-outline-warning" id="signup">회원가입</button>
	</div>
</body>
</html>