<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>비회원 주문하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
/* table {
	width: 100%;
} */

input[type=button] {
	width: 220px;
	padding: 10px 12px;
	text-align: center;
	background-color: #6C757D;
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
	padding: 5px;
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
								class="fa fa-chevron-right"></i></a></span>NONMEMBER <span><i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">비회원 주문하기</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="heading-section text-center ftco-animate pb-4">

						<!-- 비회원 주문 폼 -->
						<form action="order/nonMemberOrderdo" name="nonMemberOrderForm"
							method="post" id="nonMemberOrderForm">
							<table class="nonMemberRegister">
								<tr>
									<td colspan="2" style="text-align: centerl; font-size: 18px">비회원 정보 입력</td>
								</tr>

								<tr>
									<td colspan="5" style="font-size: 2px">&nbsp</td>
								</tr>

								<tr>
									<td style="text-align: center; padding: 0 50px 0 50px">이름</td>
									<td><input type="text" name="nonMemberName"
										id="nonMemberName" class="full form-control" maxlength="10" style="width: 400px" /></td>
								</tr>

								<tr>
									<td style="text-align: center">이메일</td>
									<td><input type="text" name="nonMemberEmail"
										id="nonMemberEmail" class="check full form-control"
										placeholder="ex) honggildong@naver.com" style="width: 400px" />
										<button type="button" id="emailCheckbtn"
											class="btn btn-primary">중복확인</button>
										<div id="emailCheckMsg"></div></td>
								</tr>

								<tr>
									<td style="text-align: center">전화번호</td>
									<td><input type="text" name="nonMemberPhone"
										id="nonMemberPhone" class="full form-control" maxlength="11" style="width: 400px" /></td>
								<tr>
								<tr>
									<td style="text-align: center">주소</td>
									<td><input type="text" name="nonMemberAddress"
										id="nonMemberAddress" class="full form-control" maxlength="100" style="width: 400px" /></td>
								<tr>
							</table>

							<table style="margin-top: 70px; margin-bottom: 20px; padding: 0 80px 0 80px">
								<tr style="text-align: center; background-color: #FD7B61; color: white;">
									<td>책 이미지</td>
									<td >책 제목</td>
									<td style="width: 3000px">판매가</td>
									<td style="width: 3000px">구매 수량</td>
									<td style="width: 3000px">구매 합계</td>
								</tr>
								<tr style="text-align: center">
									<td><img src="https://${Book.bookimage }" /></td>
									<td style="width: 8000px">${Book.title }</td>
									<td><fmt:formatNumber pattern="#,###">${Book.pricesales }</fmt:formatNumber></td>
									<td>${amount }</td>
									<td><fmt:formatNumber pattern="#,###">${amount*Book.pricesales }</fmt:formatNumber></td>
								</tr>

								<tr>
									<td colspan="5" style="text-align: center"><input
										type="button" class="btn btn-secondary" value="결제하기"
										onclick="DoOrder(); return false;" /></td>
								</tr>
							</table>

							<!-- <input type="button" class="btn btn-secondary" value="결제하기" onclick="DoOrder(); return false;" style="margin: 0 auto;"/> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"></div>


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

	<!-- 스크립트 적용 -->
	<script type="text/javascript">
		var regExp = '';
		var data = '';
		$('.check')
				.on(
						"focusout",
						function() {
							data = $(this).val();
							//console.log(data);
							if ($(this).attr('name') == 'nonMemberEmail') {
								regExp = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
							}

							if (!checkRegex(regExp, data)) {
								//console.log("checkRegex-false");
								$(this).val("");
								//$(this).focus();
								return false;
							}
						});

		//정규식 적용 함수
		function checkRegex(regExp, data) {
			if (!regExp.test(data)) {
				alert("형식에 맞게 입력하세요");

				return false;
			}
			return true; //확인이 완료되었을 때
		}

		//이메일 중복확인
		$(document)
				.ready(
						function() {
							$('#emailCheckbtn')
									.on(
											'click',
											function() {
												console
														.log($(
																'#nonMemberEmail')
																.val());
												if ($('#nonMemberEmail').val() != '') {
													var nonMemberEmail = $(
															'#nonMemberEmail')
															.val();
													console
															.log("nonMemberEmail >>>>>>>>>> "
																	+ nonMemberEmail);
													$
															.ajax({
																type : 'POST',
																url : '${pageContext.request.contextPath }/order/checkEmail',
																data : {
																	nonMemberEmail : $(
																			'#nonMemberEmail')
																			.val()
																},
																success : function(
																		data) {
																	console
																			.log(data);
																	if ($
																			.trim(data) == 0) {
																		$(
																				'#emailCheckMsg')
																				.text(
																						'사용가능합니다.');
																	} else {
																		$(
																				'#emailCheckMsg')
																				.text(
																						'다른 이메일주소를 입력해 주세요.');
																		/* location.reload(); */
																	}
																}
															}); //end ajax 
												}//end if
												else {
													alert("이메일주소를 입력해주세요.");
												}
											}); //end on
						});

		//null check
		function DoOrder() {
			var nonMemberName = $("#nonMemberName").val();
			var nonMemberEmail = $("#nonMemberEmail").val();
			var nonMemberPhone = $("#nonMemberPhone").val();
			var nonMemberAddress = $("#nonMemberAddress").val();
			var emailcheck = $.trim($('#emailCheckMsg').text()
					.replace(/ /g, ''));
			var emailchecksuccess = $.trim("사용 가능 합니다.".replace(/ /g, ''));

			if (nonMemberName.length == 0) {
				alert("이름을 입력해주세요");
				$("#nonMemberName").focus();
				return false;
			}

			if (nonMemberEmail.length == 0) {
				alert("이메일을 입력해주세요");
				$("#nonMemberEmail").focus();
				return false;
			}

			if (nonMemberPhone.length == 0) {
				alert("전화번호를 입력해주세요");
				$("#nonMemberPhone").focus();
				return false;
			}

			if (nonMemberAddress.length == 0) {
				alert("주소를 입력해주세요");
				$("#nonMemberAddress").focus();
				return false;
			}

			if (emailcheck != emailchecksuccess) {
				alert("이메일을 확인 해주세요");
				$("#nonMemberEmail").focus();
				return false;
			}

			if (confirm("주문하시겠습니까?")) {
				document.getElementById("nonMemberOrderForm").submit();
				return true;
			}

		}
	</script>

	<%@ include file="../footer.jsp"%>
</body>
</html>