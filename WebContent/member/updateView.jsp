<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change PW Result</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
	<c:choose>
		<c:when test="${result > 0}">
			alert("비밀번호 변경이 완료되었습니다.")
			location.href="${pageContext.request.contextPath}/index.jsp";
		</c:when>
		<c:otherwise>
			alert("비밀번호 변경에 실패했습니다.")
			location.href="${pageContext.request.contextPath}/index.jsp";
	</c:otherwise>
	</c:choose>
	</script>
</body>
</html>