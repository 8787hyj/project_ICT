<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>비회원 주문 성공</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
	href="${pageContext.request.contextPath}/assets/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_5.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate mb-0 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">Home <i
								class="fa fa-chevron-right"></i></a></span>NONMEMBER<span><i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">비회원 주문하기</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">

		<div class="nonMemberOrderForm">
			<!-- 비회원 주문 성공 페이지 -->
			
			<form action="nonMemberOrderList" method="post">
				<table class="" style="text-align: center">
					<tr>
						<td colspan="2"><h2>주문이 성공적으로 접수되었습니다.</h2></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp</td>
					</tr>
					<tr>
						<td colspan="2">비회원 정보</td>
					</tr>
					
					<tr>
						<td colspan="2">&nbsp</td>
					</tr>
					<tr>
						<td>비회원 번호</td>
						<td>
							<input type="text" name="nonMemberId" readonly="readonly" value="${nonMember.nonMemberID}" />
						</td>
					</tr>
					<tr>
						<td>비회원 이메일</td>
						<td>
							<input type="text" name="nonMemberEmail" readonly="readonly" value="${nonMember.nonMemberEmail}" />
						</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center">
							<button type="submit" class="btn btn-secondary" style="margin: 10px">주문내역 확인하기</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='main'">메인으로 돌아가기</button>
						</td>
					</tr>
				</table>
			</form>

		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<!-- <svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg> -->
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/scrollax.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


	<%@ include file="../footer.jsp"%>
</body>
</html>