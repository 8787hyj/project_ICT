<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("정상적인 경로를 통해 다시 접근해 주십시오.");
  document.location.href="${pageContext.request.contextPath}/";
 </script>
<%
  return;
 }
%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/article.css">
</head>
<body>
	<!-- <p>게시글 수정하기</p> -->
		 <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_5.jpg');" >
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="${pageContext.request.contextPath}/">Home <i class="fa fa-chevron-right"></i></a></span> <span class="mr-2"><a href="${pageContext.request.contextPath}/article/list">Article <i class="fa fa-chevron-right"></i></a></span></p>
            <h1 class="mb-0 bread">게시글 수정</h1>
          </div>
        </div>
      </div>
    </section>

 <form action="articlemodifydo" method="post">

<table border="1">
		<tr>
			<td>번호</td> 
			<td><input type="text" name="no" readonly="readonly"
				value="${articleModify.articleNo}"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td name="memberId">${articleModify.memberId}</td>
		</tr>
		<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${articleModify.title}" id="title" maxlength="25"></td>
		</tr>

		<tr>
			<td>내용</td>
			<td><textarea name="content" id="content" rows=15 cols=40 style="text-align:center;">${articleModify.content}</textarea></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="수정하기" class="commentWriteButton" id="submit"></td>
		
		</tr>
	</table>
	</form>
	<script>
		$(document).ready(function() {
			$("#submit").click(function() {
				if ($("#title").val().length == 0) {
					alert("제목을 입력하세요.");
					$("#title").focus();
					return false;
				}
				if ($("#content").val().length == 0) {
					alert("내용을 입력하세요.");
					$("#content").focus();
					return false;
				}
			});
		});
	</script>

	 <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/assets/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<%@ include file="../footer.jsp" %>
</body>
</html>