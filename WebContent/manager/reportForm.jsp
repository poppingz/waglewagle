<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>W.W Member ReportForm</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
* {
	box-sizing: border-box;
}

.card {
	margin: auto;
	width: 500px;
	overflow: hidden;
}
/* 신고폼 타이틀 */
.reportTitle {
	height: 50px;
}

#reportText {
	text-align: center;
	line-height: 40px;
}

img {
	width: 180px;
	height: 35px;
}
/* 신고사유 적기 */
textarea {
	width: 458px;
	height: 130px;
}
</style>
<script>
	$(function(){
		opener.document.getElementById("viewTitle").value = document.getElementById("viewTitle2").value;
		
		//신고하기 버튼을 눌렀을 때
		$("#reportBtn").on("click",function(){
			if($("#reason").val() == ""){
				alert("신고사유를 입력해주시기 바랍니다.")
				return false;
			}
		})

		// 취소 버튼을 눌렀을 때
		$("#cencelBtn").on("click",function(){
			window.close();
		})	
		
		
	})

</script>
</head>

<body>
	<form action="${pageContext.request.contextPath}/reportGet.rep" method="post">
		<div class="card">
			<div class="card-body">
				<div class="row reportTitle">
					<div class="col-3">
						<h5 id="reportText">
							<b>신고하기</b>
						</h5>
					</div>
					<div class="col-9" align=right>
						<img src="logo.png">
					</div>
				</div>
				<hr>
				<div class="row reportUser">
					<div class="col-2 title1" align=right>
						<b>제 목 : </b>
					</div>
					<div class="col-10 title2">${param.title}</div>
				</div>
				<hr>
				<div class="reprotReason">
					<div class="reportReasonTitle">
						<b>신고사유 : </b>
					</div>
					<br>
					<div class="reportReason">
						<textarea placeholder="신고사유를 입력해주세요" id="reason" name="reason"></textarea>
					</div>
					<input type="hidden" value="${param.login}" name="login">
					<input type="hidden" value="${param.board_num}" name="board_num">
					<input type="hidden" value="${param.title}" name="title">
				</div>
				<hr>
				<div class="reportButton" align=center>
					<button class="btn btn-outline-danger" id="reportBtn">신고하기</button>
					<button type="button" class="btn btn-outline-warning"
						id="cencelBtn">취소</button>
				</div>
			</div>
		</div>
	</form>
</body>

</html>