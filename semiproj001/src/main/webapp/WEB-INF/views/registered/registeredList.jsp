
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
</head>
<body>
	<div class="header">
	    <jsp:include page="/temp/header.jsp"></jsp:include>
	</div>
		
<div style="font-family: 'Source Sans Pro', sans-serif;">
	<div class="flex-column">
		<div class="justify-content-between d-flex" style="padding: 20px 20px;font-size: 21px;font-weight: 700;">
			<div>수강생 조회</div><div>${opened_code } &nbsp; ${lecture }</div>
		</div>
	</div>
	<div style="text-align:right; padding-right: 20px; padding-bottom: 5px; ">총 인원: ${dataCount }/${totalCount} (명)</div>
    <div class="list-group">
    	<c:forEach var="dto" items="${list}">
    	<div class="list-group-item list-group-item-action flex-column align-items-start" style="padding: 2rem;">
	            <div class="d-flex w-100 justify-content-between">
	                <h5 class="mb-1" style="padding-bottom: 1rem;">${dto.member_name }</h5>
	                <small>수강일자 : ${dto.registered_date }</small>
	            </div>
	        <p class="mb-1">${dto.id }</p>
	       	</div>
	    </c:forEach>
     </div>
    </div>
	<button class="btn btn-primary float-right" type="button" style="margin-right: 23px;margin-top: 17px;margin-bottom: 0px;background: #07689f;">뒤로가기</button>

<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>