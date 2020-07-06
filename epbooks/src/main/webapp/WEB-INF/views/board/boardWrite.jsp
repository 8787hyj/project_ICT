<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="../header.jsp" %> 
<!DOCTYPE html>
<html>
  <head>
    <title>Publishing Company - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
  </head>
  <style>
  	table{
  		width:100%;
  	}
  	.full{
  		width:100%;
  	}
  	.btn-box{
  		text-align:right;
  		margin-top:20px;
  	}
  	td{
  		padding:10px 0;
  	}
  </style>
  <body>

    <!-- 시작 -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath }/assets/images/bg_5.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="${pageContext.request.contextPath }/">Home <i class="fa fa-chevron-right"></i></a></span> <span>Blog <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">글 쓰기</h1>
          </div>
        </div>
      </div>
    </section>
		
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10">	
		      		<form action="writedo" name="frm1" method="post">
					<table border="0">
					
						<!-- 제목 -->
						<tr>
							<td>제목</td>
							<td><input type="text" class="boardTitle full form-control" id="boardTitle" name="boardTitle" maxlength="30"/></td>
						</tr>
						<!-- 내용 -->
						<tr>
							<td>내용</td>
							<td>
								<textarea class="boardContent full form-control" id="boardContent" name="boardContent" onkeyup="chkword(this, 200)" cols="30" rows="6"></textarea>
								<span id="counter" class="bytes" >###</span>
							</td>
						</tr>
					</table>
					
					
						<!-- 등록하기 -->
						<div class="btn-box">
						<input type="submit" class="btn btn-primary" id="submit" value="등록하기"/>
						<input type="reset" class="btn btn-secondary" value="취소"/>
						</div>
						
						</form>
					</div>
			</div>
		</div>
	</section>		


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
  <svg class="circular" width="48px" height="48px">
  <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
  <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
  </svg>
  </div>


  <script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/assets/js/google-map.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
  
  <!-- 게시글 작성 js -->
  <script src="${pageContext.request.contextPath }/assets/js/script/board/boardWrite.js"></script>
  
  <%@ include file="../footer.jsp" %>        
  </body>
</html>