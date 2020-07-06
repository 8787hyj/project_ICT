<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  p{
  	margin:0;
  	padding:0;
  	font-size:14px;
  }
  h2{
  	margin-top:10px;
  }
  </style>
  <body>

    <!-- 시작 -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath }/assets/images/bg_5.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>book Board <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">책방</h1>
          </div>
        </div>
      </div>
    </section>
    
	<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 ftco-animate">
			<div class="row">
			
				<table style="border: 1px solid #48BAE4; height:auto; width:100px;" >
					<c:if test="${boardList.hasNoBoard()}">
						<tr>
							<td colspan="4">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
						
					<c:forEach var="board" items="${list}">
					
					<div class="col-md-4 d-flex">
	    				<div class="book-wrap">
	    					<div class="text px-4 py-3 w-100 board-list">
	    						<p class="mb-2">
		    						<p>${board.boardNo }</p> 
		    						<p>${board.boardRegdate }</p>
		    						<p>${board.memberId }</p>
	    						</p>
	    						<h2><a href="detail?no=${board.boardNo}">${board.boardTitle }</a></h2>
	    						<span class="position">${board.boardContent}</span>
	    					</div>
	    				</div>
	    			</div>
						
					</c:forEach>
					
				</table>
   			</div>
		  <div class="row mt-5">
			<div class="col">
		      <div class="block-27">
		        <c:if test="${boardList.hasBoard()}">
		          <ul>
		          	<c:if test="${boardList.boardStartPage > 5}">
		            <li><a href="list?pageNo=${boardList.boardStartPage - 5}">&lt;</a></li>
		            </c:if>
		            <c:forEach var="pNo" begin="${boardList.boardStartPage}" end="${boardList.boardEndPage}">
		            <li class="active"><a href="list?pageNo=${pNo}">${pNo}</a></li>
		            </c:forEach>
		            <c:if test="${boardList.boardEndPage < boardList.boardTotalPages}">
		            <li><a href="list?pageNo=${boardList.boardStartPage + 5}">&gt;</a></li>
		       		</c:if>
		          </ul>
		        </c:if>  
		       </div>
	        </div>
		</div>
   </div> <!-- .col-md-8 -->

   <div class="col-lg-3 sidebar pl-lg-3 ftco-animate">
     <div class="sidebar-box">
       <form action="#" class="search-form">
         <div class="form-group">
           <span class="fa fa-search"></span>
           <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
         </div>
       </form>
     </div>
     <div class="sidebar-box ftco-animate">
       <div class="categories">
         <h3>Board</h3>
         <ul>
          <li><a href="${pageContext.request.contextPath }/board/write">글쓰기 <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Board main <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Romance <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Contemporary <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Dystopian <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Mystery <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Horror <span class="fa fa-chevron-right"></span></a></li>
          <li><a href="#">Thriller <span class="fa fa-chevron-right"></span></a></li>
        </ul>
       </div>
     </div>

     
   </div>

        </div>
      </div>
    </section> <!-- .section -->
    
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
  <script src="${pageContext.request.contextPath }/assets/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
  <%@ include file="../footer.jsp" %>  
    
  </body>
</html>