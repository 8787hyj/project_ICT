<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Publishing Company - Free Bootstrap 4 Template by Colorlib</title>
    <style>
table{
	width:100%;
}
input[type=submit] {
	width:100%;
	padding:10px 12px;
    text-align: center;
    background-color: #95adbe;
    color: #fff;
    font-size: 15px;
    font-weight: 500;
    box-shadow: none !important;
    -webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-ms-border-radius: 3px;
	border-radius: 3px;
	border:0px;
}
input.full{
	width:100%;
}
td{
	padding:10px;
}
td.right{
	text-align:right;
}
    </style>
    <meta charset="utf-8">
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
  </head>
  <body>

    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_5.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="${pageContext.request.contextPath}/">Home <i class="fa fa-chevron-right"></i></a></span> <span>login<i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">admin</h1>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
		          <div class="heading-section text-center ftco-animate pb-4">
		          
		          		<form:form modelAttribute="adminCommand">
					    <form:errors />
					    
					    <table border="0">
					    <tr>
					        <td><spring:message code="adminId" /></td>
					        <td colspan="4"><form:input path="adminId" class="full form-control" /></td>
					        <form:errors path="adminId"/>
					    </tr>
					    <tr>
					    	<td><spring:message code="adminPassword" /></td>
					        <td colspan="4"><form:password path="adminPassword" class="full form-control" /></td>
					        <form:errors path="adminPassword"/>
					      </tr>
					    <tr>
					        <td colspan="5" class="right"><spring:message code="rememberAdminId" />
					        <form:checkbox path="rememberAdminId"/> 
					    </tr>
					    <tr>
					    	<td colspan="5"><input type="submit" value="<spring:message code="login.btn" />"></td>
					    </tr>
					    
					    </table>
					    
					    </form:form>
					    
		          </div>
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


  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
<%--   <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script> --%>
  <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
  <%@ include file="../footer.jsp" %>      
  </body>
</html>