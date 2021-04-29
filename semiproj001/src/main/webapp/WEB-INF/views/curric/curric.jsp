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
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="assets/css/KODING.css">
    <link rel="stylesheet" href="assets/css/KODNG.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
</head>
<body>
	<div class="header">
	    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
    <section class="highlight-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center" style="font-size: 48px;">KOD;NG</h2>
                <h1 style="font-size: 27px;margin-top: -23px;"><strong>미래 IT인재의 요람</strong></h1>
                <p class="text-center" style="margin-top: 49px;">KOD;NG은 다양한 컴퓨터 교육서비스를 제공하며 IT분야로 취업을 원하는 많은 취업 준비생을 취업의 길로 이끌어 온 IT전문 교육기관입니다.<br>오랜 기간 동안 축적된 교육운영 노하우를 바탕으로 체계적이고 안정적인 환경에서 전문인재 양성을 하여 1000 명 이상의 수료생을 배출하였고, 현업에서 저희 출신 IT전문가들이 다방면에서 역량을 발휘하고 있습니다.<br><br>세상의 중심에서 역량을 펼쳐 나아갈 여러분의 도전을 응원합니다.</p>
            </div>
        </div>
    </section>
    <section class="text-center bg-light features-icons">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3">
                        <div class="d-flex features-icons-icon"><i class="icon-screen-desktop m-auto text-primary" data-bss-hover-animate="pulse" style="color: #07689f;"></i></div>
                        <h3>웹개발 종합반</h3>
                        <p class="lead mb-0">효과적인 업무 생산성 향상이<br>필요하다면?</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3">
                        <div class="d-flex features-icons-icon"><i class="icon-layers m-auto text-primary" data-bss-hover-animate="pulse" style="color: #07687f;"></i></div>
                        <h3>앱개발 종합반</h3>
                        <p class="lead mb-0">어플리케이션을 통한 소통과 더불어<br>직접적인 수익 생산을 원한다면?</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3">
                        <div class="d-flex features-icons-icon"><i class="icon-organization m-auto text-primary" data-bss-hover-animate="pulse"></i></div>
                        <h3>AI 딥러닝</h3>
                        <p class="lead mb-0">필요한 데이터를 직접 추출하고.<br>분석하길 원한다면?</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="showcase">
        <div class="container-fluid p-0">
            <div class="row no-gutters">
                <div class="col-lg-6 text-white order-lg-2 showcase-img" style="background-image:url(&quot;temp3/assets/img/bg-showcase-2.jpg&quot;);"><span></span></div>
                <div class="col-lg-6 my-auto order-lg-1 showcase-text">
                    <h2>왕초보도 충분히 수강가능</h2>
                    <p class="lead mb-0">비개발자 대상의 핵심만 담은 축약형 강의,<br>고객 니즈에 맞춘 커리큘럼 제작</p>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-lg-6 text-white showcase-img" style="background-image:url(&quot;temp3/assets/img/bg-showcase-1.jpg&quot;);"><span></span></div>
                <div class="col-lg-6 my-auto order-lg-1 showcase-text">
                    <h2>90%의 완주율</h2>
                    <p class="lead mb-0">튜터와 매니저의 지속적 관리, 소통으로<br>&nbsp;B2B 완주율 90%, B2C 완주율 70% 기록<br>(업계 대비 5배 이상)</p>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-lg-6 text-white order-lg-2 showcase-img" style="background-image:url(&quot;temp3/assets/img/bg-showcase-3.jpg&quot;);"><span></span></div>
                <div class="col-lg-6 my-auto order-lg-1 showcase-text">
                    <h2>튜터와 함께하는 현업 적용</h2>
                    <p class="lead mb-0">실질적 업무 활용을 위한 SKILL SET 획득,<br>업무 역량 성장과 직결되는 시각적 결과물</p>
                </div>
            </div>
        </div>
    </section>
    <section class="text-center bg-light testimonials">
        <div class="container">
            <h2 class="mb-5">KOD;NG 만의 강의 원칙</h2>
            <div class="row">
                <div class="col-lg-4">
                    <div class="mx-auto testimonial-item mb-5 mb-lg-0"><img class="rounded-circle img-fluid mb-3" src="temp3/assets/img/istockphoto-1220923558-170667a.jpeg">
                        <h5>핵심만 짚은 압축 강의</h5>
                        <p class="font-weight-light mb-0">협업 개발자 튜터의 노하우와 함께 6개월의 강의를 핵심만 쑥쑥 뽑아 5주에 담았어요.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="mx-auto testimonial-item mb-5 mb-lg-0"><img class="rounded-circle img-fluid mb-3" src="temp3/assets/img/free-icon-eye-1536593.png">
                        <h5>눈에 보이는 결과물</h5>
                        <p class="font-weight-light mb-0">지금 내가 필요한 지식 위주로 얻고, 주차별 실습 과제를 통해 눈에 보이는 결과물을 만드세요.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="mx-auto testimonial-item mb-5 mb-lg-0"><img class="rounded-circle img-fluid mb-3" src="temp3/assets/img/free-icon-boat-porthole-440118.png">
                        <h5>지속적 강의 개선</h5>
                        <p class="font-weight-light mb-0">수강생 피드백을 바탕으로 한 지속적인 재촬영과 강의 업데이트! 이제 가장 최신의 커리큘럼으로 공부하세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="temp3/assets/js/jquery.min.js"></script>
    <script src="temp3/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="temp3/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="temp3/assets/js/Simple-Slider.js"></script>
<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>