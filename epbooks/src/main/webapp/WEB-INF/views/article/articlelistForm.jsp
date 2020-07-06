<%@page import="com.epbooks.www.member.command.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터게시판</title>
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
	href="${pageContext.request.contextPath}/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/article.css">

<%
	String strReferer = request.getHeader("referer");

if (strReferer == null) {
%>
<script language="javascript">
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href = "${pageContext.request.contextPath}/";
</script>
<%
	return;
}
%>



</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_5.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate mb-0 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">Home <i
								class="fa fa-chevron-right"></i></a></span> <span class="mr-2"><a
							href="${pageContext.request.contextPath}/article/list">Article
								<i class="fa fa-chevron-right"></i>
						</a></span>
					</p>
					<h1 class="mb-0 bread">고객센터</h1>
				</div>
			</div>
		</div>
	</section>



	<!-- <p>Article</p> -->
	<section>
		<table style="width: 80%" border="1" id="articleTable">
			<c:if test="${articleList.hasNoArticles()}">
				<tr>
					<td colspan="7">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<thead>
				<tr>
					<td width="20px">게시글번호</td>
					<td width="40px">작성자</td>
					<td width="20px">제목</td>
					<td width="30px">작성일</td>
					<td width="30px">수정일</td>
					<td width="30px">조회수</td>
					<td width="35px">공개여부</td>
				</tr>
			</thead>

			<c:forEach var="article" items="${articleList.content}">
				<tr>
					<td id="articleNo" width="20px">${article.articleNo}</td>
					<td id="memberId" width="20px">${article.memberId }</td>
					<td width="200px" style="word-break: break-all;"><a href="#"
						class="read">${article.title }</a></td>
					<td width="20px">${article.regdate}</td>
					<td width="20px">${article.moddate}</td>
					<td width="20px">${article.readCnt}</td>
					<c:if test="${article.secret == true }">
						<td id="secret" width="20px">비공개</td>
					</c:if>
					<c:if test="${article.secret == false }">
						<td id="secret" width="20px">공개</td>
					</c:if>
				</tr>
			</c:forEach>
			<c:if test="${articleList.hasArticles()}">
				<tr>
					<td colspan="7" align="center"><c:if
							test="${articleList.startPage > 5}">
							<a href="list?pageNo=${articleList.startPage - 5}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${articleList.startPage}"
							end="${articleList.endPage}">
							<a href="list?pageNo=${pNo}">[${pNo}]</a>
						</c:forEach> <c:if test="${articleList.endPage < articleList.totalPages}">
							<a href="list?pageNo=${articleList.startPage + 5}">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="7" align="center">
					<button
						onclick="location.href='${pageContext.request.contextPath }'"
						id="commentWriteButton" class="btn btn-primary">메인</button>
					<button id="commentWriteButton" class="write btn btn-primary">게시글작성</button>
				</td>
			</tr>
		</table>
	</section>

	<script type="text/javascript">
		$(function() {
			$(".read")
					.click(
							function(event) {
								event.preventDefault();
								var no = $(this).parent().prevAll('#articleNo')
										.text();
								var secret = $(this).parent()
										.nextAll('#secret').text();
								console.log("no>>>>>>>>>>>>>>>>>>>" + no);
								console.log("no>>>>>>>>>>>>>>>>>>>" + secret);
								$
										.ajax({
											url : "${pageContext.request.contextPath }/article/secretCheck?no="
													+ no + "&secret=" + secret,
											type : "get",
											dataType : "text",
											data : {
												no : no,
												secret : secret
											},
											success : function(result) {
												console.log(">>>>>>>>>>>>>>>>",
														result);
												if ($.trim(result) == 'success') {
													location.href = "${pageContext.request.contextPath}/article/read?no="
															+ no;
												} else if ($.trim(result) == 'fail') {
													alert("비밀글 입니다.");
												} else if ($.trim(result) == 'noSecret') {
													location.href = "${pageContext.request.contextPath}/article/read?no="
															+ no;
												}
											}
										});
							});

		});

		$(function() {
			$(".write")
					.click(
							function(event) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/article/write",
											type : "get",
											success : function(result) {
												if ($.trim(result) == 'success') {
													location.href = "${pageContext.request.contextPath}/article/writeForm"
													/* location.reload(); */
												} else if ($.trim(result) == 'fail') {
													alert("로그인 후 이용가능 합니다.");
													location.href = "${pageContext.request.contextPath}/login"
												}
											}

										});

								/* } */
							});
		});
	</script>

	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<%@ include file="../footer.jsp"%>
</body>
</html>
