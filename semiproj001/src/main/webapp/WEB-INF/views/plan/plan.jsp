<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Plan</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
function plan() {
	var f = document.planForm;
	
	f.action = "${pageContext.request.contextPath}/member/plan_ok.do";
	f.submit();
}
</script>
</head>
<body>
	<div class="header">
	    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
		
<div class="container py-5">
    
    <div>
        <h3 style="padding-bottom: 30px;">| 교육일정</h3>
    </div>  
  
  <div class="calendar shadow bg-white p-5">
    <div class="d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/plan/plan.do?year=${year}&month=${month-1}" style="margin: 0px 20px 0px 0px; border-radius: 4px; background-color: white;">◀︎</a>
      <h2 class="month font-weight-bold mb-0 text-uppercase">${year}년 ${month}월</h2>
        <a href="${pageContext.request.contextPath}/plan/plan.do?year=${year}&month=${month+1}" style="margin: 0px 20px 0px 20px; border-radius: 4px; background-color: white;">▶︎</a>
    </div>
    <p class="font-italic text-muted mb-5"></p>
    <ol class="day-names list-unstyled">
      <li class="font-weight-bold text-uppercase">일</li>
      <li class="font-weight-bold text-uppercase">월</li>
      <li class="font-weight-bold text-uppercase">화</li>
      <li class="font-weight-bold text-uppercase">수</li>
      <li class="font-weight-bold text-uppercase">목</li>
      <li class="font-weight-bold text-uppercase">금</li>
      <li class="font-weight-bold text-uppercase">토</li>
    </ol>

    <ol class="days list-unstyled">
      <c:forEach var="i" begin="1" end="${week-1}">
			<li class='date' style="color: gray;">${preDate}</li>
			<c:set var="preDate" value="${preDate+1}"/>
		</c:forEach>
      <c:forEach var="i" begin="1" end="${lastDate}">
			<li class='date' style="list-style-type:none;">${i}</li>
			<c:set var="week" value="${week+1}"/>
			<c:if test="${lastDate!=i && week%7==1 }">
				<c:out value="</ol><ol class='days list-unstyled'>" escapeXml="false"/>
			</c:if>
		</c:forEach>
      <c:set var="n" value="1"/>
		<c:if test="${week%7!=1}">
			<c:set var="w" value="${week%7==0?7:week%7}"/>
			<c:forEach var="i" begin="${w}" end="7">
				<li class='date' style="list-style-type:none; color: gray;">${n}</li>
				<c:set var="n" value="${n+1}"/>
			</c:forEach>
		</c:if>
    </ol>
  </div>
</div>
<div class="container">
	<div class="row" style="margin-left:-200px; padding-right: 200px;">
		<div class="timeline-centered">
    
	<article class="timeline-entry">
		
		<div class="timeline-entry-inner">
			<time class="timeline-time">
                <span>4월</span> <span>2021</span></time>
			
			<div class="timeline-icon bg-info">
				<i class="entypo-feather"></i>
			</div>
			
			<div class="timeline-label">
				<h2><a>개설강의조회</a> <span>19일</span></h2>
                <hr>
                <h2><a>수강신청</a> <span>30일</span></h2>
			</div>
		</div>
		
	</article>
            
            <article class="timeline-entry">
		
		<div class="timeline-entry-inner">
			<time class="timeline-time">
                <span>5월</span> <span>2021</span></time>
			
			<div class="timeline-icon bg-primary">
				<i class="entypo-feather"></i>
			</div>
			
			<div class="timeline-label">
				<h2><a>웹개발 종합반 개강</a> <span>3일</span></h2>
                <a style="color: #2E2E2E; font-size: 14px;">이준용 강사</a>
				<p style="margin-top: 5px;">KOD;NG의 웹개발 종합반 수업은 파이썬을 기반으로 한 수업입니다. 코딩에 대한 배경지식 없이 가볍게 수강이 가능한 수업으로 누구나 수업에 참여할 수 있습니다. 기초부터 탄탄하게 다져 다재다능한 풀스택 개발자로 거듭나세요.</p>
                <hr>
                <h2><a>앱개발 종합반 개강</a> <span>3일</span></h2>
                <a style="color: #2E2E2E; font-size: 14px;">방수지 강사</a>
				<p style="margin-top: 5px;">KOD;NG의 앱개발 종합반 수업은 iOS와 안드로이드 앱개발을 위한 기초단계의 수업입니다. 코딩에 대한 배경지식 없이 가볍게 수강이 가능한 수업으로 누구나 수업에 참여할 수 있습니다. 기초부터 탄탄하게 다져 다재다능한 어플리케이션 개발자로 거듭나세요.</p>
                <hr>
                <h2><a>AI 딥러닝 개강</a> <span>17일</span></h2>
                <a style="color: #2E2E2E; font-size: 14px;">한장희 강사</a> 
				<p style="margin-top: 5px;">KOD;NG의 AI 딥러닝 수업은 다양한 데이터를 기반으로 딥러닝 프로그렘을 구축하는 중급단계의 수업입니다. 코딩에 대한 전반적인 이해와 활용이 가능한 분들을 대상으로 진행되는 수업으로 본격적인 프로젝트 진행을 기반으로 수업이 진행됩니다. 여러분의 포트폴리오를 알차게 채워보세요.</p>
			</div>
		</div>
		
	</article>
	
	
	
	
	<article class="timeline-entry begin">
	
		<div class="timeline-entry-inner">
			
			<div class="timeline-icon" style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);">
				<i class="entypo-flight"></i>
			</div>
			
		</div>
		
	</article>
	
</div>
	</div>
</div>
<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>