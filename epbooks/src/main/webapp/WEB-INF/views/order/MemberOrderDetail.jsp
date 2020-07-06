<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
td{
	border-color: gray;
}
</style>

<title>Publishing Company - Free Bootstrap 4 Template by
	Colorlib</title>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
								class="fa fa-chevron-right"></i></a></span> <span>결제내역 <i
							class="fa fa-chevron-right"></i></span>
							<span>주문상세 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">주문상세 </h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">


			<table style="margin: auto; text-align: center;">
				<tr>
					<td colspan="2" rowspan="6"><img alt="" src="https://${memberOrder.bookImagePath}" style="margin-right: 100px; vertical-align: middle;"></td>
				</tr>
				<tr>
					<td style="margin-right: 300px;">주문번호: </td>
					<td>${memberOrder.orderNo }</td>
				</tr>
				<tr>
					<td style="margin-right: 300px;">주문내역번호: </td>
					<td>${memberOrder.orderListNo }</td>
				</tr>
				<tr>
					<td>상품이름:</td>
					<td>${memberOrder.title }</td>
				</tr>
				<tr>
					<td>주문수량:</td>
					<td>${memberOrder.orderAmount }</td>
				</tr>
				<tr>
					<td>주문일:</td>
					<td>${memberOrder.orderDate }</td>
				</tr>
			</table>

		</div>

	</section>


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
	<script src="${pageContext.request.contextPath }/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/google-map.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".cart-ajax")
					.click(
							function(event) {
								event.preventDefault();
								var isbn = $(this).val();
								var amount = $('#bookAmount').val();
								console.log("isbn" + isbn);
								console.log("amount" + amount);
								$
										.ajax({
											url : "${pageContext.request.contextPath}/cart/insert",
											type : "post",
											dataType : "text",
											data : {
												isbn : isbn,
												amount : amount
											/* quantity:1 */
											},
											success : function(result) {
												console.log(">>>>>>>>>>>>>>>>",
														result);
												if ($.trim(result) == 'success') {
													if (confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
														location.href = "${pageContext.request.contextPath}/cart";
													}
												} else if ($.trim(result) == 'distinct') {
													if (confirm("동일한 도서가 장바구니에 담겨있습니다. 수량을 추가 하시겠습니까?")) {
														$
																.ajax({
																	url : "${pageContext.request.contextPath}/cart/changeamount",
																	type : "get",
																	dataType : "text",
																	data : {
																		isbn : isbn

																	/* quantity:1 */
																	},
																	success : function(
																			result) {
																		if ($
																				.trim(result) == 'success') {
																			if (confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
																				location.href = "${pageContext.request.contextPath}/cart";
																			}
																		}
																	}
																});
														/* location.href="/www/addcart/update"; */
													}
												} else {
													alert($.trim(result));
												}
											}
										});
							});

		});
	</script>


	<script type="text/javascript">
		$(function() {
			$(".order").click(
					function(event) {

						var amount1 = $("#bookAmount").val();

						if (amount1 <= 0) {
							alert("수량을 1개이상 입력해주세요");
							return false;
						}

						event.preventDefault();
						var isbn = $(this).val();
						var amount = $('#bookAmount').val();
						console.log("isbn" + isbn);
						console.log("amount" + amount);

						location.href = "/www/order?isbn=" + isbn + "&amount="
								+ amount;
					});
		});
	</script>

</body>
</html>