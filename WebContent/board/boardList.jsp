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
.container{margin:auto;}
.cnt {
	width: 1200px;
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

.search_box {
	width: 1000px;
	margin: auto;
}

#boardlist{text-align: center;}
</style>
<script>
	$(function() {

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

		<div class="logo">
			<img src="logo.png">
		</div>
		<br>

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
							<a href="${pageContext.request.contextPath}/boardView.board?board_num=${i.board_num}&category=${i.category}">${i.title}</a>
						</div>
						<div class="col-3">${i.nickname}</div>
						<div class="col-2">${i.write_date}</div>
						<div class="col-1">${i.view_count}</div>
					</div>
				
			</c:forEach>
	

		<div id="boardlist">
			<nav aria-label="Page Navigation" class="page_nav">
				<c:forEach var="w" items="${navi}" varStatus="s">
					
					<!-- c:forEach var="i" begin="0" end="10" step="1" 같은 것. -->
					<c:choose>
						<c:when test="${w == '>'}">
						<a
							href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index-1]+1}&&category=${param.category}">${w }</a>
						</c:when>
						<c:when test="${w == '<'}">
							<a href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index+1]-1}&&category=${param.category}">${w }</a>
						</c:when>	
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/select.board?cpage=${w}&&category=${param.category}">${w }</a>
						</c:otherwise>
					</c:choose>

					<!-- boolean으로 값이 마지막일 경우에만. true가 됩니다. -->
				</c:forEach>

			</nav>

		</div>


				<div class="row btns">
					<div class="col-12 btns" align="right"><br>
						<button type="button" class="btn btn-outline-secondary" id="back">뒤로가기</button>
						<button type="button" class="btn btn-outline-secondary" id="write">글 쓰기</button>
					</div>
				</div>

				<div class="search_box"><br>
					<form action="${pageContext.request.contextPath}/select.board" method="get">
						<div class="row">
							<div class="col-3">
								<select class="form-control" name="category1" id="srch_item">
									<option value="">선택해주세요</option>
									<option value="nickname">작성자</option>
									<option value="title">제목</option>
									<option value="contents">내용</option>
								</select>
							</div>
							<div class="col-7">
								<input type="text" class="form-control mb-2" name="keyword"	id="" placeholder="검색할 내용을 입력해 주세요." value=""> 
								<c:choose>
									<c:when test="${param.category == 1 }">	
										<input type="hidden" name="category" value ="1">
									</c:when>
									<c:when test="${param.category == 2 }">
										<input type="hidden" name="category" value ="2">
									</c:when>
									<c:otherwise>
										<input type="hidden" name="category" value ="3">
									</c:otherwise>
								</c:choose>
								<input	type="hidden" name="cpage" value="1">
								
							</div>
							<div class="col-2">
								<button type="submit" class="btn btn-dark mb-2 w-100" id="btn_srch">검색</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>