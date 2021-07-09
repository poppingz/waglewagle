<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W.W indexDetail</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>

.logo {
	text-align: center;
}
.board {
	width: 1100px;
}

#hr {
	height: 1px;
	background-color: rgb(148, 148, 148);
}

span {
	color: gray;
	width: 3px;
}

/* 댓글 부분 */
#userid {
	border: 1px solid gray;
	width: 200px;
	margin-bottom: 5px;
}

#con {
	width: 1074px;
	height: 100px;
	border: 1px solid gray;
	overflow-y: scroll;
}

#btn {
	margin: 10px;
}

/* 리플 부분 */

#box{border-top: 1px solid gray; width: 1100px; padding: 5px;}
#replyhead{height: 50px; text-align: left;}
#con2{text-align: left;}
.row{margin-left:0;}
</style>

<script>

	$(function() {
		// 뒤로가기
     	$("#back").on("click", function(){
        	location.href = "${pageContext.request.contextPath}/select.board?category=${Board_Context.category}"
      	})
      	
      	// 수정하기
      	$("#modify").on("click", function(){
         	location.href = "${pageContext.request.contextPath}/modifyView.board?board_num=${Board_Context.board_num}";
		})
		
		// 신고하기
      	$("#report").on("click", function(){
      		window.open("${pageContext.request.contextPath}/manager/reportForm.jsp?title=${Board_Context.title}&board_num=${Board_Context.board_num}&login=${Board_Context.id}","","width=500, height=500"); 
         	location.href = "${pageContext.request.contextPath}/report.board?board_num=${Board_Context.board_num}";
		})
		
		// 삭제하기
      	$("#delete").on("click", function(){
    		let result = confirm("게시글을 삭제하시겠습니까?");
    			if(result){
    				location.href = "${pageContext.request.contextPath}/delete.board?board_num=${Board_Context.board_num}&&category=${Board_Context.category}";
    			}else{
    				return false;
    			}

		})
		
		// 댓글 삭제하기
		$(".cdelete").on("click",function(){
			let result = confirm("댓글을 삭제하시겠습니까?");
			if(result) {
				$("#replyDelete").submit();
			}else{
				return false;
			}
		})
		
		let badwordRegex = /썅년||썅놈||병신||10쌔기||10쎄||10알||10창||10탱||18것||18넘||18년||18노||18놈||18럼||18롬||18새||18새끼||18색||18세끼||18세리||18섹||18쉑||18스||18아||c파||c팔||fuck||ㄱㅐ||ㄲㅏ||ㄲㅣ||ㅅㅂㄹㅁ||ㅅㅐ||ㅆㅂㄹㅁ||ㅆㅍ||ㅆㅣ||ㅆ앙||ㅍㅏ||凸||ㅗ||갈보||갈보년||같은년||같은뇬||개같은||개구라||개년||개놈||개뇬||개랄||개보지||개뻥||개새||개새기||개새끼||개새키||개색기||개색끼||개색키||개색히||개섀끼||개세||개세끼||개세이||개소리||개쑈||개쇳기||개수작||개쉐||개쉐리||개쉐이||개쉑||개쉽||개스끼||개시키||개십새기||개십새끼||개쐑||개씹||개아들||개자슥||개자지||개접||개좆||개좌식||개허접||걔새||걔수작||걔시끼||걔시키||걔썌||걸레||게색기||게색끼||광뇬||구녕||그년||그새끼||놈현||뇬||눈깔||뉘미럴||니귀미||니기미||니미||니미랄||니미럴||니미씹||니아배||니아베||니아비||니어매||니어메||니어미||닝기리||닝기미||대가리||뎡신||도라이||돈놈||돌아이||돌은놈||되질래||뒈져||뒈져라||뒈진||뒈진다||뒈질||뒤질래||등신||디져라||디진다||디질래||딩시||따식||때놈||또라이||똘아이||뙈놈||뙤놈||뙨넘|뙨놈||띠바||띠발||띠불||띠팔||메친넘||메친놈||미췬||미친||미친넘||미친년||미친놈||미친새끼||미친스까이||미틴||미틴넘||미틴년||미틴놈||바랄년||병자||뱅마||뱅신||벼엉신||병쉰||병신||부랄||부럴||불알||불할||붕가||붙어먹||뷰웅||븅||븅신||빌어먹||빙시||빙신||빠가||빠구리||빠굴||빠큐||뻐큐||뻑큐||뽁큐||상넘이||상놈을||상놈의||상놈이||새갸||새꺄||새끼||새새끼||새키||색끼||생쑈||세갸||세꺄||세끼||섹스||쉐||쉐기||쉐끼||쉐리||쉐에기||쉐키||쉑||쉬발||쉬밸||쉬벌||쉬뻘||쉬펄||쉽알||스패킹||스팽||시궁창||시끼||ㅅㅂ||ㅆㅂ||ㄱㅅㄲ||ㅂㅅ||ㄳㄲ||ㅄ||시댕||시뎅||시랄||시발||시벌||시부랄||시부럴||시부리||시불||시브랄||시팍||시팔||시펄||신발끈||심발끈||심탱||십8||십라||십새||십새끼||십세||십쉐||십쉐이||십스키||십쌔||십창||십탱||싶알||쌉년||쌍넘||쌍년||쌍놈||쌍뇬||쌔끼||쌕||쌴년||썅||썅년||썅놈||써벌||쎄꺄||쎄엑||쒸벌||쒸뻘||쒸팔||쒸펄||쓰바||쓰박||쓰발||쓰벌||쓰팔||씁새||씁얼||씌파||씨8||씨끼||씨댕||씨뎅||씨바||씨바랄||씨박||씨발||씨방||씨방새||씨방세||씨밸||씨뱅||씨벌||씨벨||씨봉||씨봉알||씨부랄||씨부럴||씨부렁||씨부리||씨불||씨붕||씨브랄||씨빠||씨빨||씨뽀랄||씨앙||씨파||씨팍||씨팔||씨펄||씸년||씸뇬||씸새끼||씹같||씹년||씹뇬||씹보지||씹새||씹새기||씹새끼||씹새리||씹세||씹쉐||씹스키||씹쌔||씹이||씹자지||씹질씹창||씹탱||씹퇭||씹팔||씹할||씹헐||아가리||아갈||아갈이||아갈통||아구창||아구통||아굴||엄창||엠병||여물통||염병||엿같||옘병||옘빙||욤병||은년||을년||이년||이새끼||이새키||임마||자슥||잡것||잡넘||잡년||잡놈||저년||저새끼||접년||젖밥||조까||조까치||조또||조빠||조진다||조찐||조질래||존나||존나게||존니||존만||존만한||좀물||좁년||좁밥||좃까||좃또||좃만||좃밥||좃찐||좆같||좆까||좆나||좆또||좆만||좆밥||좆이||좆찐||좇같||좇이||쥐랄||쥐롤||지랄||지럴||지롤||지미랄||짜식||짜아식||쪼다||쫍빱||찌랄||창녀||캐년||캐놈||캐스끼||캐스키||캐시키||팔럼||퍽큐||호로||호로놈||호로새끼||호로색||호로쉑||호로스까이||호로스키||후래자식||후레/;
		$("#btn").on("click", function() {

			let badwordResult = badwordRegex.test($("#summernote").val());
			console.log(badwordResult);

			if (badwordResult) {
				alert("금지어를 사용하셨습니다. 반성하세요.")
				return false;
			} else {
				$("#comFrm").submit();
			}
		})
		
		
	})

