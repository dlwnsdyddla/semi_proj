<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});
</script>

<div class="header-top">
    <div class="header-left">
        <p style="margin: 2px;">
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
                <span style="width: 200px; height: 70; position: relative; left: 0; top:20px; color: white; filter: mask(color=red) shadow(direction=135) chroma(color=red);font-style: italic; font-family: arial black; font-size: 30px; font-weight: bold;">KOD;NG</span>
            </a>
        </p>
    </div>
    <div class="header-right">
        <div style="padding-top: 20px;  float: right;">
            <c:if test="${empty sessionScope.member}">
                <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
                    &nbsp;|&nbsp;
                <a href="#">회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue;">${sessionScope.member.userName}</span>님
                    &nbsp;|&nbsp;
                    <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
                    &nbsp;|&nbsp;
                    <a href="#">정보수정</a>
            </c:if>
        </div>
    </div>
</div>

<div class="menu">
    <ul class="nav">
        <li>
            <a href="#">교육안내</a>
            <ul>
                <li><a href="#">교육기관소개</a></li>
            </ul>
        </li>
			
        <li>
            <a href="#">교육일정</a>
            <ul>
                <li><a href="#">캘린더</a></li>
            </ul>
        </li>

        <li>
            <a href="#">수강신청</a>
            <ul>
                <li><a href="#">프로그래밍 강좌</a></li>
            </ul>
        </li>

        <li>
            <a href="#">학습하기</a>
            <ul>
                <li><a href="#">강의목록</a></li>
            </ul>
        </li>
        
        <li>
            <a href="#">커뮤니티</a>
            <ul>
                <li><a href="#">질문과 답변</a></li>
            </ul>
        </li>
        
        <c:if test="${not empty sessionScope.member}">
        <li>
            <a href="#">마이페이지</a>
            <ul>
                <li><a href="#" style="margin-left:230px; " onmouseover="this.style.marginLeft='150px';">회원 관리</a></li>
                <li><a href="#">강의 관리</a></li>
                <li><a href="#">게시판 관리</a></li>
            </ul>
        </li>
        </c:if>
        
        <c:if test="${not empty sessionScope.student}">
        <li>
            <a href="#">마이페이지</a>
            <ul>
                <li><a href="#" style="margin-left:230px; " onmouseover="this.style.marginLeft='150px';">내정보관리</a></li>
                <li><a href="#">내 강의실</a></li>
                <li><a href="#">캘린더</a></li>
            </ul>
        </li>
        </c:if>
        
        <c:if test="${not empty sessionScope.tutor}">
        <li>
            <a href="#">마이페이지</a>
            <ul>
                <li><a href="#" style="margin-left:230px; " onmouseover="this.style.marginLeft='150px';">내정보관리</a></li>
                <li><a href="#">강의 관리</a></li>
                <li><a href="#">캘린더</a></li>
            </ul>
        </li>
        </c:if>
    </ul>      
</div>
<div class="navigation">
	<div class="nav-bar"></div>
</div>