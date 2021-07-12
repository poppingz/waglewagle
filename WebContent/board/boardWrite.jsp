<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<script>
  $(function() {
      $("#toList").on("click", function() {
            location.href = "javascript:history.back()";
      })
      
      
  
	let badwordRegex = /썅년|썅놈|병신|10쌔기|10쎄|10알|10창|10탱|18것|18넘|18년|18노|18놈|18럼|18롬|18새|18새끼|18색|18세끼|18세리|18섹|18쉑|18스|18아|c파|c팔|fuck|ㄱㅐ|ㄲㅏ|ㄲㅣ|ㅅㅂㄹㅁ|ㅅㅐ|ㅆㅂㄹㅁ|ㅆㅍ|ㅆㅣ|ㅆ앙|ㅍㅏ|凸|ㅗ|갈보|갈보년|같은년|같은뇬|개같은|개구라|개년|개놈|개뇬|개랄|개보지|개뻥|개새|개새기|개새끼|개새키|개색기|개색끼|개색키|개색히|개섀끼|개세|개세끼|개세이|개소리|개쑈|개쇳기|개수작|개쉐|개쉐리|개쉐이|개쉑|개쉽|개스끼|개시키|개십새기|개십새끼|개쐑|개씹|개아들|개자슥|개자지|개접|개좆|개좌식|개허접|걔새|걔수작|걔시끼|걔시키|걔썌|걸레|게색기|게색끼|광뇬|구녕|그년|그새끼|놈현|뇬|눈깔|뉘미럴|니귀미|니기미|니미|니미랄|니미럴|니미씹|니아배|니아베|니아비|니어매|니어메|니어미|닝기리|닝기미|대가리|뎡신|도라이|돈놈|돌아이|돌은놈|되질래|뒈져|뒈져라|뒈진|뒈진다|뒈질|뒤질래|등신|디져라|디진다|디질래|딩시|따식|때놈|또라이|똘아이|뙈놈|뙤놈|뙨넘|뙨놈|띠바|띠발|띠불|띠팔|메친넘|메친놈|미췬|미친|미친넘|미친년|미친놈|미친새끼|미친스까이|미틴|미틴넘|미틴년|미틴놈|바랄년|병자|뱅마|뱅신|벼엉신|병쉰|병신|부랄|부럴|불알|불할|붕가|붙어먹|뷰웅|븅|븅신|빌어먹|빙시|빙신|빠가|빠구리|빠굴|빠큐|뻐큐|뻑큐|뽁큐|상넘이|상놈을|상놈의|상놈이|새갸|새꺄|새끼|새새끼|새키|색끼|생쑈|세갸|세꺄|세끼|섹스|쉐|쉐기|쉐끼|쉐리|쉐에기|쉐키|쉑|쉬발|쉬밸|쉬벌|쉬뻘|쉬펄|쉽알|스패킹|스팽|시궁창|시끼|ㅅㅂ|ㅆㅂ|ㄱㅅㄲ|ㅂㅅ|ㄳㄲ|ㅄ|시댕|시뎅|시랄|시발|시벌|시부랄|시부럴|시부리|시불|시브랄|시팍|시팔|시펄|신발끈|심발끈|심탱|십8|십라|십새|십새끼|십세|십쉐|십쉐이|십스키|십쌔|십창|십탱|싶알|쌉년|쌍넘|쌍년|쌍놈|쌍뇬|쌔끼|쌕|쌴년|썅|썅년|썅놈|써벌|쎄꺄|쎄엑|쒸벌|쒸뻘|쒸팔|쒸펄|쓰바|쓰박|쓰발|쓰벌|쓰팔|씁새|씁얼|씌파|씨8|씨끼|씨댕|씨뎅|씨바|씨바랄|씨박|씨발|씨방|씨방새|씨방세|씨밸|씨뱅|씨벌|씨벨|씨봉|씨봉알|씨부랄|씨부럴|씨부렁|씨부리|씨불|씨붕|씨브랄|씨빠|씨빨|씨뽀랄|씨앙|씨파|씨팍|씨팔|씨펄|씸년|씸뇬|씸새끼|씹같|씹년|씹뇬|씹보지|씹새|씹새기|씹새끼|씹새리|씹세|씹쉐|씹스키|씹쌔|씹이|씹자지|씹질씹창|씹탱|씹퇭|씹팔|씹할|씹헐|아가리|아갈|아갈이|아갈통|아구창|아구통|아굴|엄창|엠병|여물통|염병|엿같|옘병|옘빙|욤병|은년|을년|이년|이새끼|이새키|임마|자슥|잡것|잡넘|잡년|잡놈|저년|저새끼|접년|젖밥|조까|조까치|조또|조빠|조진다|조찐|조질래|존나|존나게|존니|존만|존만한|좀물|좁년|좁밥|좃까|좃또|좃만|좃밥|좃찐|좆같|좆까|좆나|좆또|좆만|좆밥|좆이|좆찐|좇같|좇이|쥐랄|쥐롤|지랄|지럴|지롤|지미랄|짜식|짜아식|쪼다|쫍빱|찌랄|창녀|캐년|캐놈|캐스끼|캐스키|캐시키|팔럼|퍽큐|호로|호로놈|호로새끼|호로색|호로쉑|호로스까이|호로스키|후래자식|후레/;
		$("#toWrite").on("click", function() {
			if($("#nickname").val() == ""){
				alert("닉네임을 입력하세요.")
				return false;
			}else if($("#title").val() == null){
				alert("제목을 입력하세요.")
				return false;
			}else if($("#contents").val() == ""){
				alert("내용을 입력하세요.")
				return false;
			}

			let badwordResult = badwordRegex.test($("#summernote").val());
			console.log(badwordResult);

			if (badwordResult) {
				alert("금지어를 사용하셨습니다. 반성하세요.")
				return false;
			} else {
				$("#frm").submit();
			}
		})

	});
