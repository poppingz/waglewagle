<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample Board Detail</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script></script>
<style>
* {
	box-sizing: border-box;
}

#board {
	border: 1px solid black;
	width: 1000px;
	height: 700px;
	margin: auto;
	overflow: auto;
}

/* nickname, wirtedate, viewcount */
#etcBox {
	border: 1px solid black;
	margin: 0px;
	padding: 0px;
}

#etcBox>#nickname {
	float: left;
	width: 50%;
	border: 1px solid black;
}

#etcBox>#writedate {
	float: left;
	width: 25%;
	border: 1px solid black;
}

#etcBox>#count {
	float: left;
	width: 24%;
	border: 1px solid black;
}

/*boardcontext*/
#contents {
	border: 1px solid black;
	margin-top: 3%;
	height: 82%;
}

/* boardFooter */
#boardFooter {
	text-align: center;
}
/* 댓글 작성 */
#replybox {
	border: 1px solid black;
	width: 800px;
	margin: auto;
	height: 130px;
}
/* 댓글 작성창 헤더부분 */
#replyuser {
	border: 1px solid black;
	height: 30px;
	background-color: rgba(95, 95, 95, 0.514);
}

#replyuser>input {
	border: 1px solid black;
	margin-top: 7px;
}

#replycon {
	border: 1px solid black;
	height: 100px;
	width: 100%;
	float: left;
}
/* 댓글 내용부분 */
#con {
	border: 1px solid black;
	height: 100px;
	width: 80%;
	float: left;
	overflow-y: auto;
}

#btn {
	border: 1px solid black;
	height: 100px;
	width: 20%;
	float: left;
}

#btn>button {
	border: 1px solid black;
	height: 100%;
	width: 101%;
}

/* 리플 작성시 보이는 화면 */
#box {
	border: 1px solid black;
	height: 160px;
	padding: 1%;
}

#reply {
	width: 800px;
	margin: auto;
	height: 166px;
}

#replycon2 {
	width: 80%;
	float: left;
}

#replyhead {
	margin: auto;
	width: 615px;
	height: 20px;
	background-color: rgba(95, 95, 95, 0.514);
}

#con2 {
	border: 1px solid black;
	margin: auto;
	width: 615px;
	height: 122px;
	overflow: auto;
}

#delbtn {
	float: left;
	height: 100%;
	width: 159.6px;
}

.delete {
	margin-top: 50px;
	margin-left: 43px;
	height: 50px;
	width: 70px;
}

#userid {
	border: 1px solid black;
	background-color: white;
	width: 150px;
	margin-left: 10px;
	margin-top: 6px;
}
</style>

<script>
	$(function(){
		$("#back").on("click", function(){
			location.href = "${pageContext.request.contextPath}/select.board?category=${Board_Context.category}"
		})
		
		$("#modify").on("click", function(){
			location.href = "${pageContext.request.contextPath}/modifyView.board?board_num=${Board_Context.board_num}";
		})
		
		$("#report").on("click", function(){
			location.href = "${pageContext.request.contextPath}/report.board?board_num=${Board_Context.board_num}";
		})
		
		$("#delete").on("click", function(){
			location.href = "${pageContext.request.contextPath}/delete.board?board_num=${Board_Context.board_num}&&category=${Board_Context.category}";
		})
		
        $("#btn").on("click",function(){

	        let a = $("<div id=box><div id=replycon2><div id=replyhead>"+$("#userid").html()+" 님의 글</div><div id=con2>"+$("#con").html()+"</div></div><button class=delete>삭제</button></div>");
    	    $("#reply").append(a);
        	$("#con").html("");
            $("#userid").html("");
                
            })

       $(document).on("click", ".delete", function(e) {
            $(this).parent().remove();
                
          	})
		
	})
</script>

</head>
<body>
	<div id="board">
		<input type="text" name="board_num" value="${Board_Context.board_num}">
		<div id="viewTitle">
			<h1>${Board_Context.title}</h1>
		</div>
		<div id="etcBox">
			<div id="nickname">${Board_Context.id}
				${Board_Context.nickname}</div>
			<div id="writedate">${Board_Context.write_date}</div>
			<div id="count">조회수: ${Board_Context.view_count} 신고수:
				${Board_Context.report}</div>
		</div>
		<div id="contents">${Board_Context.contents}</div>
		<div id="replybox">
			<div id="replyuser">
				<div id="userid" contenteditable="true"></div>
			</div>
			<div id="replycon">
				<div id="con" contenteditable="true"></div>
				<div id="btn">
					<button>Reply</button>
				</div>
			</div>
		</div>
		<br>
		<hr>
		<div id="reply"></div>
		<div id="boardFooter">
			<button id="delete">삭제</button>
			<button id="modify">수정</button>
			<button id="report">신고</button>
			<button id="back" class="btn btn-danger">뒤로가기</button>
		</div>
	</div>
</body>
</html>