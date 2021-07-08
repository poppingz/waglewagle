<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Modify</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<style>
body{
	padding-top:20px;
}
.container {width: 1500px;}
</style>

<script>
  $(function() {
      $("#toList").on("click", function() {
            location.href = "${pageContext.request.contextPath}/List.board?cpage=1";
      })
      
  });
</script>
</head>

<body>

	<div class="container">
		<form action="${pageContext.request.contextPath}/modify.board"
			method="post">

			<div class="row">
					<div class="card-header bg-transparent border-secondary text-secondary col-12">
						<h5 class="card-title" id="title">글 수정하기</h5>
					</div>

					<div class="col-3"><br>
						글 번호 <input type="text" class="form-control mb-2" name="board_num"
							value="${Board_Context.board_num}">

					</div>
					<div class="col-9"><br>
						닉네임 <input type=text class="form-control mb-2" name="nickname"
							value="${Board_Context.nickname}">
					</div>


					<div class="col-12">
						제목 <input type=text class="form-control mb-2" name="title"
							value="${Board_Context.title}">
					</div>

					<div class="col-12" style="height: 570px">
						<textarea id="summernote" name="contents">${Board_Context.contents}</textarea>
					</div>

					<div class="col-12 btns" align="right">
						<button type="submit" class="btn btn-outline-secondary"
							id="toWrite">수정하기</button>
						<button type="button" class="btn btn-outline-secondary"
							id="toList">목록으로</button>
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