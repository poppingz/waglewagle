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

.cnt {
	width: 1300px;
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
#row_btns{position:relative;} 

.page_nav{position:absolute;left:50%;top:calc(50% + 0.475rem);transform:translate(-50%,-50%);}

</style>
<script>
   $(function(){
       
	   $("#write").on("click", function() {
           location.href = "${pageContext.request.contextPath}/board/boardWrite.jsp";
        })
        
        $("#back").on("click", function() {
           location.href = "${pageContext.request.contextPath}/main2.jsp";
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

					<div class="row body cnt">
						<div class="col-12">

							<div class="row boardlistMain">
								<div class="col-1">No.</div>
								<div class="col-5">Title</div>
								<div class="col-3">Writer</div>
								<div class="col-2">Date</div>
								<div class="col-1">View</div>
							</div>

							<c:forEach var="i" items="${list}">
								<div class="row boardlist">
									<div class="col-1">${i.board_num}</div>
									<div class="col-5" id="titleMove">
										<a
											href="${pageContext.request.contextPath}/boardView.board?board_num=${i.board_num}">${i.title}</a>
									</div>
									<div class="col-3">${i.nickname}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-1">${i.view_count}</div>
								</div>
							</c:forEach>

							<div class="row btns" id="row_btns" align="right">
								<button type="button" class="btn btn-outline-secondary"
									id="back">뒤로가기</button>
								<button type="button" class="btn btn-outline-secondary"
									id="write">글 쓰기</button>
						


							</div>
						</div>
						<div id=""></div>
						<div class="search_box">
							<form
								action="${pageContext.request.contextPath}/List.board?cpage=1"
								method="get">
								<div class="row">
									<div class="col-3">
										<select class="form-control" name="category1" id="srch_item">
											<option value="" selected>선택하세요.</option>
											<option value="nickname">작성자</option>
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