<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath }/assets/images/bg_5.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate mb-0 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="index.html">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>bookList <i
							class="fa fa-chevron-right"></i></span>
							<span>인문학 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">인문학 </h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">

				<div class="col-lg-9 ftco-animate">
					<div class="row">
						<c:if test="${booklistbycategory.hasNoBooks()}">
							<tr>
								<td colspan="4">판매도서가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="book" items="${booklistbycategory.content}">
							<div class="col-md-4 d-flex">
								<div class="book-wrap">
									<div class="img d-flex justify-content-end w-100"
										style="background-image: url('https://${book.bookimage}');">
										<div class="in-text">
											<a href="#"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left"
												title="Add to cart"> <span
												class="flaticon-shopping-cart"></span>
											</a> <a href="#"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left"
												title="Add to Wishlist"> <span class="flaticon-heart-1"></span>
											</a> <a href="#"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left"
												title="Quick View"> <span class="flaticon-search"></span>
											</a> <a href="#"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left" title="Compare">
												<span class="flaticon-visibility"></span>
											</a>
										</div>
									</div>
									<div class="text px-4 py-3 w-100">
										<p class="mb-2">
											<span class="price">&#8361; ${book.pricesales}</span>
										</p>
										<h2>
											<a href="detail?isbn=${book.ISBN }">${book.title}</a>
										</h2>
										<span class="position">${book.author }</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>


				<div class="col-lg-3 sidebar pl-lg-3 ftco-animate">
					<div class="sidebar-box">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="fa fa-search"></span> <input type="text"
									class="form-control" placeholder="Type a keyword and hit enter">
							</div>
						</form>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>Genres</h3>
							<ul>
								<li><a href="booklist">All <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="booklist1?category=A">인문학 <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="booklist2?category=B">소설/시/에세이 <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="booklist3?category=C">자기계발 <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="booklist4?category=D">과학 <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="booklist5?category=E">여행/취미/레저 <span
										class="fa fa-chevron-right"></span></a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<!-- .col-md-8 -->
			<div style="text-align: center; padding-right: 120px;" >
			<c:if test="${booklistbycategory.hasBooks()}">
				<div class="row mt-5">
					<div class="col">
						<div class="block-27">
							<ul>
								<c:if test="${booklistbycategory.startPage > 5}">
									<a href="booklist1?pageNo=${booklistbycategory.startPage - 5}">[이전]</a>
								</c:if>
								<c:forEach var="pNo" begin="${booklistbycategory.startPage}"
									end="${booklistbycategory.endPage}">
									<a href="booklist1?pageNo=${pNo}">[${pNo}]</a>
								</c:forEach>
								<c:if
									test="${booklistbycategory.endPage < booklistbycategory.totalPages}">
									<a href="booklist1?pageNo=${booklistbycategory.startPage + 5}">[다음]</a>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</c:if>
			</div>


		</div>
	</section>
	<!-- .section -->

	<%@ include file="../footer.jsp" %>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/google-map.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>

</body>
</html>