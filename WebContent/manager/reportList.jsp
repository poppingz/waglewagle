<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>W.W ReportList Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {  box-sizing: border-box; }
        .container{overflow: hidden;}
        /* 헤더 */
        .logo { text-align: center;}
        .margin1{height: 50px;}

        /* 좌측 UI - 로그아웃, 메뉴 */
        .navi{padding-top: 50px;}
        .list-group-item>a{color: gray;text-decoration: none;}
        .list-group-item>a:hover{color: black;}

        /* 우측 UI - 신고내역 명단 */
        .margin2{height: 20px;}
        .margin3{height: 20px;}
        input{width: 300px; height: 42px;} /*검색창*/
        #searchBtn{height: 100%;} /*검색버튼*/
        .memberListMain{ /*신고내역컬럼*/
            border-top: 2px solid gray; 
            border-bottom: 1px solid gray;
            height: 70px; 
            line-height: 60px;
        }
        .memberList{ /*신고내역명단*/
            border-bottom: 1px solid gray;
            line-height: 45px;
        }
        .memberList>#titleMove>a{color: black; text-decoration: none;} /*신고게시물이동*/
        .memberList>#titleMove>a:hover{color: gray;}
        #delBtn{height:35px; width:35px; line-height:10px; margin-top:10px}
    </style>
    <script>
    	$(function(){
    		// 로그아웃
    		$("#logout").on("click",function(){
    			location.href = "${pageContext.request.contextPath}/logout.mem";
    		})
    		
    		// 신고내역 삭제
    		$("#delBtn").on("click",function(){
    			confirm("정말 삭제하시겠습니까?");
    		})
    	})
    </script>
</head>

<body>
    <div class="container">
        <div class="logo">
            <img src="logo.png">   
        </div>
        <div class="margin1"></div>
        <div class="row body">
            <div class="col-3 left">
                <div class="col-12 card" align=center>
                    <div class="card-body">
                        ${login.id}님의<br> 관리자 페이지<br>
                        <br>
                        <button type="button" class="btn btn-outline-danger" id="logout">Logout</button>
                    </div>
                </div>

                <div class="col-12 navi">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a href="reportList.jsp">신고내역</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/main2.jsp">홈으로</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-9 right">
                <div class="guide">
                    <h6>● 관리자 페이지 > 신고내역</h6>
                </div>
                <div class="margin2"></div>
                <!-- 검색 기능 -->
                <form action="${pageContext.request.contextPath}/reportList.rep" method="get">
                	<div class="search">
                    	<input type="text" id="inputID" name="inputID" placeholder="찾고 싶은 회원의 ID를 입력하세요">
                    	<button type="submit" class="btn btn-danger" id="searchBtn">search</button>
                	</div>
                </form>
                <div class="margin3"></div>
                <div class="row memberListMain">
                    <div class="col-2">ID</div>
                    <div class="col-1">Board</div>
                    <div class="col-4">Title</div>
                    <div class="col-4">Reason</div>
                    <div class="col-1">Del</div>
                </div>
                <!-- 신고내역 목록 출력 -->
                <c:forEach var="i" items="${reportList }">
                	<form action="${pageContext.request.contextPath}/reportDelete.rep?list=${i.report_num}" method="post">
                		<div class="row memberList">       
                    		<div class="col-2">${i.id }</div>
                    		<div class="col-1">${i.board_num }</div>
                    		<div class="col-4" id="titleMove"><a href="${pageContext.request.contextPath}/boardView.board?board_num=${i.board_num }">${i.title }</a></div>
                    		<div class="col-4">${i.reason}</div>
                    		<div class="col-1"><button id="delBtn">X</button></div>
                		</div>
                	</form>
                </c:forEach>
            </div>
        </div>
    </div>
</body>

</html>