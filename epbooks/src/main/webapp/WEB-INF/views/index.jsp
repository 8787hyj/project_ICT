<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
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
<link rel="stylesheet" href="assets/css/slide.css">

<style type="text/css">
/* Rolling banner */
.banner {
	position: relative;
	width: 1200px;
	height: 400px;
	top: 50px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 1200px; /* 1200에서 수정 */
	height: 400px; /* 400에서 수정 */
	margin: 0;
	padding: 0;
}
</style>

</head>
<body>
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
						<form action="#" class="searchform order-lg-last">
							<div class="form-group d-flex">
								<input type="text" class="form-control pl-3"
									placeholder="Book Search">
								<button type="submit" class="form-control search">
									<span class="fa fa-search"></span>
								</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>

			<div class="col-md-4 d-flex">
			<div class="social-media">
					<p class="mb-0 d-flex">
						<a href="#"
							class="d-flex align-items-center justify-content-center"><span
							class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
							href="#" class="d-flex align-items-center justify-content-center"><span
							class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
							href="#" class="d-flex align-items-center justify-content-center"><span
							class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a> <a
							href="#" class="d-flex align-items-center justify-content-center"><span
							class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
					</p>
				</div>
			 </div>

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

	<section class="hero-wrap">
		<div class="overlay"></div>
		<div class="container">

			<div class="banner">
				<ul>
					<li><img src="assets/images/rr01.jpg" alt="" width="1200px"
						height="400px"></li>
					<li><img src="assets/images/rr02.jpg" alt="" width="1200px"
						height="400px"></li>
					<li><img src="assets/images/rr03.jpg" alt="" width="1200px"
						height="400px"></li>
					<li><img src="assets/images/rr04.jpg" alt="" width="1200px"
						height="400px"></li>
					<li><img src="assets/images/rr05.jpg" alt="" width="1200px"
						height="400px"></li>
					<li><img src="assets/images/rr06.jpg" alt="" width="1200px"
						height="400px"></li>
				</ul>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt mt-5 mt-md-0">
		<div class="container">
			<div class="row">
				<div class="col-md-3 d-flex align-items-stretch ftco-animate">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-fantasy"></span>
							</div>
						</div>
						<h2>
							<a href="#">즐겁게 시작하는 제로웨이스트</a>
						</h2>
						<p>세상에 무해한 사람이 되고 싶어서</p>
					</div>
				</div>
				<div class="col-md-3 d-flex align-items-stretch ftco-animate">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-heart"></span>
							</div>
						</div>
						<h2>
							<a href="#">봄을 누리지 못한 당신에게</a>
						</h2>
						<p>로맨스 소설을 권합니다</p>
					</div>
				</div>
				<div class="col-md-3 d-flex align-items-stretch ftco-animate">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-model"></span>
							</div>
						</div>
						<h2>
							<a href="#">힘든 시대를 위한 좋은 경제학</a>
						</h2>
						<p>존엄한 인간을 위한 경제학</p>
					</div>
				</div>
				<div class="col-md-3 d-flex align-items-stretch ftco-animate">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-history"></span>
							</div>
						</div>
						<h2>
							<a href="#">잠자기 전 읽어볼까?</a>
						</h2>
						<p>셀럽이 추천한 인생그림책</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section
		class="ftco-counter ftco-section ftco-no-pt ftco-no-pb img bg-light"
		id="section-counter">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 py-4 mb-4">
						<div class="text align-items-center">
							<strong class="number" data-number="75678">0</strong> <span>월
								누적 방문자 수</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 py-4 mb-4">
						<div class="text align-items-center">
							<strong class="number" data-number="1040">0</strong> <span>오늘
								방문자 수</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 py-4 mb-4">
						<div class="text align-items-center">
							<strong class="number" data-number="283">0</strong> <span>책방
								게시글 수</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 py-4 mb-4">
						<div class="text align-items-center">
							<strong class="number" data-number="14500">0</strong> <span>도서
								보유량</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<!-- 슬라이드 테스트 -->
				<div
					class="col-md-6 img img-3 d-flex justify-content-center align-items-center">
					<div class="slide">
						<img src="assets/images/back.png" alt="" id="back" width="50">
						<ul>
							<li><img src="assets/images/sli01.jpg" alt="" width="400"
								height="370"></li>
							<li><img src="assets/images/sli02.jpg" alt="" width="400"
								height="370"></li>
							<li><img src="assets/images/sli03.jpg" alt="" width="400"
								height="370"></li>
							<li><img src="assets/images/sli04.jpg" alt="" width="400"
								height="370"></li>
							<li><img src="assets/images/sli05.jpg" alt="" width="400"
								height="370"></li>
							<li><img src="assets/images/sli06.jpg" alt="" width="400"
								height="370"></li>

						</ul>
						<img src="assets/images/next.png" alt="" id="next" width="50">
					</div>


				</div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
					<div class="heading-section">
						<span class="subheading">Welcome To EpBooks</span>
						<h2 class="mb-4">Book Story</h2>

						<p>&nbsp;&nbsp;&nbsp;좋은 책이란 무엇일까요? 좋은 책에 대한 기준은 사람마다 다르기에, 우리는
							좋은 책을 만드는 사람에 대해 생각해보았습니다. 독자에게 가닿는 날을 상상하며 온 마음으로 좋은 책을 만들려는
							사람들. 그 가운데서도 혼자, 혹은 소수의 인원으로 책을 만드는 작은 출판사의 사람들이라면, 좋은 책에 대한 흔들리지
							않는 기준을 가지고 있지 않을까요?</p>
						<!-- <p>&nbsp;&nbsp;&nbsp;《작은 출판사를 가다》에서는 책을 만드는 사람들의 이야기를 들어봅니다. 첫 번째로 찾아간 출판사는 1인 출판사 북노마드입니다. 
						북노마드 윤동희 대표는 ‘적절함’을 추구하기 위해 1인 출판사를 운영한다고 말합니다. 
						무리하지 않고 적절하게 기획하고, 적절하게 편집-디자인하고, 적절하게 판매하려는 마음이 오늘날 좋은 책을 만들었습니다. 
						『오늘도, 무사』히 북노마드스러움을 기획하는 출판사. 오늘도, 북노마드를 소개합니다.</p> -->

					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt">
		<div class="container-fluid px-md-4">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">추천 도서</span>
					<h2>고전문학 10선</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/26\/0\/coversum\/s892636015_1.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4">
							<p class="mb-2">
								<span class="price">&#8361; 8000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=﻿8937460440">데미안</a>
							</h2>
							<span class="position">헤르만 헤세</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/7601\/60\/coversum\/s422636896_1.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4">
							<p class="mb-2">
								<span class="price">&#8361; 12000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=8960304484">단테의 신곡 - 영원의 구원을 노래한
									불멸의 고전</a>
							</h2>
							<span class="position">단테 알리기에리</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/43\/68\/coversum\/8937460882_3.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4">
							<p class="mb-2">
								<span class="price">&#8361; 11000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=8937460882">오만과 편견</a>
							</h2>
							<span class="position">제인 오스틴</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/2\/47\/coversum\/8908010424_2.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4 order-md-first">
							<p class="mb-2">
								<span class="price">&#8361; 9000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=8908010424">길가메시 서사시</a>
							</h2>
							<span class="position">N.K. 샌다스</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/4\/6\/coversum\/s893746005x_1.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4 order-md-first">
							<p class="mb-2">
								<span class="price">&#8361; 7000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=893746005X">동물농장</a>
							</h2>
							<span class="position">조지 오웰</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div class="img d-flex justify-content-end"
							style="background-image: url('https://image.aladin.co.kr\/product\/8764\/52\/coversum\/s902534251_1.jpg'); background-size: 180px 250px;">
							<div class="in-text">
								<a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Add to cart">
									<span class="flaticon-shopping-cart"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left"
									title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Quick View">
									<span class="flaticon-search"></span>
								</a> <a href="#"
									class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="Compare">
									<span class="flaticon-visibility"></span>
								</a>
							</div>
						</div>
						<div class="text p-4 order-md-first">
							<p class="mb-2">
								<span class="price">&#8361; 25000</span>
							</p>
							<h2>
								<a href="book/detail?isbn=K182535682">사마천 사기56 - 본기, 세가, 열전,
									서의 명편들</a>
							</h2>
							<span class="position">사마천</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section ftco-no-pb">
		<div class="img img-bg border"
			style="background-image: url(assets/images/bg_4.jpg);"></div>
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<span class="subheading">Introduction of Writers</span>
					<h2 class="mb-3">작가 대표작</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="text">
									<p class="mb-4">『버드 스트라이크』, 『심장에 수놓은 이야기』, 『한 스푼의 시간』</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(assets/images/구병모.jpg)"></div>
										<div class="pl-3">
											<p class="name">구 병 모</p>
											<!-- <span class="position">Marketing Manager</span> -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="text">
									<p class="mb-4">『위대한 개츠비 (무선)』, 『살인자의 기억법』, 『오래 준비해온 대답 -
										김영하의 시칠리아』</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(assets/images/김영하.jpg)"></div>
										<div class="pl-3">
											<p class="name">김 영 하</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="text">
									<p class="mb-4">『지적 대화를 위한 넓고 얕은 지식 0~2』, 『열한 계단 - 나를 흔들어
										키운 불편한 지식들』</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(assets/images/채사장.jpg)"></div>
										<div class="pl-3">
											<p class="name">채 사 장</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="text">
									<p class="mb-4">『쇼코의 미소』, 『내게 무해한 사람』, 『이 선이 필요할까?』</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(assets/images/최은영.jpg)"></div>
										<div class="pl-3">
											<p class="name">최 은 영</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="text">
									<p class="mb-4">『생각하는 힘, 노자 인문학 - EBS 인문학 특강 최진석 교수의 노자 강의』</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(assets/images/최진석.jpg)"></div>
										<div class="pl-3">
											<p class="name">최 진 석</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">new release</span>
					<h2>기대 신간</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text text-center">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('assets/images/image_1.jpg');">
							</a>
							<div
								class="meta text-center mb-2 d-flex align-items-center justify-content-center">
								<div>
									<span class="day">20</span> <span class="mos">May</span> <span
										class="yr">2020</span>
								</div>
							</div>
							<h3 class="heading mb-3">
								<a href="#">나를 숨 쉬게 하는 보통의 언어들</a>
							</h3>
							<p style="text-align: left !important;">&nbsp;&nbsp;&nbsp;대표
								작사가 김이나. 그녀가 그간 대중과 긴밀히 소통해온 경험을 살려 우리가 삶에서 맞부딪히는 복잡한 감정과 관계의
								고민에 대한 해법을 일상의 단어 속에서 탐색한다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text text-center">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('assets/images/image_2.jpg');">
							</a>
							<div
								class="meta text-center mb-2 d-flex align-items-center justify-content-center">
								<div>
									<span class="day">5</span> <span class="mos">June</span> <span
										class="yr">2020</span>
								</div>
							</div>
							<h3 class="heading mb-3">
								<a href="#">시선으로부터,</a>
							</h3>
							<p style="text-align: left !important;">&nbsp;&nbsp;&nbsp;이
								소설은 무엇보다 20세기를 살아낸 여자들에게 바치는 21세기의 사랑이다. 한국문학이 당도한 올곧은 따스함, 정세랑의
								신작 장편소설</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text text-center">
							<a href="blog-single.html" class="block-20 img"
								style="background-image: url('assets/images/image_3.jpg');">
							</a>
							<div
								class="meta text-center mb-2 d-flex align-items-center justify-content-center">
								<div>
									<span class="day">30</span> <span class="mos">June</span> <span
										class="yr">2020</span>
								</div>
							</div>
							<h3 class="heading mb-3">
								<a href="#">자기긍정 심리학</a>
							</h3>
							<p style="text-align: left !important;">&nbsp;&nbsp;&nbsp;지금
								바로 자기긍정감을 높이는 방법에서부터 자기긍정감을 꾸준히 유지하는 방법까지, 이 순간이 행복해지는 가장 쉽고 확실한
								방법이자 세상에서 가장 소중한 나를 위한 긍정 연습</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer">
		<div class="container">
			<div class="row mb-5">
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2 logo">
							<a href="#">Connect</a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-2">
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Extra Links</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Affiliate
									Program</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Business
									Services</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Education
									Services</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Gift
									Cards</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Legal</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Join
									us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Blog</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Privacy
									&amp; Policy</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Term
									&amp; Conditions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Company</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About
									Us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Blog</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Careers</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span
										class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0 py-5 bg-black">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart color-danger" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib.com</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing.1.3.js"></script>
	<script src="assets/js/jquery.waypoints.min.js"></script>
	<script src="assets/js/jquery.stellar.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.animateNumber.min.js"></script>
	<script src="assets/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="assets/js/google-map.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/autoRolling.js"></script>
	<script src="assets/js/slide.js"></script>

</body>
</html>