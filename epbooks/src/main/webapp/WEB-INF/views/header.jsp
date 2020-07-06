<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EpBooks</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/animate.css">

<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">

<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<header>
		<div class="headerRightMenu">
			<ul>
				<c:if test="${empty adminAuthInfo}">
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath}/board/list"
						class="headerRightMenuAtag">책방</a></li>
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/article/list"
						class="headerRightMenuAtag">고객센터</a></li>
					<c:if test="${empty authInfo}">
						<li class="headerRightMenuLi"><a
							href="${pageContext.request.contextPath }/register/form"
							class="headerRightMenuAtag">회원가입</a></li>
					</c:if>
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/cart"
						class="headerRightMenuAtag">장바구니</a></li>
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/mypage"
						class="headerRightMenuAtag">마이페이지</a></li>
					<c:if test="${empty authInfo}">
						<li class="headerRightMenuLi"><a
							href="${pageContext.request.contextPath }/login"
							class="headerRightMenuAtag">로그인</a></li>
					</c:if>
					<c:if test="${! empty authInfo}">
						<li class="headerRightMenuLi"><a
							href="${pageContext.request.contextPath }/logout"
							class="headerRightMenuAtag">로그아웃</a></li>
						<li class="headerRightMenuLi"><a class="headerRightMenuAtag">${authInfo.name }
								님 환영합니다.</a></li>
					</c:if>
				</c:if>
				<c:if test="${!empty adminAuthInfo}">
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/admin/logout"
						class="headerRightMenuAtag">로그아웃</a></li>
					<li class="headerRightMenuLi"><a class="headerRightMenuAtag">관리자
							로그인 상태입니다.(관리자ID: ${adminAuthInfo.adminId }) </a></li>
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/article/list"
						class="headerRightMenuAtag">고객센터</a></li>
					<li class="headerRightMenuLi"><a
						href="${pageContext.request.contextPath }/admin"
						class="headerRightMenuAtag">관리자페이지</a></li>
				</c:if>
			</ul>
		</div>
		<div class="container-fluid px-md-5  pt-4 pt-md-5">


			<div class="row justify-content-between">
				<div class="col-md-8 order-md-last">
					<div class="row">
						<div class="col-md-6 text-center">
							<a class="navbar-brand"
								href="${pageContext.request.contextPath }/">E p B o o k s<small>Online
									BookStore</small></a>
						</div>
						<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
							<form action="book/search" method="get"
								class="searchform order-lg-last">
								<div class="form-group d-flex">
									<input type="text" class="form-control pl-3"
										placeholder="Book Search" id="searchKey" name="searchKey">
									<button type="submit" placeholder=""
										class="form-control search">
										<span class="fa fa-search"></span>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- <div class="col-md-4 d-flex">
					<div class="social-media">
						<p class="mb-0 d-flex">
							<a href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
								href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
								href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
							<a href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
						</p>
					</div>
				</div> -->
			</div>
		</div>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container-fluid">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav m-auto">

						<!-- 나중에 경로 수정하기 -->
						<li class="nav-item active"><a
							href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/book/booklist"
							class="nav-link">국내 도서</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/" class="nav-link">추천
								도서</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/" class="nav-link">외국
								도서</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/" class="nav-link">지도
								검색</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/" class="nav-link">eBook</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/" class="nav-link">음반</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END nav -->
	</header>
	
	
	
	
</body>
</html>