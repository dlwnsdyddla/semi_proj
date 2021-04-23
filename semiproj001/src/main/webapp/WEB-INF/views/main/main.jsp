<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOD;NG</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/temp/assets/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/temp/assets/fonts/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/temp/assets/fonts/ionicons.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/temp/assets/css/styles.min.css" type="text/css">


</head>
<body>
<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>



<div class="container">
    <div class="body-container" style="width: 700px; padding-top: 40px;">
        <div style="padding-top: 15px;">
            메인 화면 입니다.
        </div>
    </div>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>
</html>