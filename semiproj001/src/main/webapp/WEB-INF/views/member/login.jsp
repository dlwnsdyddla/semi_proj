<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
function login() {
	var f = document.loginForm;
	
	f.action = "${pageContext.request.contextPath}/member/login_ok.do";
	f.submit();
}
</script>

</head>
<body>
<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">
     <section class="login-clean" style="background: rgb(241, 247, 252);">
        <form name="loginForm" method="post">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-navigate" style="color: #07689f;"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="id" placeholder="아이디"></div>
            <div class="form-group"><input class="form-control" type="password" name="pwd" placeholder="비밀번호"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="login();" style="background: #07689f;">로그인</button></div>
        </form>
    </section>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>