<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W.W Member ReportForm</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
	<c:choose>
		<c:when test="${reason > 0}">
			alert("신고가 정상적으로 처리되었습니다.")
			window.close();
		</c:when>
		<c:otherwise>
			alert("신고가 정상적으로 처리되지 않았습니다.")
			location.href="manager/reportForm.jsp";
	</c:otherwise>
	</c:choose>
	</script>
</body>
</html>