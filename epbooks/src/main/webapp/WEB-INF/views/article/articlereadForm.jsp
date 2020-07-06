<%@page import="com.epbooks.www.member.command.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("정상적인 경로를 통해 다시 접근해 주십시오.");
  document.location.href="${pageContext.request.contextPath}/";
 </script>
<%
  return;
 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/article.css">
</head>
<body>
	<header><%@ include file="../header.jsp"%></header>
	<!-- 	<p>게시글 상세보기</p> -->

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

	<table width = "100px" style="word-break:break-all;">
		<tr>
			<td width="30%">번호</td>
			<td>${read.articleNo}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${read.memberId}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${read.title}</td>
		</tr>
		<tr style="width: 200px">
			<td>내용</td>
			<td style="padding: 10px">${read.content}</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="목록" class="btn btn-primary" onclick="listgo();"/>
			<!-- 글쓴이만 수정, 삭제가 가능하도록 함. 
		세션에 붙여넣은 User객체의 id와 게시글작성자의 id가 같을경우에만 진입 가능  --> 
		<c:if test="${read.memberId == authInfo.memberId}">
					<%-- <a href="modify?no=${read.articleNo}" class="articleButton">게시글수정</a> --%>
					<%-- <a href="delete?no=${read.articleNo}">[게시글삭제]</a> --%>
					<input type="button" value="수정" class="btn btn-primary" onclick="mod(${read.articleNo})"/>
					<input type="button" value="삭제" class="btn btn-danger" onclick="del(${read.articleNo})"/>
					
				</c:if>
				
				</td>
		</tr>
	</table>


	<div id="comment">
		<ol class="commentList">
			<c:forEach var="commentList" items="${commentList}"	varStatus="status">
				<div id="comment">
					<p>
						<span style="word-spacing: 40px">
						<%-- ${status.count}번 댓글 : ${status.current.commentNo}:  --%>
						${commentList.adminId}: ${commentList.commentContent}</span><span style="font-size: 12px; margin-left: 20px;">${commentList.commentDate}</span> 
						<span><input class="commentNo" type="text" hidden="" value="${status.current.commentNo}"></span>
						<%-- <p class="commentNo">${commentList.commentNo}</p> --%>
						<button class="commentDelete">댓글삭제</button>
					</p>
				</div>
			</c:forEach>
		</ol>
	</div>
		<!-- 관리자로 로그인했을때만 댓글작성칸이 보임 -->
		<%-- <c:if test="${authInfo.memberId != null}"> --%>
		<c:if test="${adminAuthInfo.adminId != null}">
			<div align="center" style="padding: 40px">
				<label for="adminId">댓글 작성자</label>
				<input type="text" id="adminId"	name="adminId" value="${adminAuthInfo.adminId}"  size="10px" readonly="readonly" />
				<!-- ${adminInfo.adminId}로 바꿔주기 -->
				<label for="commentContent">댓글 내용</label>
				<input type="text" id="commentContent" name="commentContent" size="80px" maxlength="100"/>
				<button class="commentWrite">댓글작성</button>
			</div>
		</c:if>

	<script type="text/javascript">
		//목록
		function listgo() {
		location.href = "list";
	} 
		//게시글 삭제
	 	function del(articleNo) {
			var aNo = confirm("정말 삭제하시겠습니까?");
			if(aNo){location.href = "delete?no=${read.articleNo}";
			}
		} 
		
		//게시글 수정
	 	function mod(articleNo) {
			location.href = "modify?no=${read.articleNo}";
		} 
		//댓글쓰기	
		$(function() {
			$(".commentWrite").click(function(event) {
				var articleNo = ${read.articleNo};
				var content = $('#commentContent').val();
				var adminId = $('#adminId').val();
				console.log(articleNo);
				console.log(content);
				console.log(adminId);

				$.ajax({
					url : "/www/article/commentWrite",
					type : "post",
					dataType : "text",
					data : {
						articleNo : articleNo,
						content : content,
						adminId : adminId
					},
					success : function(result) {
						console.log(">>>>>>>>>>>>>>>>", result);
						if ($.trim(result) == 'success') {
							if (confirm("댓글이 등록되었습니다.")) {
								location.reload();
							}
						} else {
							alert($.trim(result));
						}
					}
				});
			});
		});
		
		//댓글 삭제 : 맨위에 댓글이 삭제됨..
		$(function() {
			$(".commentDelete").click(function(event) {
				var commentNo = $('.commentNo').val();
				/* var commentNo = ${status.current.commentNo}; */
					console.log(commentNo);

				$.ajax({
					url : "/www/article/commentDelete",
					type : "post",
					dataType : "text",
					data : {
						commentNo : commentNo
					},
					success : function(result) {
						console.log(">>>>>>>>>>>>>>>>", result);
						if ($.trim(result) == 'success') {
							if (confirm("댓글이 삭제하시겠십니까?")) {
								location.reload();
							}
						} else {
							alert($.trim(result));
						}
					}
				});
			});
		});
	
	</script>
	<%-- <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> --%>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery-migrate-3.0.1.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.stellar.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.animateNumber.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/scrollax.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<%@ include file="../footer.jsp"%>
</body>
</html>
