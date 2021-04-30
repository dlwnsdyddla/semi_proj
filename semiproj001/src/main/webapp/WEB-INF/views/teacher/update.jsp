<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의등록</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
	function sendOk() {
		var f= document.lectureSubmit;

		f.action="${pageContext.request.contextPath}/teacher/update_ok.do";
		
		f.submit();
	}
	

</script>

</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="container">
	<section class="contact-clean" style="background: rgb(241,247,252);">
        <form name="lectureSubmit" method="post">
            <h2 class="text-center">${mode=='update'? '강의수정하기':'강의등록' }</h2>      	
            <div class="form-group"><input class="form-control" type="text" name="lecture_name" placeholder="강의명"  value="${dto.lecture_name}"></div>
            <div class="form-group"><input class="form-control" type="text" name="lecture_code" placeholder="강의코드입력"  value="${dto.lecture_code}"></div>
            <div class="form-group"><input class="form-control-plaintext" type="text" value=" ${sessionScope.member.id} 님" readonly="readonly" style="padding-left: 13px;"></div>
            <div class="form-group"><input class="form-control" type="text" name="lecture_subname" placeholder="부제목" value="${dto.lecture_subname}"></div>
            <div class="form-group"><textarea class="form-control" name="lecture_detail" placeholder="상세설명" rows="14" style="height: 260px;">${dto.lecture_detail}</textarea></div>
            
            <!-- 추가된부분 -->
            <table>
            	<tr>
            		<td><div class="form-group"> 강의시작일 <input class="form-control" type="date" name="start_date" value="${dto.start_date}"></div></td>
            		<td><div class="form-group"> 시작시간 <input class="form-control" type="text" name="start_time" value="${dto.start_time}"></div></td>
            	</tr>
            	<tr>
            		<td><div class="form-group"> 강의종료일 <input class="form-control" type="date" name="end_date" value="${dto.end_date}"></div></td>
            		<td><div class="form-group"> 종료시간 <input class="form-control" type="text" name="end_time" value="${dto.end_time}"></div></td>
            	</tr>
            	<tr>
            		<td><div class="form-group"> 최대 인원수 <input class="form-control" type="text" name="maxnum" value="${dto.maxnum}"></div></td>
            	</tr>
            </table>

            
            <div class="form-group"><button class="btn btn-secondary" type="button" style="background: #07689f;" onclick="sendOk();">${mode=='update'?'수정' :'등록신청'}&nbsp;</button></div>
            <div class="form-group"><button class="btn btn-secondary" type="button" style="background: #07689f;" onclick="javascript:location.href='${pageContext.request.contextPath}/regist_lecture/regist_teacher_lecturelist.do'">뒤로가기&nbsp;</button></div>
        </form>
    </section>
</div>

<div class="footer">
   <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>