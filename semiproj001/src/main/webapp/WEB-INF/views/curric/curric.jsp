<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Curric</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<jsp:include page="/WEB-INF/views/layout/curricCss.jsp"/>
</head>
<body>
	<div class="header">
	    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
    <section class="features-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center" style="font-size: 58px;padding-top: 59px;font-family: 'Source Sans Pro', sans-serif;font-style: normal;font-weight: bold;">KOD;NG</h2>
                <p style="text-align: center;margin: 31px;font-size: 21px;color: rgb(77,82,85);">미래 IT인재의 요람</p>
                <p class="text-center">실무경력을 갖춘&nbsp;우수한 강사진으로&nbsp;한국형 코딩 인재를 양성합니다.<br>-<br>Koding은 다양한 컴퓨터 교육서비스를 제공하며 IT분야로 취업을 원하는 많은 취업 준비생을 취업의 길로 이끌어 온 IT전문 교육기관입니다.<br>오랜 기간 동안 축적된 교육운영 노하우를 바탕으로 체계적이고 안정적인 환경에서 전문인재 양성을 하여 1000 명 이상의 수료생을 배출하였고, 현업에서 저희 출신 IT전문가들이 다방면에서 역량을 발휘하고 있습니다.<br><br>세상의 중심에서 역량을 펼쳐 나아갈 여러분의 도전을 응원합니다.</p>
            </div>
            <div class="row justify-content-center features">
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-desktop icon" style="color: rgb(7,104,159);"></i>
                        <h3 class="name"><strong>웹개발 종합반</strong></h3>
                        <p class="description">효과적인 업무 생산성 향상이<br>필요하다면?</p><a class="learn-more" href="${pageContext.request.contextPath}/member/login.do">수강신청 하러가기 »</a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-pinterest icon" style="color: rgb(7,104,159);"></i>
                        <h3 class="name"><strong>앱개발 종합반</strong></h3>
                        <p class="description">어플리케이션을 통한 소통과 더불어<br>직접적인 수익 생산을 원한다면?</p><a class="learn-more" href="${pageContext.request.contextPath}/member/login.do">수강신청 하러가기 »</a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-puzzle-piece icon" style="color: rgb(7,104,159);"></i>
                        <h3 class="name"><strong>AI 딥러닝</strong></h3>
                        <p class="description">필요한 데이터를 직접 추출하고.<br>분석하길 원한다면?</p><a class="learn-more" href="${pageContext.request.contextPath}/member/login.do">수강신청 하러가기 »</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="team-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">KOD;NG 만의 강의 원칙</h2>
                <p class="text-center">튜터와 매니저의 지속적 관리, 소통으로<br>&nbsp;B2B 완주율 90%, B2C 완주율 70% 기록<br>(업계 대비 5배 이상)</p>
            </div>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <h3 class="name"><strong>핵심만 짚은 압축 강의</strong></h3>
                    <p class="title">유능한 강사진</p>
                    <p class="description">협업 개발자 튜터의 노하우와 함께 6개월의 강의를 핵심만 쑥쑥 뽑아 5주에 담았어요. </p>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <h3 class="name"><strong>눈에 보이는 결과물</strong></h3>
                    <p class="title">프로젝트 포트폴리오</p>
                    <p class="description">지금 내가 필요한 지식 위주로 얻고, 주차별 실습 과제를 통해 눈에 보이는 결과물을 만드세요. </p>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <h3 class="name"><strong>지속적 강의 개선</strong></h3>
                    <p class="title">적극적 피드백</p>
                    <p class="description">수강생 피드백을 바탕으로 한 지속적인 재촬영과 강의 업데이트! 이제 가장 최신의 커리큘럼으로 공부하세요. </p>
                </div>
            </div>
        </div>
    </section>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>