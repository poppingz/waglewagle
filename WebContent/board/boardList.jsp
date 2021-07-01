<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$("#write").on("click", function(){
			location.href = "write.jsp"
		})
		
		$("#back").on("click", function(){
			location.href = "index.jsp;"
		})
		
	})
</script>
<style>
* {box-sizing: border-box;}

#boardBody {
	border: 1px solid black;
	width: 1000px;
	height: 700px;
	margin: auto;
}

/* Board Title */
#title {border: 1px solid black;text-align: center;}

/* Search Bar */
#search {text-align: center;padding-top: 5px;}
#search>input {height: 30px;}

/* Sub Title */
#subTitle>div {float: left;}
#subTitle>#subTitle1 {width: 70%;text-align: center;}
#subTitle>#subTitle2 {width: 10%;text-align: center;}

/* Board Contents */
#boardContentsBox {border: 1px solid black;	height: 500px;}
#boardContents>div {float: left;border: 1px solid black;}
#boardContents>#boardContents1 {width: 70%;text-align: center;}
#boardContents>#boardContents2 {width: 10%;	text-align: center;}

/* Page */

/* Board Footer */
#BoardFooter {text-align: right;}
</style>
</head>
<body>
	<div id="boardBody">
		<div id="title">
			<h1>게시판</h1>
		</div>
		<div id="search">
			<input type="text">
			<button class="btn btn-success">검색</button>
		</div>
		<div id="subTitle">
			<div id="subTitle1">TITLE</div>
			<div id="subTitle2">WRITER</div>
			<div id="subTitle2">VIEW</div>
			<div id="subTitle2">DATE</div>
		</div>
		<div id="boardContentsBox">
			<div id="boardContents">
				<c:forEach var="i" items="${list}">
					<div id="boardContents1"><a href="${pageContext.request.contextPath}/boardView.board?board_num=${i.board_num}">${i.title }</a></div>
					<div id="boardContents2">${i.nickname }</div>
					<div id="boardContents2">${i.view_count }</div>
					<div id="boardContents2">${i.write_date }</div>					
				</c:forEach>
			</div>
		</div>
		<div id="page"></div>
		<div id="BoardFooter">
			<button id="write" class="btn btn-primary">글쓰기</button>
			<button id="back" class="btn btn-danger">뒤로가기</button>
		</div>
	</div>
</body>
</html>