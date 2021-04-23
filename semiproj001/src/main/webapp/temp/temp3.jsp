<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>KOD;NG</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
</head>

<body>
	<div class="header">
	    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
        <section>
         <div class="container">
         	<br> 
         	<p> 메인내용입니다 </p>
         </div>
        </section>
	<div class="footer">
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>

</html>