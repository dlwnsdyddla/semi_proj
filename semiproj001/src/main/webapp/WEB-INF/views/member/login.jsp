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

<script type="text/javascript">
function login() {
	var f = document.loginForm;
	
	f.action = "${pageContext.request.contextPath}/member/login_ok.do";
	f.submit();
}
</script>

</head>
<body>

<div>
	<form name="loginForm" method="post">
		<p> id : <input type="text" name="id"> </p>
		<p> pwd : <input type="text" name="pwd"> </p>
		<button type="button" onclick="login();"> 로그인 </button> ${message}
	</form>
</div>

</body>
</html>