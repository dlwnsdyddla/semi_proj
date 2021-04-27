
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

</head>
<body>
	<div class="header">
	    <jsp:include page="/temp/header.jsp"></jsp:include>
	</div>
		
<div style="font-family: 'Source Sans Pro', sans-serif;">
	<div class="flex-column">
		<div class="d-flex" style="padding: 20px 20px;font-size: 21px;font-weight: 700; justify-content: flex-left;">
			<div>강의 신청 허가</div>
		</div>
	</div>
	<div style="text-align:right; padding-right: 20px; padding-bottom: 5px; ">
    <div class="list-group">
    	<!-- c:forEach var="dto" items="${list}" -->
    	<div class="list-group-item list-group-item-action flex-column align-items-start" style="padding: 2rem;">
	            <div class="d-flex w-100 justify-content-between">
	                <h5 class="mb-1" style="padding-bottom: 1rem;">자바개론</h5>
	                <div>
	                	 <p class="mb-1">방수지 강사</p>
            			<p class="mb-1" style="font-size: 15px;">5월 3일(월) ~ 5월 30일(일)</p>
            			<small class="text-muted">나만의 앱서비스 만들기</small></div>
	                </div>
	            </div>
	       
     </div>
    </div>
</div>
<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>

</body>
</html>