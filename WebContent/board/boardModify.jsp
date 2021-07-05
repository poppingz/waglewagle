<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Modify</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script></script>

<style>
.container {width: 500px;}
#contents {height: 200px;width: 100%;}
</style>

</head>
<body>
	<form action="${pageContext.request.contextPath}/modify.board" method="get">
		<input type="text" name="board_num"  value="${Board_Context.board_num}">
		<div class="container">
			<input type=text name="nickname" placeholder="닉네임" value="${Board_Context.nickname}">
			<input type=text name=title placeholder="제목" value="${Board_Context.title}"><br>
			<textarea id="contents" name=contents placeholder="내용">${Board_Context.contents}</textarea>
			<br>
			<button>수정</button>
		</div>
	</form>
</body>
</html>