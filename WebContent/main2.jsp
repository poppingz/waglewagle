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
rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" 
crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<style>
	/* 폰트 */
	@font-face {
    font-family: '양진체';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ROKABold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.1/ROKABold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
     font-family: 'DungGeunMo';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
     font-weight: normal;
     font-style: normal;
	}
	
	@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	* {margin: 0; padding: 0}
	
	html, body {overflow-y: hidden}
	
	ul, ol {list-style: none}
	
	.header {
		position: fixed;
		z-index: 10;
		top: 0;
		width: 100%;
		background-color: #fff;
	}
	
	.header img {display: block; margin: auto; padding:20px;}
	
	.header ul:after {
		content: "";
		display: block;
		clear: both
	}
	
	.header ul li {
		float: left;
		border-left: 1px solid rgba(255, 255, 255, 0);
		box-sizing: border-box;
		width: 25%;
	}
	
	.header ul li:first-child {border-left: none}
	
	.header ul li a {
        display: block;
        height: 50px;
        text-align: center;
        line-height: 30px;
        font-size: 33px;
        text-decoration: none;
        color: rgb(250, 151, 168);
        font-family: 'yg-jalnan', cursive;
	}
	
	.header ul li.on a {
		color: #92A8D1;
	}
	
	.content div {position: relative}
	
	#side-menu {
		font-family: 'DungGeunMo';
		position: fixed;
		width: 150px;
		top: 350px;
		left: -120px;
		background-color: #F7CAC9;
		transition-duration: 1s;
	}
	
	#side-menu:hover {
		transform: translate(120px, 0px);
		transition-duration: 1s;
	}
	
	#side-menu:hover #latch {display: none;}
	
	#menu-list {
		padding: 0px;
		margin: 0px;
		list-style-type: none;
	}
	
	#menu-list a {
		color: black;
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
		border-radius: 15px;
	}
	
	.content .cnt01 {position: relative;}
	
	#carouselExampleCaptions{
		position: absolute;
		top: 250px;
	}
	.content .cnt01 form{
		position: absolute;
		top: 65%;
		left: 50%;
		margin-top: -40px;
		text-align: center;
	}
	
	.content .cnt02 {
		background-color: #ffffff;
		overflow: hidden;
	}
	
	.content .cnt02 div {float: left;}
	
	.img {position: relative;}
	
	.somewhere {position: relative;}
	
	#f1 {
		position: absolute;
		top: 250px;
		left: 150px;
		transform: rotate(-5deg);
		border-radius: 15px;
	}
	
	#f2 {
		position: absolute;
		top: 500px;
		left: 450px;
		transform: rotate(7deg);
		border-radius: 15px;
	}
	
	#f1:hover {z-index: 3;}
	#f2:hover {z-index: 3;}
	
	#cnts1 {
		font-family: '양진체';
		top: 300px;
		left: 1200px;
	}
	
	.content .cnt03 {
		background-color: #ffffff;
		overflow: hidden;
	}
	
	.content .cnt03 div {float: left;}
	
	#a1 {
		position: absolute;
		top: 170px;
		left: 230px;
		border-radius: 15px;
	}
	
	#a2 {
		position: absolute;
		top: 250px;
		left: -120px;
		transform: rotate(-7deg);
		border-radius: 15px;
	}
	
	#a3 {
		position: absolute;
		top: 500px;
		left: 380px;
		transform: rotate(7deg);
		border-radius: 15px;
	}
	
	#a1:hover {z-index: 3;}
	#a2:hover {z-index: 3;}
	#a3:hover {z-index: 3;}
	
	#cnts2 {
		font-family: 'IM_Hyemin-Bold';
		top: 300px;
		left: 150px;
	}
	
	.content .cnt04 {
		background-color: #ffffff;
		overflow: hidden;
	}
	
	.content .cnt04 div {float: left;}
	
	#s1 {
		position: absolute;
		top: 250px;
		left: 150px;
		transform: rotate(-5deg);
		border-radius: 15px;
	}
	
	#s2 {
		position: absolute;
		top: 330px;
		left: 500px;
		transform: rotate(7deg);
		border-radius: 15px;
	}
	
	#s3 {
		position: absolute;
		top: 600px;
		left: 250px;
		border-radius: 15px;
	}
	
	#s1:hover {z-index: 3;}
	#s2:hover {z-index: 3;}
	#s3:hover {z-index: 3;}
	
	#cnts3 {
		font-family: 'ROKABold';
		top: 300px;
		left: 1200px;
	}

 /* 메인슬라이드 */
        * {
            margin: 0;
            padding: 0;
        }

        ul,
        li {
            list-style: none;
        }

        #mainslide {
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        #mainslide ul {
            width: 400%;
            height: 74%;
            transition: 1s;
        }

        #mainslide ul:after {
            content: "";
            display: block;
            clear: both;
        }

        #mainslide li {
            float: left;
            width: 25%;
            height: 100%;
        }

        #mainslide>ul>li>img {
            width: 100%;
            height: 74%;
            height: 100%;
        }

        #mainslide input {
            display: none;
        }

        #mainslide label {
            display: inline-block;
            vertical-align: middle;
            width: 10px;
            height: 10px;
            border: 2px solid #666;
            background: #fff;
            transition: 0.3s;
            border-radius: 50%;
            cursor: pointer;
        }

        #mainslide .mainpos {
            text-align: center;
            position: absolute;
            bottom: 10px;
            left: 0;
            width: 100%;
            text-align: center;
        }

        #mainpos1:checked~ul {
            margin-left: 0%;
        }

        #mainpos2:checked~ul {
            margin-left: -100%;
        }

        #mainpos3:checked~ul {
            margin-left: -200%;
        }

        #mainpos4:checked~ul {
            margin-left: -300%;
        }
		.top-navi{margin:0;}
		.main-contents{position:relative; top:220px;}
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
	         location.href = "${pageContext.request.contextPath}/select.board?category=1&cpage=1"
	      })
	      
	      $("#board2").on("click", function(){
	         location.href = "${pageContext.request.contextPath}/select.board?category=2&cpage=1"
	      })
	      
	      $("#board3").on("click", function(){
	         location.href = "${pageContext.request.contextPath}/select.board?category=3&cpage=1"
	      })
	      $("#modifyPw").on("click", function() {
			$("#tdPw").attr("contenteditable", "true")
			$("#tdPw").focus();
		  })
	      $("#modifyEmail").on("click", function() {
			$("#tdEmail").attr("contenteditable", "true")
			$("#tdEmail").focus();
		  })
		  $("#frm").on("submit", function() {
			  $("#pw").val($("#tdPw").text());
			  $("#email").val($("#tdEmail").text());
          })
          $("#memberOut").on("click",function(){
        	  let result = confirm("정말 탈퇴하시겠습니까?");
        	  if(result){location.href="memberOut.mem";}
          })
	      $.ajax({
		         url:"${pageContext.request.contextPath}/page.mem", type:"get", dataType:"json"
		      }).done(function(resp){
		         console.log(resp);
		         console.log(resp.id);
		         console.log(resp.pw);
		         $("#id").text(resp.id);
		         $("#tdPw").text(resp.pw);
		         $("#tdEmail").text(resp.email);
		         $("#tdSignUp").text(resp.reg_date);
		         });


		$("#mypage").on("click", function() {
			window.open("${pageContext.request.contextPath}/myList.mem","My Page", "width=600, height=650");
			//window.open(location.href = "${pageContext.request.contextPath}/myList.mem");
		})

		$("#changepw").on("click", function() {
			window.open("member/changepw.jsp","changepw", "width=700, height=300");
			/* location.href = "member/changepw.jsp"; */
		})

		$("#logout").on("click", function() {
			location.href = "${pageContext.request.contextPath}/logout.mem";
		})
	})
