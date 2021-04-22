<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<div>
	<c:if test="${not empty sessionScope.member}">
	<p>유저명 : ${sessionScope.member.member_name}</p>
	<p>타입 : ${sessionScope.member.type}</p>
	</c:if>
</div>
<div>
	<p>
		<a href="${pageContext.request.contextPath}/member/login.do "> 로그인 </a>
		&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/member/logout.do "> 로그아웃 </a>
	</p>
</div>



</body>
</html>