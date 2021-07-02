<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$("#write").on("click", function(){
			location.href = "board/boardWrite.jsp"
		})
		
		$("#back").on("click", function(){
			location.href = "main2.jsp;"
		})
		
	})
</script>

<style>
#container {
	width: 800px;
	margin: auto;
}

#title {
	font-weight: bold;
}

.card-body {
	padding: 0;
}

.card-text {
	color: black;
}

.pagination {
	margin: 0;
}

a {
	color: balck;
}

.search_box {
	width: 800px;
	margin: auto;
}


.header img {
	display: block;
	margin:auto;
}

</style>
<script>
	$(function() {
		$("#write")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/board/boardWrite.jsp";
						})
		$("#back").on("click", function() {
			location.href = "${pageContext.request.contextPath}/main2.jsp";
		})
	})
</script>
</head>
<body>
	<div class="card border-secondary mb-3" id=container>
		<div class="header">
			<img src="logo.png" width="500px"><br>
		</div>
		<table class="table" align=center>
			<tr align=center>
				<td colspan=5>
					<div
						class="card-header bg-transparent border-secondary text-secondary">
						<h5 class="card-title" id="title">자유게시판</h5>
					</div>
			</tr>
			<tr align=center>
				<td width=7%><div class="card-body text-secondary">
						<p class="card-text">No.</p>
					</div>
				<td width=63%><div class="card-body text-secondary">
						<p class="card-text">Title</p>
					</div>
				<td width=10%><div class="card-body text-secondary">
						<p class="card-text">Writer</p>
					</div>
				<td width=15%><div class="card-body text-secondary">
						<p class="card-text">Date</p>
					</div>
				<td width=5%><div class="card-body text-secondary">
						<p class="card-text">View</p>
					</div>
			</tr>
			<c:forEach var="i" items="${list}">
				<tr>
					<td align="center"><div class="card-body text-secondary">
							<p class="card-text">${i.board_num}</p>
						</div>
					<td><div class="card-body text-secondary">
							<p class="card-text">
								<a
									href="${pageContext.request.contextPath}/boardView.board?board_num=${i.board_num}">${i.title}</a>
							</p>
						</div>
					<td align="center"><div class="card-body text-secondary">
							<p class="card-text">${i.nickname}</p>
						</div>
					<td align="center"><div class="card-body text-secondary">
							<p class="card-text">${i.write_date}</p>
						</div>
					<td align="center"><div class="card-body text-secondary">
							<p class="card-text">${i.view_count}</p>
						</div>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=5 align=center>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:forEach var="i" items="${navi}" varStatus="s">
								<c:choose>
									<c:when test="${i == '&raquo;'}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/list.board?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">${i}</a></li>
									</c:when>
									<c:when test="${i == '&laquo;'}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/list.board?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/list.board?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</nav>
			</tr>
			<tr>
				<td colspan=5 align=right>
					<button type="button" class="btn btn-outline-secondary" id="back">뒤로가기</button>
					<button type="button" class="btn btn-outline-secondary" id="write">글
						쓰기</button>
			</tr>
		</table>
	</div>
	<div class="search_box">
		<form action="${pageContext.request.contextPath}/list.board?cpage=1"
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
					<input type="text" class="form-control mb-2" name="keyword" id=""
						placeholder="검색할 내용을 입력해 주세요." value=""> <input
						type="hidden" name="cpage" value="1">
				</div>
				<div class="col-2">
					<button type="submit" class="btn btn-dark mb-2 w-100" id="btn_srch">검색</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>