</script>
</head>

<body>
	<div class="container">
		<div class="logo">
			<img src="logo.png">
		</div>

		<br>

		<div class="board" id="board">
			<div class="viewTitle" id="viewTitle" align=left>
				<h3>${Board_Context.title}</h3>
			</div>

			<hr id="hr">

			<div class="row etcBox">
				<div class="col-6" align=left>
					${Board_Context.nickname} <span>l</span>
					${Board_Context.write_date}
				</div>

				<div class="col-6" align=right>
					조회수 : ${Board_Context.view_count} <span>l</span> 신고수 :
					${Board_Context.report}
				</div>
			</div>

			<hr>

			<!-- 작성글 -->
			<div class="content" id="content" align=left>
				${Board_Context.contents}</div>

			<hr>
			<!-- 게시글 삭제 권한 -->
			<c:choose>
				<c:when test="${login.id==Board_Context.id}">
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="delete">삭제</button>
						<button type="button" class="btn btn-outline-secondary"
							id="modify">수정</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:when>
				<c:when test="${login.id_num==1}">
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="delete">삭제</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="button" align=right>
						<button type="button" class="btn btn-outline-secondary"
							id="report">신고</button>
						<button type="button" class="btn btn-dark" id="back">돌아가기</button>
					</div>
				</c:otherwise>
			</c:choose>

			<hr id="hr">

			<!-- 댓글 -->
			<div class="col-12" align="left">
				<b>댓글</b>
			</div>

			<hr>

			<!-- 댓글 작성 -->
			<form action="${pageContext.request.contextPath}/insert.comment?parent_board=${Board_Context.board_num}"
				method="post" id="comFrm">
				<div class="row comment">

					<div class="col-12" align=left>
						<input type="text" id="userid" name="nickname" required>
					</div>

					<div class="col-12" align=left>
						<input type="text" id="con" name="comments" required>
					</div>

					<div class="col-12" align=right>
						<button class="btn btn-outline-info" id="btn">등록</button>
					</div>

				</div>
			</form>

			<!-- 리플 -->
			<form action="${pageContext.request.contextPath}/delete.comment?parent_board=${Board_Context.board_num}"
				method="post" id="replyDelete">
				<c:forEach var="i" items="${comments}">
					<c:choose>
						<c:when test="${login.id==i.id}">
							<div class="row comment" id="box">
								<div class="col-12" id="replyhead">${i.nickname}님의 댓글 <button id="cdelete" class="btn btn-outline-dark btn-sm cdelete">X</button>
								</div>
								<div class="col-12" id="con2">${i.comments}</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row comment" id="box">
								<div class="col-12" id="replyhead">${i.nickname}님의 댓글</div>
								<div class="col-12" id="con2">${i.comments}</div>
							</div>
						</c:otherwise>
					</c:choose>
					<input type="text" name="comm_num" value="${i.comm_num}"
						style="visibility: hidden;">
					<input type="text" name="parent_board" value="${i.parent_board}"
						style="visibility: hidden;">
				</c:forEach>
			</form>

			<hr id="hr">

		</div>



	</div>

</body>

</html>