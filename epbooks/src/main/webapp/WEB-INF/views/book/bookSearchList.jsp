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
								class="fa fa-chevron-right"></i></a></span> <span>search <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">검색</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg" style="margin-left: 250px">
		<div class="container">
			<div class="row">

				<div class="col-lg-9 ftco-animate">
					<div class="row">
						<c:if test="${booklistsearch.hasNoBooks()}">
							<tr>
								<td colspan="4">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="book" items="${booklistsearch.content}">
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
											<span class="price">${book.pricesales}</span>
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
			</div>
			<!-- .col-md-8 -->
			<div style="text-align: center; padding-right: 120px;" >
			<c:if test="${booklistsearch.hasBooks()}">
				<tr>
					<td colspan="4"><c:if test="${booklistsearch.startPage > 5}">
							<a
								href="search?searchKey=${searchKey }&pageNo=${booklistsearch.startPage - 5}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${booklistsearch.startPage}"
							end="${booklistsearch.endPage}">
							<a href="search?searchKey=${searchKey }&pageNo=${pNo}">[${pNo}]</a>
						</c:forEach> <c:if
							test="${booklistsearch.endPage < booklistsearch.totalPages}">
							<a
								href="search?searchKey=${searchKey }&pageNo=${booklistsearch.startPage + 5}">[다음]</a>
						</c:if></td>
				</tr>
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