<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.read {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px
}

table {
	width: 100%;
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>
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
								class="fa fa-chevron-right"></i></a></span> <span>결제 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">결제정보 입력</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="heading-section text-center ftco-animate pb-4">

						<table style="text-align: center;">
							<tr style="background-color: #FD7B61; color: white;">
								<td>ISBN</td>
								<td>구매 수량</td>
								<td>책 제목</td>
								<td>판매가</td>
								<td>구매 합계</td>
							</tr>
							<c:if test="${!empty cartList}">
								<c:forEach var="list" items="${cartList}" varStatus="status">
									<tr style="text-align: center">
										<td><input class="read isbn" type="text"
											readonly="readonly" value="${list.isbn}" style="text-align: center;"/></td>
										<td><input class="read amount" type="text"
											readonly="readonly" value="${list.cartAmount }" style="text-align: center;"/></td>
										<td><input class="read" type="text" readonly="readonly"
											value="${list.title }" style="text-align: center;"/></td>
										<td><input class="read" type="text" readonly="readonly"
											value="${list.pricesales }" style="text-align: center;"/></td>
										<td>
											<!-- 20000원 이하 도서 구매시 배송료 3000원 추가 --> ${fee = list.pricesales > 20000 ? 0 : 3000 ; ""}
											<input class="read" type="text" readonly="readonly"
											value="${list.pricesales*list.cartAmount + fee }" style="text-align: center;" />
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty cartList}">
								<tr style="text-align: center">
									<td><input class="read isbn" type="text"
										readonly="readonly" value="${memberOrder.mem.get(1) }" style="text-align: center;"/></td>
									<td><input class="read amount" type="text"
										readonly="readonly" value="${memberOrder.mem.get(0) }" style="text-align: center;"/></td>
									<td><input class="read" type="text" readonly="readonly"
										value="${booklist.title }" style="text-align: center;"/></td>
									<td><input class="read" type="text" readonly="readonly"
										value="${booklist.pricesales }" style="text-align: center;"/></td>
									<td><input class="read" type="text" readonly="readonly"
										value="${booklist.pricesales*memberOrder.mem.get(0) }" style="text-align: center;"/></td>
									<td>
										<!-- 20000원 이하 도서 구매시 배송료 3000원 추가 --> ${fee = list.pricesales > 20000 ? 0 : 3000 ; ""}
										<input class="read" type="text" readonly="readonly"
										value="${list.pricesales*list.cartAmount + fee }" style="text-align: center;" />
									</td>
								</tr>
							</c:if>
						</table>
						<table style="margin-top: 100px;">
							<tr>
								<td style="width: 200px">수령인</td>
								<td><input type="text" id="name" name="name" class="name  full form-control"
									value="${resultmap.name }"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" id="address" name="address"
									class="address full form-control" value="${resultmap.address }"></td>
							</tr>
							<tr>
								<td>email</td>
								<td><input type="text" id="email" name="email"
									class="email full form-control" value="${resultmap.email }" class="check"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" id="phone" name="phone"
									class="phone  full form-control" value="${resultmap.phone }" maxlength="13"></td>
							</tr>
							<tr>
								<td>마일리지</td>
								<c:if test="${empty cartList}">
									<td><fmt:parseNumber var="point"
											value="${booklist.pricesales * memberOrder.mem.get(0) * 0.05}"
											integerOnly="true" /> ${point}<span class="price-span">
											point</span></td>
								</c:if>
								<!-- 장바구니에서 넘어올때도 처리해 줘야함 -->
								<c:if test="${!empty cartList}">
									<td><fmt:parseNumber var="point"
											value="${booklist.pricesales * memberOrder.mem.get(0) * 0.05}"
											integerOnly="true" /> ${point}<span class="price-span">
											point</span></td>
								</c:if>
							</tr>
							<tr>
								<td colspan="2" style="text-align: right;"><button
										type="button" class="memberOrder btn btn-secondary">구매</button></td>
							</tr>

						</table>

					</div>

				</div>
			</div>
		</div>

	</section>


	<%@ include file="../footer.jsp"%>



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
	<script type="text/javascript">
		//null check
		$(function() {
			$(".memberOrder")
					.click(
							function(event) {
								var name = $("#name").val();
								var address = $("#address").val();
								var email = $("#email").val();
								var phone = $("#phone").val();
								var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
								
								var phoneEx = /^\d{3}-\d{3,4}-\d{4}$/;
								
								if (name.length == 0) {
									alert("이름을 입력해주세요");
									$("#name").focus();
									return false;
								}

								if (email.length == 0) {
									alert("이메일을 입력해주세요");
									$("#nonMemberEmail").focus();
									return false;
								} else {
									if (exptext.test(email) == false) {

										//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

										alert("이 메일형식이 올바르지 않습니다.");

										document.addjoin.email.focus();

										return false;
									}
								}

								if (phone.length == 0) {
									alert("전화번호를 입력해주세요");
									$("#nonMemberPhone").focus();
									return false;
								} else {
									if (phoneEx.test(phone) == false) {

										//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

										alert("이 전화번호 형식이 올바르지 않습니다.");

										document.addjoin.phone.focus();

										return false;
									}
								}

								if (address.length == 0) {
									alert("주소를 입력해주세요");
									$("#nonMemberAddress").focus();
									return false;
								}

								if (confirm("주문하시겠습니까?")) {
									$(function() {
										var isbn = new Array();
										var amount = new Array();
										var temp;
										console.log(amount);
										$(".isbn").each(function() {
											temp = ($(this).val());
											console.log(temp)
											isbn.push(temp);

										});

										$(".amount").each(function() {

											temp = ($(this).val());
											console.log(temp)
											amount.push(temp);

										});

										var sJson = {
											'name' : name,
											'address' : address,
											'email' : email,
											'phone' : phone,
											'isbn' : isbn,
											'amount' : amount
										};
										console.log("isbn : " + isbn);
										console.log("amount : " + amount);

										var result = encodeURI((JSON
												.stringify(sJson)));
										console.log("result : " + result);
										location.href = "/www/order/memberOrder?result="
												+ result;

									});
								}
							});
			/* var regExp = '';
			var data = '';
			$('#email')
					.on(
							"focusout",
							function() {
								data = $('#email').val();
								//console.log(data);
								if ($('#email').attr('#email') == '#email') {
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
			} */
		});
	</script>

</body>
</html>