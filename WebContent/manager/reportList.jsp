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
    </style>
</head>

<body>
    <div class="container">
        <div class="logo">
            <img src="memberpageLogo.png">   
        </div>
        <div class="margin1"></div>
        <div class="row body">
            <div class="col-3 left">
                <div class="col-12 card" align=center>
                    <div class="card-body">
                        관리자 페이지<br>
                        <br>
                        <button type="button" class="btn btn-outline-warning">Logout</button>
                    </div>
                </div>

                <div class="col-12 navi">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a href>회원관리</a></li> <!-- 나중에 시간될때 만들기 -->
                        <li class="list-group-item"><a href>신고내역</a></li>
                        <li class="list-group-item"><a href>블랙리스트</a></li> <!-- 나중에 시간될때 만들기-->
                        <li class="list-group-item"><a href>홈으로</a></li> <!-- index 다 만들어지면 index로 링크걸기 -->
                    </ul>
                </div>
            </div>

            <div class="col-9 right">
                <div class="guide">
                    <h6>● 관리자 페이지 > 신고내역</h6>
                </div>
                <div class="margin2"></div>
                <div class="search">
                    <input type="text" id="inputID" name="inputID" placeholder="찾고 싶은 회원의 ID를 입력하세요">
                    <button type="button" class="btn btn-warning" id="searchBtn">search</button>
                </div>
                <div class="margin3"></div>
                <div class="row memberListMain">
                    <div class="col-2">ID</div>
                    <div class="col-2">Board</div>
                    <div class="col-4">Title</div>
                    <div class="col-4">Reason</div>
                </div>
                <div class="row memberList">       
                    <div class="col-2">Tom_123</div>
                    <div class="col-2">12</div>
                    <div class="col-4" id="titleMove"><a href>여러분 이거 제가 그린 그림이예요~~~ 그림평가좀ㅋㅋㅋㅋㅋㅋ</a></div>
                    <div class="col-4">저작권 침해, 남의 그림 도용, 사기</div>                    
                </div>
            </div>
        </div>
    </div>
</body>

</html>