<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><spring:message code="login.title" /></title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
table {
	width: 100%;
}

input[type=submit] {
	width: 220px;
	padding: 10px 12px;
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
	border: 0px;
}

input.full {
	width: 100%;
}

td {
	padding: 10px;
}

td.right {
	text-align: right;
}

</style>
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
								class="fa fa-chevron-right"></i></a></span> <span>login <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">로그인</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="heading-section text-center ftco-animate pb-4">

						<form:form modelAttribute="loginCommand">
							<form:errors />

							<table>
								<tr>
									<td><spring:message code="memberId" /></td>
									<td colspan="4"><form:input path="memberId"
											class="full form-control" /></td>
									<form:errors path="memberId" />
								</tr>
								<tr>
									<td><spring:message code="password" /></td>
									<td colspan="4"><form:password path="password"
											class="full form-control" /></td>
									<form:errors path="password" />
								</tr>
								<tr>
									<td colspan="5" class="right"><spring:message
											code="rememberMemberId" /> <form:checkbox
											path="rememberMemberId" /></td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="submit" value="<spring:message code="login.btn" />">
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<a id="kakao-login-btn"></a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="hidden" id="tocken" name="tocken"
										value="0">
									</td>
								</tr>
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/user/IduserSearch">아이디
											찾기</a></td>
									<td><a
										href="${pageContext.request.contextPath}/user/PassworduserSearch">비밀번호
											찾기</a></td>
									<td><a
										href="${pageContext.request.contextPath }/register/form">회원가입</a></td>
									<td><a
										href="${pageContext.request.contextPath}/order/nonMemberOrderSearchdo">비회원
											주문조회하기</a></td>
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
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script type="text/javascript">
		// input your appkey
		Kakao.init('8f71eeb1bcec63d145a665865f725bc5')
		Kakao.Auth
				.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {
						Kakao.API
								.request({
									url : '/v2/user/me',
									success : function(res) {
										//alert(JSON.stringify(res))
										var request = encodeURI(JSON
												.stringify(res));
										$('#tocken').val(request);
										var value = $('input[name=tocken]')
												.val();
										//console.log("value: >>>>>>>>>>>>>>>>"+value);
										location.href = "/www/login/Kakao?value="
												+ value;
									},
									fail : function(error) {
										alert('login success, but failed to request user information: '
												+ JSON.stringify(error))
									},
								})
					},
					fail : function(err) {
						alert('failed to login: ' + JSON.stringify(err))
					},
				})
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/kakao.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<%--   <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script> --%>
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
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>