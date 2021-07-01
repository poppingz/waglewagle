<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>
* {
	margin: 0;
	padding: 0
}

html, body {
	overflow-y: hidden
}

ul, ol {
	list-style: none
}

.header {
	position: fixed;
	z-index: 10;
	top: 0;
	width: 100%;
	background-color: #fff;
}

.header img {
	display: block;
	margin: auto;
}

.header ul:after {
	content: "";
	display: block;
	clear: both
}

.header ul li {
	float: left;
	border-left: 1px solid rgba(255, 255, 255, 0);
	box-sizing: border-box;
	width: 25%
}

.header ul li:first-child {
	border-left: none
}

.header ul li a {
	display: block;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 20px;
	text-decoration: none;
	background-color: #F7CAC9;
	color: #fff
}

.header ul li.on a {
	background-color: #92A8D1;
	color: #000
}

.content div {
	position: relative
}

.content .cnt01 p {
	position: absolute;
	top: 50%;
	margin-top: -40px;
	text-align: center;
	width: 100%;
	font-size: 40px;
	font-weight: bold;
}

.content .cnt02 {
	background-color: #ffffff;
	overflow: hidden;
}

.content .cnt02 div {
	float: left;
}

.content .cnt02 .img {
	position: relative;
}

#f1 {
	position: absolute;
	top: 250px;
	left: 100px;
	transform: rotate(-5deg);
}

#f2 {
	position: absolute;
	top: 400px;
	left: 400px;
	transform: rotate(10deg);
}

.content .cnt02 .somewhere {
	position: relative;
}

#cnts1{
	top: 300px;
	left: 1100px;
}

.content .cnt03 {
	background-color: #ffffff;
}

.content .cnt04 {
	background-color: #ffffff;
}

.content .cnt02 div {
	display: block;
	margin: auto;
	vertical-align: middle;
}

#side-menu {
	position: fixed;
	width: 120px;
	height: 210px;
	top: 350px;
	background-color: #f0f8ff;
}

#menu-list {
	padding: 0px;
	margin: 0px;
	list-style-type: none;
}

#menu-list a {
	text-decoration: none;
}

#side-menu li {
	margin: 0px;
	padding: 14px;
	height: 25%;
}

#side-menu li:hover {
	background-color: #fff0f5;
	cursor: pointer;
}
</style>
<script>
	$(function() {
		var scroll = function() {

			var $nav = null, $cnt = null, moveCnt = null, moveIndex = 0, moveCntTop = 0, winH = 0, time = false; // 새로 만든 변수

			$(document).ready(function() {
				init();
				initEvent();
			});

			var init = function() {
				$cnt = $(".content");
				$nav = $(".header a");
			};

			var initEvent = function() {
				$("html ,body").scrollTop(0);
				winResize();
				$(window).resize(function() {
					winResize();
				});
				$nav.on("click", function() {
					moveIndex = $(this).parent("li").index();
					moving(moveIndex);
					return false;
				});
				$cnt.on("mousewheel", function(e) {
					if (time === false) { // time 변수가 펄스일때만 휠 이벤트 실행
						wheel(e);
					}
				});
			};

			var winResize = function() {
				winH = $(window).height();
				$cnt.children("div").height(winH);
				$("html ,body").scrollTop(moveIndex.scrollTop);
			};

			var wheel = function(e) {
				if (e.originalEvent.wheelDelta < 0) {
					if (moveIndex < 3) {
						moveIndex += 1;
						moving(moveIndex);
					}
					;
				} else {
					if (moveIndex > 0) {
						moveIndex -= 1;
						moving(moveIndex);
					}
					;
				}
				;
			};

			var moving = function(index) {
				time = true // 휠 이벤트가 실행 동시에 true로 변경
				moveCnt = $cnt.children("div").eq(index);
				moveCntTop = moveCnt.offset().top;
				$("html ,body").stop().animate({
					scrollTop : moveCntTop
				}, 1000, function() {
					time = false; // 휠 이벤트가 끝나면 false로 변경
				});
				$nav.parent("li").eq(index).addClass("on").siblings()
						.removeClass("on");
			};

		};

		scroll();
		
		$("#board1").on("click", function(){
	         location.href = "${pageContext.request.contextPath}/select.board?category=1"
	      })
	      
	      $("#board2").on("click", function(){
	         location.href = "${pageContext.request.contextPath}/select.board?category=2"
	      })
	      
	      $("#board3").on("click", function(){
	         location.href = "${pageContext.request.contextPath}/select.board?category=3"
	      })
		
		
		
	})
</script>
</head>
<body>
	<div class="header">
		<img src="logo.png" width="500px">
		<ul>
			<li class="on" class="a"><a href="#">My Page</a></li>
			<li><a href="#">패션</a></li>
			<li><a href="#">동물</a></li>
			<li><a href="#">스포츠</a></li>
		</ul>
	</div>
	<div class="content">

		<div class="cnt01">
			<p>${login.id}님환영합니다.</p>

			<div id=side-menu style="border-radius: 15px">
				<ul id=menu-list>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
				</ul>
			</div>
		</div>

		<div class="cnt02">
			<div class="imgs">
				<img src="fashion.jpg" width="600px" id="f1">
				<img src="fashion2.jpg" width="600px" id="f2">
			</div>
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts1">
					<h1 class="card-title">Card title</h1>
					<p></p>
					<h2 class="card-text">Some quick example text.</h2>
					<p></p>
					<button type="button" class="btn btn-success btn-lg" id="board1">GO!</button>
				</div>
			</div>

		</div>

		<div class="cnt03"></div>

		<div class="cnt04"></div>
	</div>
</body>
</html>