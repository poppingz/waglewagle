<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <style>
  body {
    position: relative;
  }
  #section1{
      height: 800px;
      width: 100%;
      background: linear-gradient(to left, #ffdde1, #ee9ca7, #a7bfe8, #6190e8);
      
  }
  #imgBox{width: 700px; margin: auto; padding-top: 150px;}
  #txtBox{text-align: center;}
  </style>
  
  
  <script>
   $(function(){
      $("#board1").on("click", function(){
         location.href = "${pageContext.request.contextPath}/select.board?category=1"
      })
      
      $("#board2").on("click", function(){
         location.href = "${pageContext.request.contextPath}/select.board?category=2"
      })
      
      $("#board3").on("click", function(){
         location.href = "${pageContext.request.contextPath}/select.board?category=3"
      })
   })
</script>
  
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-12 col-8">
      <div id="section1" class="bg-success">    
         <div id="imgBox">
             <img src="logo.png" alt="">
         </div>
         <div id="txtBox">
             <h1>${result.id}님 환영합니다.</h1>
         </div>
      </div>
      <div id="section2" class="bg-warning"> 
        <h1>Section 1</h1>        
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
        <input type="button"  id="board1" class="btn btn-primary" value="GO">               
      </div>        
      <div id="section3" class="bg-secondary">         
        <h1>Section 3</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
       <input type="button"  id="board2" class="btn btn-primary" value="GO"> 
      </div>
      <div id="section4" class="bg-danger">         
        <h1>Section 4</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      <input type="button"  id="board3" class="btn btn-primary" value="GO"> 
      </div>      
   
    </div>
  </div>
</div>
</body>
</html>