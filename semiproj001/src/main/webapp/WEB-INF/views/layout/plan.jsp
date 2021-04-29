<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Calendar cal=Calendar.getInstance();

	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	
	String sy=request.getParameter("year"); // year로 넘어오는것이 없으면 null
	String sm=request.getParameter("month");
	if(sy!=null) {
		year=Integer.parseInt(sy);
	}
	if(sm!=null) {
		month=Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1); //y년 m월 1일로 날짜 객체 설정
	year=cal.get(Calendar.YEAR);
	month=cal.get(Calendar.MONTH)+1;
	
	int lastDay=cal.getActualMaximum(Calendar.DATE);
	int week=cal.get(Calendar.DAY_OF_WEEK); // 일(1)~토(7)
	
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("lastDay", lastDay);
	pageContext.setAttribute("week", week);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Plan</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4-Calendar-No-Custom-Code.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Calendar.css">
    <link rel="stylesheet" href="assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="assets/css/Forum---Thread-listing-1.css">
    <link rel="stylesheet" href="assets/css/Forum---Thread-listing.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="assets/css/MUSA_timeline-1.css">
    <link rel="stylesheet" href="assets/css/MUSA_timeline.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Team-Boxed.css">
    <link rel="stylesheet" href="assets/css/Testimonials.css">
    <link rel="stylesheet" href="assets/css/User-Tasks-and-User-Activity-Streams---List-Group-Component.css">
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
</head>
<body>
	<div class="header">
	    <jsp:include page="/temp/header.jsp"></jsp:include>
	</div>
		
<div class="container py-5">
    
    <div>
        <h3 style="padding-bottom: 30px;">| 교육일정</h3>
    </div>  
  
  <div class="calendar shadow bg-white p-5">
    <div class="d-flex align-items-center">
    	<c:url var="pre" value="plan.jsp">
			<c:param name="year" value="${year}"/>
			<c:param name="month" value="${month-1}"/>
		</c:url>
		<c:url var="next" value="plan.jsp">
			<c:param name="year" value="${year}"/>
			<c:param name="month" value="${month+1}"/>
		</c:url>
				
        <a href="${pre}" style="margin: 0px 20px 0px 0px; border-radius: 4px; background-color: white;">◀︎</a>
      <h2 class="month font-weight-bold mb-0 text-uppercase">${year}년 ${month}월</h2>
        <a href="${next}" style="margin: 0px 20px 0px 20px; border-radius: 4px; background-color: white;">▶︎</a>
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
      <li class="outside">
        <div class="date">28</div>
      </li>
      <li class="outside">
        <div class="date">29</div>
      </li>
      <li class="outside">
        <div class="date">30</div>
      </li>
      <li class="outside">
        <div class="date">31</div>
      </li>
      <li>
        <div class="date">1</div>
      </li>
      <li>
        <div class="date">2</div>
      </li>
      <li>
        <div class="date">3</div>
      </li>
      <li>
        <div class="date">4</div>
      </li>
      <li>
        <div class="date">5</div>
      </li>
      <li>
        <div class="date">6</div>
      </li>
      <li>
        <div class="date">7</div>
      </li>
      <li>
        <div class="date">8</div>
      </li>
      <li>
        <div class="date">9</div>
      </li>
      <li>
        <div class="date">10</div>
      </li>
      <li>
        <div class="date">11</div>
      </li>
      <li>
        <div class="date">12</div>
      </li>
      <li>
        <div class="date">13</div>
      </li>
      <li>
        <div class="date">14</div>
      </li>
      <li>
        <div class="date">15</div>
      </li>
      <li>
        <div class="date">16</div>
      </li>
      <li>
        <div class="date">17</div>
      </li>
      <li>
        <div class="date">18</div>
      </li>
      <li>
        <div class="date">19</div>
        <div class="event bg-info">개설강의조회</div>
      </li>
      <li>
        <div class="date">20</div>
      </li>
      <li>
        <div class="date">21</div>
      </li>
      <li>
        <div class="date">22</div>
      </li>
      <li>
        <div class="date">23</div>
      </li>
      <li>
        <div class="date">24</div>
      </li>
      <li>
        <div class="date">25</div>
      </li>
      <li>
        <div class="date">26</div>
      </li>
      <li>
        <div class="date">27</div>
      </li>
      <li>
        <div class="date">28</div>
      </li>
      <li>
        <div class="date">29</div>
      </li>
      <li>
        <div class="date">30</div>
        <div class="event bg-primary">수강신청</div>
      </li>
      <li class="outside">
        <div class="date">1</div>
      </li>
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
                <a style="color: #2E2E2E; font-size: 14px;">이준용</a>
				<p style="margin-top: 5px;">KOD;NG의 웹개발 종합반 수업은 파이썬을 기반으로 한 수업입니다. 코딩에 대한 배경지식 없이 가볍게 수강이 가능한 수업으로 누구나 수업에 참여할 수 있습니다. 기초부터 탄탄하게 다져 다재다능한 풀스택 개발자로 거듭나세요.</p>
                <hr>
                <h2><a>앱개발 종합반 개강</a> <span>3일</span></h2>
                <a style="color: #2E2E2E; font-size: 14px;">방수지</a>
				<p style="margin-top: 5px;">KOD;NG의 앱개발 종합반 수업은 iOS와 안드로이드 앱개발을 위한 기초단계의 수업입니다. 코딩에 대한 배경지식 없이 가볍게 수강이 가능한 수업으로 누구나 수업에 참여할 수 있습니다. 기초부터 탄탄하게 다져 다재다능한 어플리케이션 개발자로 거듭나세요.</p>
                <hr>
                <h2><a>AI 딥러닝 개강</a> <span>17일</span></h2>
                <a style="color: #2E2E2E; font-size: 14px;">한장희</a> 
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