</script>

<style>
body{
	padding-top:20px;
}
.container{
	width:1500px;
}

</style>
</head>
<body>
	<div class="container">
	<form action="${pageContext.request.contextPath}/insert.board" method="post" enctype="multipart/form-data" id="frm">

		<div class="row">
				<div class="card-header bg-transparent border-secondary text-secondary col-12">
					<h4 class="card-title" id="title">글 쓰기</h4>
				</div>
				<div class="col-3"><br>
					<select class="form-control" name="category" id="srch_item" required>
						<option value="" selected>선택하세요.</option>
						<option value="1">패션</option>
						<option value="2">동물</option>
						<option value="3">스포츠</option>
					</select>
				</div>
				<div class="col-9"><br>
					<input type=text class="form-control mb-2" name="nickname"
						placeholder="닉네임" id="nickname" required>
				</div>
				<div class="col-12">
					<input type=text class="form-control mb-2" placeholder="제목을 입력하세요."
						name="title" id="title">
				</div>
				<div class="col-12" style="height: 600px"><br>
					<textarea id="summernote" name="contents" id="contents"></textarea>
				</div>

				<div class="col-12 btns" align="right">
					<button type="submit" class="btn btn-outline-secondary"
						id="toWrite">글 쓰기</button>
					<button type="button" class="btn btn-outline-secondary" id="toList">목록으로</button>
				</div>

		</div>
	</form>
	</div>

	<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        height: 500,
        callbacks:{
        	onImageUpload: function(files) {
        		let editor = this; // SummerNote 인스턴스의 주소를 editor 변수에 저장
        		let file = files[0]; //업로드 해야하는 파일 인스턴스
        		
        		let form = new FormData();
        		form.append("abc",file); // "" 안은 name값 
        		
        		$.ajax({
        			data:form,
        			type:"post",
        			url:"${pageContext.request.contextPath}/upload.file",
        			contentType:false,
        			processData:false
        		}).done(function(resp){
        			$(editor).summernote('insertImage',"${pageContext.request.contextPath}"+resp)
        			// editor 인스턴스의 insertImage  기능으로 이미지를 화면에 출력
        		});
        	}
        }
      });
      
      
      
    </script>
</body>
</html>