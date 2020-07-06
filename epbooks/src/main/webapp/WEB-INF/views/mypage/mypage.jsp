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

.mypage-info-wrap{
	display: flex; 
	flex-direction: column; 
	border: 1px solid lightgray;
	margin-bottom: 30px;
}

.order-history-table {
	width: 100%;
	
}

.order-history-table th {
	text-align: center;
	font-size: 16px;
	border-bottom: 1px solid lightgray;
}

.order-history-table tr {
	border-bottom: 1px solid lightgray;
}

.order-history-table td {
	font-size: 14px;
	padding: 20px 0 20px 0;
	/* border-right: 1px solid lightgray; */
}

.order-history-table th, td {
	/* padding: 10px; */
	text-align: center;
}

/* 쇼핑정보 관련 */
.mypage-info-second-div {
	margin: 10px 20px 10px 20px;
	
}

.categories ul li a{
	font-size: 14px;
	color: #404040;
	margin-left: 10px;

}

.top li a{
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
					<!-- first-div -->
					<div class="mypage-info-fisrt-div"
						style="background-color: #FD7B61; color:white; padding: 10px 10px 0 10px;">
						${authInfo.name }님의 쇼핑정보
					</div>

					<!-- first-div -->
					<div class="mypage-info-fisrt-div"
						style="background-color: #FDFDFB; display: flex; flex-direction: row;">
						<%-- <c:if test="${! empty authInfo}"> --%>

						<div class="mypage-info-second-div"
							id="mypage-info-second-div-member">
							<div><span>회원등급</span><br /><span>온라인멤버쉽</span></div>
							<div><span>일반</span><br /><span>일반</span></div>
							</div>
						<div class="mypage-info-second-div"
							id="mypage-info-second-div-shop"
							style="display: flex; flex-direction: row;">
							<div class="in-mypage-info-second-div" style="padding: 0 10px 0 0">
								<span>진행중 주문건</span><br /> <span>0건</span>
							</div>
							<div class="in-mypage-info-second-div">
								<span>쿠폰</span><br /><span>0장</span>
							</div>
							<div class="in-mypage-info-second-div">
								<span>적립금</span><br /><span>0원</span>
							</div>
							<div class="in-mypage-info-second-div">
								<span>전환금</span><br /><span>0원</span>
							</div>
							<div class="in-mypage-info-second-div" style="border-right: none;">
								<span>복리후생</span><br /><span>0원</span>
							</div>
						</div>
					</div>
					<%-- </c:if> --%>
				</div>



				<!-- 구매내역 리스트를 뿌려줄 부분 -->
				<div class="order-history-div">
					<table class="order-history-table">
						<tr>
							<th style="width: 100px">주문일</th>
							<th>주문번호</th>
							<th>주문수량</th>
							<th>주문금액</th>
							<th style="width: 300px;">상품정보</th>
							<th>조회</th>
							<th>비고</th>
						</tr>
						<tr>
							<c:if test="${empty resultmap}">
								<td>구매 내역이 없습니다.</td>
							</c:if>
							<c:if test="${!empty resultmap}">
								<c:forEach var="list" items="${resultmap}">
									<tr>
										<td>${list.orderdate}</td>
										<td>${list.orderlistno}</td>
										<td>${list.orderAmount}</td>
										<td>${list.pricesales * list.orderAmount}원</td>
										<td style="text-align: left; padding: 5px;">${list.title}</td>
										<td><button>상세조회</button></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:if>
						</tr>


					</table>
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
							<li><a href="${pageContext.request.contextPath }/mypage/changeMemberInfo">개인정보 수정 <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="${pageContext.request.contextPath }/change">비밀번호변경 <span class="fa fa-chevron-right"></span></a></li>
							<li><a href="${pageContext.request.contextPath }/mypage/deleteMember">회원탈퇴 <span class="fa fa-chevron-right"></span></a></li>
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
	<%@ include file="../footer.jsp"%>
</body>
</html>