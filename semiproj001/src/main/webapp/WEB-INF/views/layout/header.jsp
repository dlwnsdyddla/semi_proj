<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>header</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lora">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
	<header class="header-blue" style="height: 81px; padding: 0px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">KOD;NG</a>
				<button data-toggle="collapse" class="navbar-toggler"
					data-target="#navcol-1">
					<span class="sr-only">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">교육소개</a></li>
						<li class="nav-item"><a class="nav-link" href=" ${pageContext.request.contextPath}/plan/plan.do">교육일정</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/lectureList/lectureList.do">수강신청</a></li>
						<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-toggle="dropdown" href="#">마이페이지&nbsp;</a>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${sessionScope.member.type=='s'}">
										<a class="dropdown-item" href="${pageContext.request.contextPath}/regist_lecture/regist_lecturelist.do">내 강의실</a>
									</c:when>
									<c:when test="${sessionScope.member.type=='t'}">
										<a class="dropdown-item" href="${pageContext.request.contextPath}/regist_lecture/regist_teacher_lecturelist.do">강의리스트조회</a>	
									</c:when>
									<c:when test="${sessionScope.member.type=='a'}">
										<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberList.do">회원리스트</a>
										<a class="dropdown-item" href="${pageContext.request.contextPath}/regist_lecture/regist_admin_lecturelist.do">전체 강의리스트조회</a>
										<a class="dropdown-item" href="${pageContext.request.contextPath}/approved/list.do">강의 개설 관리</a>
									</c:when>
								</c:choose>
								<c:if test="${not empty sessionScope.member}">
									<a class="dropdown-item" href="#">게시물 관리</a>
									<a class="dropdown-item"href="${pageContext.request.contextPath}/member/changePwd.do">패스워드 변경</a>
									<a class="dropdown-item"href="${pageContext.request.contextPath}/member/resign.do">회원탈퇴</a>
								</c:if>
							</div>
						</li>
					</ul>
					<form class="form-inline mr-auto" target="_self">
						<div class="form-group mb-0">
							<label for="search-field"><i class="fa fa-search"></i></label><input
								class="form-control search-field" type="search"
								id="search-field" name="search">
						</div>
					</form>
					<c:choose>
						<c:when test="${empty sessionScope.member}">
							<span class="navbar-text"><a class="login"
								href="${pageContext.request.contextPath}/member/login.do">로그인</a></span>
							<a class="btn btn-light action-button" role="button"
								href="${pageContext.request.contextPath}/member/member.do">회원가입</a>
						</c:when>
						<c:otherwise>
							<span class="navbar-text">
								${sessionScope.member.member_name} </span> &nbsp;
                    		<c:choose>
								<c:when test="${sessionScope.member.type == 's'}">
									<span class="navbar-text"> 학생님 </span>&nbsp;&nbsp; </c:when>
								<c:when test="${sessionScope.member.type == 't'}">
									<span class="navbar-text"> 강사님 </span>&nbsp;&nbsp; </c:when>
								<c:when test="${sessionScope.member.type == 'a'}">
									<span class="navbar-text"> 님 </span>&nbsp;&nbsp; </c:when>
							</c:choose>
							<a class="btn btn-light action-button" role="button"
								href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>