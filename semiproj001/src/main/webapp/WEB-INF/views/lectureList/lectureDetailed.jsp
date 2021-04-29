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
<style type="text/css">
td{
	border-bottom: 1px solid #E5E5E5;
}

th{
	border-bottom: 1px solid #E5E5E5;
}

</style>

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
                        <p>ㅇ 강의기간: ${dto.start_date} ~ ${dto.end_date} </p>
                        <p>ㅇ ${dto.lecture_subname} </p>
                        <c:if test="${mode != 'approve' }">
                        <p>ㅇ 신청현황 : ${dto.curnum}/${dto.maxnum} </p>
                        </c:if>
                        <p>ㅇ 강의소개: ${dto.lecture_detail}</p>
                        <hr>
                        <br>
                        <h6>ㅇ 강의 과정</h6>
                       	<table style="width: 100%; margin: 0px auto; padding-top:20px; border-spacing: 0px; border-bottom: 1px solid #E5E5E5">
                        	<tr>
                        		<th style="width: 100px;">
                        		 번호
                        		</th>
                        		<th>
                        		 제목
                        		</th>
                        		<th>
                        		 내용
                        		</th>
                        	</tr>
                        		<c:forEach var="dto" items="${list}">
	                        	<tr>
                        		 	<td style="width: 100px;">
	                        		${dto.content_code}
	                        		</td>
	                        		<td>
	                        		${dto.content_title}
	                        		</td>
	                        		<td>
	                        		${dto.content_detail}
	                        		</td>
                        		</tr>
	                        	</c:forEach>
                        </table>
                      
                   <div style="text-align: right; padding-top: 50px;">
                   		<c:if test="${mode!= 'approve' }">
                   		<button type="button" class="btn" style="border: 1px solid gray; margin-left: 10px;" onclick="javascript:location.href='${pageContext.request.contextPath}/lectureList/lectureList.do';">리스트</button>
                   		</c:if>
                   		<c:if test="${mode == 'approve' }">
	                   		<button type="button" class="btn" style="border: 1px solid gray; margin-left: 10px;" onclick="javascript:location.href='${pageContext.request.contextPath}/approved/list.do';">리스트</button>
	                   		<button type="button" class="btn" style="border: 1px solid gray; margin-left: 10px;" onclick="submit()">승인</button>
	                   		<button type="button" class="btn" style="border: 1px solid gray; margin-left: 10px;" onclick="deny()">거부</button>
                   		</c:if>
                   </div>     
                   <form name="sendForm" method="post">
	               <input type="hidden" name="opened_code" value="${dto.opened_code }">
	               </form> 
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


<script type="text/javascript">
	function submit(){
		var f = document.sendForm;
		f.action= "${pageContext.request.contextPath}/approved/submit.do";
		f.submit();
	}
	function deny(){
		var f = document.sendForm;
		f.action= "${pageContext.request.contextPath}/approved/deny.do";
		f.submit();
	}
</script>
</body>
</html>