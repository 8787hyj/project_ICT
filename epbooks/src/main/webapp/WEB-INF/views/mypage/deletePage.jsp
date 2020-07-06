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

.delete-member-wrapper {
	display: flex;
	flex-direction: column;
}

.delete-meber-first{
	margin: 20px;
	/* border: 1px solid black; */
}

.delete-meber-first table{
	margin-left: 100px;
}

.delete-meber-first table tr,td{

	padding: 15px;
}

.delete-meber-first p{
	font-size: 20px;
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
					<h3>회원 탈퇴</h3>
				</div>



				<!-- 구매내역 리스트를 뿌려줄 부분 -->
				<div class="order-history-div">
					<div class="delete-meber-first">
						<p>1.상품관련</p>
						<table>
							<tr>
								<td><input type="checkbox" name="product" value="가격 불만" /> 가격
									불만</td>
								<td><input type="checkbox" name="product" value="상품 품질 불만" /> 상품
									품질 불만</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="product" value="찾는상품 없음" /> 찾는
									상품 없음</td>
								<td><input type="checkbox" name="product" value="상품 정보 부족" /> 상품
									정보 부족</td> 
							</tr>
						</table>
					</div>
					<div class="delete-meber-first">
						<p>2.서비스관련</p>
						<table>
							<tr>
								<td><input type="checkbox" name="service" value="결제불안" /> 결제
									불안</td>
								<td><input type="checkbox" name="service" value="회원특혜불만" /> 회원
									특혜 불만</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="service" value="배송상태불만" /> 배송
									상태 불만</td>
								<td><input type="checkbox" name="service" value="컨텐츠불만" /> 컨텐츠
									불만</td>
							</tr>
						</table>
					</div>
					<div class="delete-meber-first">
						<p>3.기타의견</p>
						<textarea name="textarea" cols="40" rows="10" style="margin-left: 100px; margin-top: 20px;">
						</textarea>
					</div>
					<div class="delete-meber-first" >
						<p style="color: red;">4.구매한 전자책 구독 불가 확인</p>
						<table>
							<tr>
								<td>구매하신 전자책의 구독은 로그인을 통한 회원식별이 필요하므로<br /> 회원탈퇴하시면 더 이상
									이용이 불가능합니다. <br /> 이점을 확인하셨으면 "확인했습니다"에 체크해주세요.
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="info" value="확인" />확인했습니다.</td>
							</tr>
						</table>
					</div>
					<div class="delete-meber-first" style="text-align: center;">
						비밀번호 <input type="password" class="set-password" />
						<button class="delete btn btn-secondary">탈퇴하기</button>
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
	
	<!-- 회원탈퇴 -->
	<script src="${pageContext.request.contextPath }/assets/js/script/mypage/deletPage.js"></script>
	
	<%@ include file="../footer.jsp"%>

</body>
</html>