<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장바구니</title>
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
	
<style type="text/css">

	button:focus {
		outline: none;
	}

	.cart-table {
		width: 100%;
		
	}
	
	.cart-table th {
		text-align: center;
		border-bottom: 1px solid lightgray;
		
	}
	
	.cart-table th,td {
		padding: 15px;
		text-align: center;
	}

	
	.cart-table tr {
		border-bottom: 1px solid lightgray;
		
	}


/* 배송비관련 테이블 */
	.del-info-table{
		width: 100%;
		
		
	}
	
	.del-info-table th,td {
		padding: 15px;
		text-align: center;
		
	}
	
	.del-info-table tr,th{
		/* border: 1px solid black; */
	}
	
	.del-info-table th{
	/* 	border: 1px solid black; */
		text-align: left;
		padding-left: 30px;
	}
	
	.del-info-table td{
		height: 100px;
		color: black;
		text-align: right;
		font-size: 2em;
		padding-right: 30px;
		/* border: 1px solid black; */
	}
	
	.row div {
		width: 100%;
	}
	
	.price-span {
		font-size: 20px;
		color: black;
		margin: 10px;
	}
	
</style>	
	
</head>
<body>

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
								class="fa fa-chevron-right"></i></a></span> <span>장바구니 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">장바구니</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				
					
						<c:if test="${empty cartlist}">
							<p>장바구니에 담긴 상품이 없습니다.</p>
						</c:if>
						<c:if test="${! empty cartlist}">
							<form name="cart">
								<table class="cart-table">
									<tr>
										<th><input type="checkbox" id="checkall" checked /></th>
										<th>도서</th>
										<th>ISBN</th>
										<th>제목</th>
										<th>가격</th>
										<th>작가</th>
										<th>주문수량</th>
										<th>합계</th>
										<th>선택</th>
									</tr>
									<c:forEach var="list" items="${cartlist}">
										<tr class="tr">
											<td><input type="checkbox" name="chk"
												value="${list.isbn}" checked /></td>
											<td><img src="https://${list.bookimagepath}" alt=""
												style="width: 61px; height: 90px;" /></td>
											<td class="isbn">${list.isbn}</td>
											<td style="text-align: left;">${list.title}</td>
											<td style="width: 90px">&#8361; ${list.pricesales}</td>
											<td style="width: 150px;">${list.author}</td>
											<td style="width: 100px;"><div style="margin: auto;">
													<input type="number" class="amount"
														value="${list.cartAmount}"
														style="width: 50px; text-align: center; margin: 3px;" min="1"><br />
													<button class="cart-change-ajax btn btn-primary">변경</button>
												</div></td>
											<td style="width: 90px">&#8361; ${sum = list.cartAmount * list.pricesales}</td>
											<td style="width: 150px;"><button class="deleteCart btn btn-primary" value="${list.isbn }">삭제하기</button></td>
										</tr>
									</c:forEach>
								</table>
							</form>
							
							<!-- 배송비 관련 table -->
							
							<div style="margin: 10px;">
								<table class="del-info-table">
									<tr>
										<th>상품금액</th>
										<th>배송비</th>
										<th>결제예정금액</th>
										<th>적립예정</th>
										<!-- <th>적립예정</th> -->
									</tr>
									<tr>
										<td><c:set var="totalprice" value="0" /> 
										<c:forEach var="list" items="${cartlist}">
											<c:set var="totalprice" value="${totalprice + list.pricesales * list.cartAmount}" />
											</c:forEach> 
											<c:out value="${totalprice}" /><span class="price-span">원</span>
										<td>${fee = totalprice > 20000 ? 0 : 3000}<span class="price-span">원</span></td>
										<td><c:out value="${totalprice + fee}" /><span class="price-span">원</span></td>
										<td><fmt:parseNumber var="point"
												value="${totalprice * 0.05}" integerOnly="true" /> ${point}<span class="price-span">원p</span></td>
										<!-- <td><span id="multiPrint"></span></td> -->
									</tr>
								</table>
							</div>
							<div style="text-align: center;">
								<button id="order" class="btn btn-secondary">결제하기</button>
							</div>
						</c:if>
					


				</div>
			</div>

	</section>
	<!-- .section -->


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
	
	<!-- 장바구니 기능 관련 js -->
	<script src="${pageContext.request.contextPath }/assets/js/script/cart/cartlist.js"></script>
	
	
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>