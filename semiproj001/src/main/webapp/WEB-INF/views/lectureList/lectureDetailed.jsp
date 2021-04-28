<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lecture</title>
	<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="container">
    <section class="article-clean" style="background: rgb(255,255,255);">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
                    <div class="intro">
                        <h1 class="text-center" style="font-family: 'Source Sans Pro', sans-serif;">&nbsp;${dto.lecture_name}</h1>
                        <p class="text-center"><span style="font-family: 'Source Sans Pro', sans-serif;">${dto.opened_code}</span></p>
                        <p class="text-center"><span class="by" style="font-family: 'Source Sans Pro', sans-serif;">by</span> <span style="font-family: 'Source Sans Pro', sans-serif;">강사명: ${dto.teacher_name}</span><span class="date" style="font-family: 'Source Sans Pro', sans-serif;">2021년 4월 30일 금요일</span></p>
                    </div>
                    <div class="text" style="font-family: 'Source Sans Pro', sans-serif;">
                    	<hr>
                        <p>강의기간: ${dto.start_date} ~ ${dto.end_date} </p>
                        <p>${dto.lecture_subname} </p>
                        <p>신청현황 : ${dto.curnum}/${dto.maxnum} </p>
                        <hr>
                        <p>강의소개: ${dto.lecture_detail}</p>
                        
                   <div style="text-align: right">
                   		<button type="button" class="btn" style="border: 1px solid gray" onclick="javascript:location.href='${pageContext.request.contextPath}/lectureList/lectureList.do?${query}';">리스트</button>
                   
                   </div>     
                        <figure class="figure d-block"></figure>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>