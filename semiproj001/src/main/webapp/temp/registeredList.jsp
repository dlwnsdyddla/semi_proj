<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 조회</title>

</head>
<body>
	<div class="header">
	    <jsp:include page="/temp/header.jsp"></jsp:include>
	</div>

<input class="form-control-plaintext" type="text" value="수강생 조회" readonly="readonly" style="padding: 13px 0px;padding-left: 21px;font-size: 21px;font-family: 'Source Sans Pro', sans-serif;font-weight: 500;font-style: normal;">
	<div style="text-align:right; padding-right: 20px; padding-bottom: 5px;">총 인원: 3/5 (명)</div>
    <div class="list-group">
    	<div class="list-group-item list-group-item-action flex-column align-items-start" style="padding: 2rem;">
	            <div class="d-flex w-100 justify-content-between">
	                <h5 class="mb-1" style="padding-bottom: 1rem;">가가</h5>
	                <small>수강일자 : 2021-04-21</small>
	            </div>
	        <p class="mb-1">student1</p>
	       	</div>
	       	<div class="list-group-item list-group-item-action flex-column align-items-start" style="padding: 2rem;">
	            <div class="d-flex w-100 justify-content-between">
	                <h5 class="mb-1" style="padding-bottom: 1rem;">나나</h5>
	                <small>수강일자 : 2021-04-21</small>
	            </div>
	        <p class="mb-1">student2</p>
	       	</div>
	       	   	<div class="list-group-item list-group-item-action flex-column align-items-start" style="padding: 2rem;">
	            <div class="d-flex w-100 justify-content-between">
	                <h5 class="mb-1" style="padding-bottom: 1rem;">다다</h5>
	                <small>수강일자 : 2021-04-21</small>
	            </div>
	        <p class="mb-1">student3</p>
	       	</div>
     </div>
	<button class="btn btn-primary float-right" type="button" style="margin-right: 23px;margin-top: 17px;margin-bottom: 0px;background: #07689f;">뒤로가기</button>

<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>

</body>
</html>