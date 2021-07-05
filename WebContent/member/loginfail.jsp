<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
		alert("아이디 혹은 비밀번호를 다시 입력하세요.")
		location.href="${pageContext.request.contextPath}/index.jsp";
	</script>	
</body>
</html>