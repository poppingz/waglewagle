<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>

.container{width: 500px;}

   #contents{ height: 200px; width: 100%;}
</style>
</head>
<body>

	<form action="${pageContext.request.contextPath}/boardWrite.board" method="post">
		<div class="container">
			<select  name=category>
			 <option value="1">1</option>
			  <option value="2">2</option>
			   <option value="3">3</option>
			    </select>
			<input type=text name="nickname" placeholder="닉네임"><input type=text name=title placeholder="제목"><br>
			<textarea id="contents" name=contents placeholder="내용"></textarea>
			<br>
			<button>쓰기</button>

		</div>
	</form>

</body>
</html>