
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp" />
</head>
<body>
	<div class="header">
	   <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

<input class="form-control-plaintext" type="text" value="강의 목록" style="padding: 13px 0px;padding-left: 21px;font-size: 21px;font-family: 'Source Sans Pro', sans-serif;font-weight: 500;font-style: normal;">
    <div class="list-group">  
   	 <c:forEach var="dto" items="${list}" begin="0" end="10" step="1" varStatus="status">
		<a class="list-group-item list-group-item-action flex-column align-items-start" href="#">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">${dto.lecture_name}</h5><small>신청현황 : ${dto.curnum}/${dto.maxnum}</small>
            </div><input class="float-right" type="checkbox">
            <p class="mb-1">${dto.teacher_name} 강사</p>
            <p class="mb-1" style="font-size: 15px;">${dto.start_date} ~ ${dto.end_date}</p><small class="text-muted">${dto.lecture_subname}</small>
        </a>

       </c:forEach>
      </div><button class="btn btn-primary float-right" type="button" style="margin-right: 23px;margin-top: 17px;margin-bottom: 0px;background: #07689f;">수강신청</button>    

	
		 
<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
 <jsp:include page="/WEB-INF/views/layout/staticFooter.jsp" />
</body>
</html>