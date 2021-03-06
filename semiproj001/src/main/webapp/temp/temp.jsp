<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Semi_KOD;NG</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
    <header class="header-blue">
        <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
            <div class="container-fluid"><a class="navbar-brand" href="#">KOD;NG</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#">교육소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">교육일정</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">수강신청</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">마이페이지&nbsp;</a>
                            <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                        </li>
                    </ul>
                    <form class="form-inline mr-auto" target="_self">
                        <div class="form-group mb-0"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="search"></div>
                    </form><span class="navbar-text"> <a class="login" href="index.html">로그인</a></span><a class="btn btn-light action-button" role="button" href="#">회원가입</a>
                </div>
            </div>
        </nav>
        <div class="container hero">
            <div class="row">
                <div class="col-12 col-lg-6 col-xl-5 offset-xl-1">
                    <h1>코딩, 기초부터 차근차근</h1>
                    <p>핵심 위주로 배워,<br>단기간에 결과물을 만드세요.<br>나만의 웹서비스/업무 자동화 부터<br>커리어 전환까지.&nbsp;</p><button class="btn btn-light btn-lg action-button" type="button">커리큘럼 보러가기</button>
                </div>
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder"><img src="assets/img/1024px-PyCharm_Logo.svg_.png" style="margin: -209px;transform: translate(-61px) scale(0.53);padding: 0px;">
                    <div class="phone-mockup">
                        <div class="screen"></div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section class="team-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">커리큘럼</h2>
                <p class="text-center">나에게 맞는 수업을 탐색해볼까요?</p>
            </div>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <div class="box"><img class="rounded-circle" src="assets/img/1024px-PyCharm_Logo.svg_.png">
                        <h3 class="name">웹개발 종합반</h3>
                        <p class="title">초급자</p>
                        <ul>
                            <li style="text-align: left;">코딩을 전혀 모르시거나 조금 배워보신 분 대상</li>
                            <li style="text-align: left;">나만의 웹서비스를 만들고 출시까지 한번에 도전!</li>
                            <li style="text-align: left;">코딩 왕초보 탈출!</li>
                        </ul>
                        <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="box"><img class="rounded-circle" src="assets/img/pngegg.png">
                        <h3 class="name">앱개발 종합반</h3>
                        <p class="title">초급자</p>
                        <ul>
                            <li style="text-align: left;">코딩을 전혀 모르시거나 조금 배워보신 분 대상</li>
                            <li style="text-align: left;">iOS, 안드로이드 앱을 5주만에 만들어 봅시다!</li>
                            <li style="text-align: left;">나만의 앱서비스 만들고 광고까지!</li>
                        </ul>
                        <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="box"><img class="rounded-circle" src="assets/img/76-761296_machine-learning-model-icon-hd-png-download.png" style="height: 160.391px;">
                        <h3 class="name">AI 딥러닝</h3>
                        <p class="title">중급자</p>
                        <ul>
                            <li style="text-align: left;">딥러닝/머신러닝에 입문하고 싶은신 분</li>
                            <li style="text-align: left;">유명한 모델들을 활용해서 바로 실습에 옮겨보기</li>
                            <li style="text-align: left;">대표적인 모델과 개발 꿀팁을 배워 방향성 잡기</li>
                        </ul>
                        <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="testimonials-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">후기가 증명한 KOD;NG</h2>
                <p class="text-center">이미 많은 사람들이 증명했어요!<br>&nbsp; 여러분도 도전하시고 결과물을 얻어가세요!</p>
            </div>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <div class="box">
                        <p class="description">초등학교 때부터 미술만 해서 컴퓨터랑은 거의 담쌓고 살았는데 주변에서 이렇게 단기간에 웹사이트를 만들 줄 몰랐어요.<br></p>
                    </div>
                    <div class="author"><img class="rounded-circle" src="assets/img/1.jpg">
                        <h5 class="name">최재환</h5>
                        <p class="title">말하는 감자</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="box">
                        <p class="description">코딩은 외국어랑 비슷하다고 생각해요. 코딩 한 글자라도 아는게 엄청 큰 차이를 만들 수 있다고 생각해요.</p>
                    </div>
                    <div class="author"><img class="rounded-circle" src="assets/img/3.jpg">
                        <h5 class="name">황성호</h5>
                        <p class="title">코딩 천재</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="box">
                        <p class="description">간단하지만 하나의 사이클을 배울 수 있는 곳은 KODING이 처음이었거든요. 홈페이지나 웹이나 앱에 관심있으신 분들에게 강추하고 싶어요.</p>
                    </div>
                    <div class="author"><img class="rounded-circle" src="assets/img/2.jpg">
                        <h5 class="name">우혜진</h5>
                        <p class="title">최강 조장</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer-clean">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-4 col-md-3 item">
                    <h3>KOD;NG</h3>
                    <ul>
                        <li><a href="#">홈</a></li>
                        <li><a href="#">KOD;NG교육센터</a></li>
                        <li><a href="#"></a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item">
                    <h3>지원</h3>
                    <ul>
                        <li><a href="#">강사진</a></li>
                        <li><a href="#">강사지원</a></li>
                        <li><a href="#">커리큘럼</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item">
                    <h3>고객센터</h3>
                    <ul>
                        <li><a href="#">1:1 채팅상담</a></li>
                        <li><a href="#">환불규정</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a>
                    <p class="copyright">KOD;NG © 2021</p>
                </div>
            </div>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>