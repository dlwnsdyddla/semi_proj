<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LOGIN</title>
    <link rel="stylesheet" href="temp/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="temp/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="temp/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="temp/assets/css/styles.min.css">

</head>
<body>
	<div class="header">
	    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
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

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

    <script src="temp/assets/js/jquery.min.js"></script>
    <script src="temp/assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>