<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>마이페이지</title>
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
.mypage-info-wrap {
	display: flex;
	flex-direction: column;
	margin-bottom: 30px;
}

.change-member-info-wrapper {
	display: flex;
	flex-direction: column;
	padding: 10px
}

.change-member-info-first {
	display: flex;
	flex-direction: row;
	margin: 10px;
}

.change-member-info-second {
	padding: 10px;
}

.change-member-info-second-one {
	padding: 10px;
	width: 200px;
}

#memberNameMenu, #memberEamilMenu, #memberAdderssMenu, #memberPhoneMenu,
	#memberPrivateMenu {
	display: none;
	
}

#memberNameMenuShow, #memberEamilMenuShow, #memberAdderssMenuShow, #memberPhoneMenuShow,
	#memberPrivateMenuShow {
	width: 200px;
	
}
/* 쇼핑정보 관련 */
.mypage-info-second-div {
	margin: 10px 20px 10px 20px;
}

.categories ul li a {
	font-size: 14px;
	color: #404040;
	margin-left: 10px;
}

.top li a {
	font-size: 14px;
	color: #404040;
	margin-left: 10px;
}

/* 회원등급일반 div */
#mypage-info-second-div-member {
	margin: 10px;
	margin-right: 20px;
	width: 250px;
	font-size: 16px;
	background-color: white;
	display: flex;
	flex-direction: row;
	border: 1px solid lightgray;
}

#mypage-info-second-div-member div {
	padding: 10px 0 10px 0;
	width: 125px;
}

#mypage-info-second-div-member span {
	margin: 10px;
}

/* 쇼핑정보 div */
#mypage-info-second-div-shop {
	padding-top: 10px;
	font-size: 14px;
}

.in-mypage-info-second-div {
	/* margin: 10px;
	padding: 10px; */
	width: 100px;
	text-align: center;
	border-right: 1px solid lightgray;
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
								class="fa fa-chevron-right"></i></a></span> <span>마이페이지 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container" style="display: flex; flex-direction: row;">
			<!-- <div class="row"> -->

			<!-- start mypage-info -->
			<div class="col-lg-9 ftco-animate">

				<div class="mypage-info-wrap">
					<h3>일반 개인회원</h3>
				</div> 



				<!-- 구매내역 리스트를 뿌려줄 부분 -->
				<div class="order-history-div">
					
					<div class="change-member-info-wrapper">
						<div class="change-member-info-first">
							<div class="change-member-info-second-one">성명</div>
							<div class="change-member-info-second" id="memberNameMenuShow">${member.name}</div>
							<div class="change-member-info-second" id="memberNameMenu">
								<!-- 	<input type="text" />
				<button>확인</button>
				<button id="showNameButton">취소</button> -->
							</div>
							<div class="change-member-info-second">
								<!-- <button id="memberName">변경하기</button> -->
							</div>
						</div>
						<div class="change-member-info-first">
							<div class="change-member-info-second-one">이메일</div>
							<div class="change-member-info-second" id="memberEamilMenuShow">${member.email}</div>
							<div class="change-member-info-second" id="memberEamilMenu">
								<input type="text" id="newEmail" placeholder="ex) epbooks@email.com" />
								<button onclick="changeEmail()" class="btn btn-secondary">확인</button>
								<button id="showEmailButton" class="btn btn-secondary">취소</button>
							</div>
							<div class="change-member-info-second">
								<button id="memberEamil" class="btn btn-secondary">변경하기</button>
							</div>
						</div>
						<div class="change-member-info-first">
							<div class="change-member-info-second-one">주소</div>
							<div class="change-member-info-second" id="memberAdderssMenuShow">${member.address}</div>
							<div class="change-member-info-second" id="memberAdderssMenu">
								<input type="text" id="newAddress" />
								<button onclick="changeAddress()" class="btn btn-secondary">확인</button>
								<button id="showAddressButton" class="btn btn-secondary">취소</button>
							</div>
							<div class="change-member-info-second">
								<button id="memberAdderss" class="btn btn-secondary">변경하기</button>
							</div>
						</div>
						<div class="change-member-info-first">
							<div class="change-member-info-second-one">휴대전화</div>
							<div class="change-member-info-second" id="memberPhoneMenuShow">${member.phone}</div>
							<div class="change-member-info-second" id="memberPhoneMenu">
								<input type="text" id="newPhoneNum" placeholder="'-' 없이 입력해주세요." maxlength="11"/>
								<button onclick="changePhone()" class="btn btn-secondary">확인</button>
								<button id="showPhoneButton" class="btn btn-secondary">취소</button>
							</div>
							<div class="change-member-info-second">
								<button id="memberPhone" class="btn btn-secondary">변경하기</button>
							</div>
						</div>
						<div class="change-member-info-first">
							<div class="change-member-info-second-one">개인정보 유효기간</div>
							<div class="change-member-info-second" id="memberPrivateMenuShow">1년</div>
							<div class="change-member-info-second" id="memberPrivateMenu">
								<input type="radio" name="privateinfo" value="1년" />1년 <input
									type="radio" name="privateinfo" value="3년" />3년 <input
									type="radio" name="privateinfo" value="5년" />5년 <input
									type="radio" name="privateinfo" value="탈퇴시까지" />탈퇴시까지
								<button class="btn btn-secondary">확인</button>
								<button id="showPrivateButton" class="btn btn-secondary">취소</button>
							</div>
							<div class="change-member-info-second">
								<button id="memberPrivate" class="btn btn-secondary">변경하기</button>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- end mypage-info -->
			<!-- aside bar -->
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
						<h3>회원정보관리</h3>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/mypage/changeMemberInfo">개인정보
									수정 <span class="fa fa-chevron-right"></span>
							</a></li>
							<li><a href="${pageContext.request.contextPath }/change">비밀번호변경
									<span class="fa fa-chevron-right"></span>
							</a></li>
							<li><a
								href="${pageContext.request.contextPath }/mypage/deleteMember">회원탈퇴
									<span class="fa fa-chevron-right"></span>
							</a></li>
							<li><a href="#">이벤트 당첨 내역 <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">배송주소록 <span class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">마이리뷰/페이퍼관리 <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">반품/교환 내역 <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">전체 취소 주문 내역 <span
									class="fa fa-chevron-right"></span></a></li>
						</ul>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>알림 설정</h3>
					<ul class="top">
						<li><a href="#">주문 조회/변경/취소</a></li>
						<li><a href="#">기프티북 내역</a></li>
						<li><a href="#">eBook 구매목록</a></li>
						<li><a href="#">독자북펀드 참여 내역</a></li>
						<li><a href="#">반품/교환 내역</a></li>
						<li><a href="#">저자/시리즈/분야 신간 알리미</a></li>
						<li><a href="#">재출간/입고/예약판매 알리미</a></li>
						<li><a href="#">중고 등록 알리미</a></li>
						<li><a href="#">전자책 출간 알리미</a></li>
						<!-- <li><a href="#">Jelian Coward</a></li>
              	<li><a href="#">Mark Hatton</a></li>
              	<li><a href="#">Madison Mc Collen</a></li> -->
					</ul>
				</div>
			</div>

			<!-- row div -->
			<!-- </div> -->
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
	
	<!-- 개인정보수정 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script/mypage/changeMemberInfo.js"></script>
 	
	<%@ include file="../footer.jsp"%>
	
	
	
</body>
</html>