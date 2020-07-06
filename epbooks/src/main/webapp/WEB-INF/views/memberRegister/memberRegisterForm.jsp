<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>

<style>
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

input[type=reset] {
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
</style>



<title>회원가입</title>
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
								class="fa fa-chevron-right"></i></a></span> <span>register <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">회원가입</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="heading-section text-center ftco-animate pb-4">

						<form action="registerdo" name="registerdo" method="post"
							id="registerForm">
							<table class="memberRegister">
								<tr>
									<td colspan="2" style="font-size: 18px;text-align: center">기본정보 입력</td>
								</tr>
								<tr>
									<td colspan="2" style="font-size: 2px;">&nbsp</td>
								</tr>
								<tr>
									<td>아이디</td>
									<!-- style="text-align: center; padding: 0 50px 0 50px" -->
									<td><input type="text" name="memberID" id="memberID"
										class="check full form-control"
										placeholder="4~12자의 영문, 숫자만 가능" maxlength="12"/> <!-- 아이디 중복체크 버튼 -->
										<button type="button" id="idCheckbtn" class="btn btn-primary">중복확인</button>
										<div id="idCheckMsg"></div></td>
								</tr>
								<tr>
									<td style="text-align: center">비밀번호</td>
									<td><input type="password" name="password" id="password"
										class="check full form-control" maxlength="12"
										placeholder="4~12자의 영문, 숫자만 가능" /></td>
									<!-- style="width:230px" -->
								</tr>
								<tr>
									<td style="text-align: center">비밀번호 확인</td>
									<td><input type="password" name="password2" id="password2"
										class="pw full form-control" maxlength="12" /> <!-- style="width:230px" -->
										<span id="alertSuccess" style="display: none;">비밀번호가
											일치합니다.</span> <span id="alertDanger" style="display: none;">비밀번호가
											일치하지 않습니다.</span></td>
								</tr>

								<tr>
									<td style="text-align: center">이메일</td>
									<td><input type="text" name="email" id="email"
										class="check full form-control"
										placeholder="ex) honggildong@naver.com" /> <!-- style="width:230px" -->
										<button type="button" id="emailCheckbtn"
											class="btn btn-primary">중복확인</button>
										<div id="emailCheckMsg"></div></td>

								</tr>

								<tr>
									<td style="text-align: center">이름</td>
									<td><input type="text" name="name" id="name"
										class="full form-control" maxlength="10"/></td>
								</tr>

								<tr>
									<td style="text-align: center">휴대전화</td>
									<td><input type="text" name="phone" id="phone"
										class="full form-control"
										maxlength="13" /></td>
					
								<tr>
								<tr>
									<td colspan="2">&nbsp</td>
								</tr>

								<td colspan="2" style="text-align: center"><input
									type="button" class="btn btn-secondary" name="register"
									id="memberRegister" value="회원가입"
									onclick="DoMemberRegister(); return false;"
									style="margin: 10px" /> <input type="reset"
									class="btn btn-secondary" name="reset" value="취소" /></td>
							</table>
						</form>
					</div>
				</div>
			</div>
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

	<script type="text/javascript">
		//정규식 패턴 검사	
		var regExp = '';
		var data = '';
		$('.check')
				.on(
						"focusout",
						function() {
							data = $(this).val();
							//console.log(data);

							if ($(this).attr('name') == 'email') {
								//console.log("attr-email");
								regExp = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
							} else {
								//console.log("attr-not-email");
								regExp = /^[a-zA-z0-9]{4,12}$/;
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

		//비밀번호 일치 확인 - 완료
		$('.pw').focusout(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#password2").val();
			console.log("pwd1 " + pwd1);
			console.log("pwd2 " + pwd2);

			if (pwd1 != '' && pwd2 != '') {
				if (pwd1 == pwd2) {
					$("#alertSuccess").css('display', 'inline-block');
					$("#alertDanger").css('display', 'none');
				} else {
					alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
					$("#alertSuccess").css('display', 'none');
					$("#alertDanger").css('display', 'inline-block');
				}
			}
		});//비밀번호 일치 확인 - 완료

		//유효성 검사 - null있으면 alert창 띄우기
		function DoMemberRegister() {

			var memberid = $("#memberID").val();
			var password = $("#password").val();
			var password2 = $("#password2").val();
			var email = $("#email").val();
			var membername = $("#name").val();
			var phone = $("#phone").val();
			/* 아이디 , 이메일 중복 관련 변수 */
			var idcheck = $.trim($('#idCheckMsg').text().replace(/ /g, ''));
			var idchecksuccess = $.trim("사용 가능한 아이디 입니다.".replace(/ /g, ''));
			var emailcheck = $.trim($('#emailCheckMsg').text()
					.replace(/ /g, ''));
			var emailchecksuccess = $.trim("사용 가능한 이메일 입니다.".replace(/ /g, ''));
			console.log(idcheck + ">>>>>>>>>>>>>>>>>>>>");

			if (memberid.length == 0) {
				alert("아이디를 입력해주세요");
				$("#memberID").focus();
				return false;
			}

			if (password.length == 0) {
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
				return false;
			}

			if (password2.length == 0) {
				alert("비밀번호 확인을 입력해주세요");
				$("#password2").focus();
				return false;
			}

			if (email.length == 0) {
				alert("이메일을 입력해주세요");
				$("#email").focus();
				return false;
			}

			if (membername.length == 0) {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			}

			if (phone.length == 0) {
				alert("휴대 전화번호를 입력해주세요");
				$("#phone").focus();
				return false;
			}
			if (idcheck != idchecksuccess) { /* 여기여기여기 */
				alert("아이디를 확인해주세요");
				$("#memberID").focus();
				return false;
			}
			if (emailcheck != emailchecksuccess) { /* 여기여기여기 */
				alert("이메일을 확인해주세요");
				$("#email").focus();
				return false;
			}

			if (confirm("회원가입을 하시겠습니까?")) {
				document.getElementById('registerForm').submit();
				return true;
			}

		} //유효성 검사 - alert창 띄우기 

		//아이디 중복확인
		$(document).ready(function() {
			$('#idCheckbtn').on('click', function() {
				console.log($('#memberID').val());
				if ($('#memberID').val() != '') {
					var memberid = $('#memberID').val();
					$.ajax({
						type : 'POST',
						url : 'checkSignup',
						data : {
							memberid : $('#memberID').val()
						},
						success : function(data) {
							console.log(data);
							if ($.trim(data) == 0) {
								$('#idCheckMsg').text('사용 가능한 아이디 입니다.');
							} else {
								$('#idCheckMsg').text('사용 불가능한 아이디 입니다.');
							}
						}
					}); //end ajax 
				}//end if
				else {
					alert("아이디를 입력해주세요.");
				}
			}); //end on
		});

		/* 이메일 중복확인 */
		$(document).ready(function() {
			$('#emailCheckbtn').on('click', function() {
				console.log($('#email').val());
				if ($('#email').val() != '') {
					var memberid = $('#email').val();
					$.ajax({
						type : 'POST',
						url : 'checkSignup',
						data : {
							email : $('#email').val()
						},
						success : function(data) {
							console.log(data);
							if ($.trim(data) == 0) {
								$('#emailCheckMsg').text('사용 가능한 이메일입니다.');
							} else {
								$('#emailCheckMsg').text('사용 불가능한 이메일입니다.');
							}
						}
					}); //end ajax 
				}//end if
				else {
					alert("이메일을 입력해주세요.");
				}
			}); //end on
		});
	</script>

	<%@ include file="../footer.jsp"%>
</body>
</html>