</script>
</head>
<body>
	<div class="header">
		<img src="logo.png" width="700px"><br>
		<ul class="top-navi">
			<li class="on" class="a"><a href="#">My Page</a></li>
			<li><a href="#">Fashion</a></li>
			<li><a href="#">Animal</a></li>
			<li><a href="#">Sports</a></li>
		</ul>
	</div>
	<div class="content">

		<div class="cnt01">

			<div id="mainslide">
        	    <input type="radio" name="mainpos" id="mainpos1" checked>
                <input type="radio" name="mainpos" id="mainpos2">
                <input type="radio" name="mainpos" id="mainpos3">
                <ul class="main-contents">
                	<li>
                		<img src="main.jpg" width="900px">
                	</li>
                    <li>
                		<img src="main2.jpg">
                	</li>
                	<li>
                		<img src="main3.jpg" width="900px">
                	</li>
                </ul>
                
                <p class="mainpos">
                    <label for="mainpos1"></label>
                    <label for="mainpos2"></label>
                    <label for="mainpos3"></label>
                </p>
            </div>


			<div id=side-menu style="border-radius: 15px">
				<ul id=menu-list>
					<li id="mypage">마이페이지</li>
					<li id="changepw">비밀번호 변경</li>
					<li id="logout">로그아웃</li>
					<li id="memberout">회원탈퇴</li>
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
					<h1 class="card-title">"Fashion Is My Passion"</h1>
					<p></p>
					<h2 class="card-text">패션의, <br> 패션에 의한,<br> 패션을 위한 사람들</h2>
					<p></p>
					<button type="button" class="btn btn-info btn-lg" id="board1">GO!</button>
				</div>
			</div>
		</div>

		<div class="cnt03">
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts2">
					<h1 class="card-title">"Please love us!"</h1>
					<p></p>
					<h2 class="card-text">살아있는 모든 생명체에<br> 대한 사랑은,<br>인간의 가장 숭고한 본능이다.<br><br>-찰스다윈</h2>
					<p></p>
					<button type="button" class="btn btn-warning btn-lg" id="board2">GO!</button>
				</div>
			</div>
			<div class="imgs">
				<img src="ani1.jpg" width="550px" id="a1"> 
				<img src="ani2.jpg" width="500px" id="a2">  
				<img src="bugu.jpg" width="400px" id="a3">
			</div>
		</div>

		<div class="cnt04">
			<div class="imgs">
				<img src="spo1.jpg" width="600px" id="s1"> 
				<img src="spo2.jpg" width="550px" id="s2"> 
				<img src="spo3.jpg" width="700px" id="s3">
			</div>
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts3">
					<h1 class="card-title">"Run and run!"</h1>
					<p></p>
					<h2 class="card-text">누가 경기를 시작했는지는<br> 중요하지 않다.<br><br>누가 경기를 끝냈느냐가<br>중요하다.</h2>
					<p></p>
					<button type="button" class="btn btn-success btn-lg" id="board3">GO!</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>