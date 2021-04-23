<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>article</title>

</head>
<body>

<div class="header">
    <jsp:include page="/temp/header.jsp"></jsp:include>
</div>
	
<div class="container">
    <section class="article-clean" style="background: rgb(255,255,255);">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
                    <div class="intro">
                        <h1 class="text-center" style="font-family: 'Source Sans Pro', sans-serif;">&nbsp;글 제목</h1>
                        <p class="text-center"><span class="by" style="font-family: 'Source Sans Pro', sans-serif;">by</span> <a href="#" style="font-family: 'Source Sans Pro', sans-serif;">작성자</a><span class="date" style="font-family: 'Source Sans Pro', sans-serif;">2021년 4월 23일 금요일</span></p>
                    </div>
                    <div class="text">
                        <p style="font-family: 'Source Sans Pro', sans-serif;">코딩을 전혀 접해본 적 없는 사람들이 실습 위주로 코딩을 배워서 빠른 시간 내 '혼자 무언가를 만들 수 있는 단계'에 도달하도록 만듭니다. 원리보다 동작 시킬 줄 아는 것이 중요합니다. </p>
                        <figure class="figure d-block"></figure>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>

</body>
</html>