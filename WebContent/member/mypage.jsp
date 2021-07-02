<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$.ajax({
			url:"${pageContext.request.contextPath}/page.mem", type:"get", dataType:"json"
			}).done(function(resp){
				console.log(resp);
		        console.log(resp.id);
		        console.log(resp.pw);
		        console.log(resp.reg_date)
		        $("#reg_date").text("Member Since " + resp.reg_date);
		        });
		})
</script>
</head>
<body>
	<div id="reg_date" name="reg_date"></div>
	<div></div>
	<div></div>
</body>
</html>