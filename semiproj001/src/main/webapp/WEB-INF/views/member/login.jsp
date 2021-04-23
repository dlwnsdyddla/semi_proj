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

<div class="container">
     <section class="login-clean" style="background: rgb(241, 247, 252);">
        <form method="post">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-navigate" style="color: #07689f;"></i></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="아이디"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="비밀번호"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background: #07689f;">로그인</button></div>
        </form>
    </section>
</div>

</body>
</html>