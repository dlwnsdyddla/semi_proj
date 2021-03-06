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
		
		f.action="${pageContext.request.contextPath}/teacher/created_ok.do";
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
            <div class="form-group"><input class="form-control" type="text" name="lecture_name" placeholder="강의명"  value="${lecture_name}"></div>
            <div class="form-group"><input class="form-control" type="text" name="lecture_code" placeholder="강의코드입력"  value="${lecture_code}"></div>
            <div class="form-group"><input class="form-control-plaintext" type="text" value=" ${sessionScope.member.id} 님" readonly="readonly" style="padding-left: 13px;"></div>
            <div class="form-group"><input class="form-control" type="text" name="lecture_subname" placeholder="부제목" value="${lecture_subname}"></div>
            <div class="form-group"><textarea class="form-control" name="lecture_detail" placeholder="상세설명" rows="14" style="height: 260px;">${lecture_detail}</textarea></div>
            
            <div class="form-group"><button class="btn btn-secondary" type="submit" style="background: #07689f;" onclick="sendOk();">${mode=='update'?'수정' :'등록신청'}&nbsp;</button></div>
            <div class="form-group"><button class="btn btn-secondary" type="submit" style="background: #07689f;" onclick="javascript:location.href='${pageContext.request.contextPath}/regist_lecture/teacherlist.do'">뒤로가기&nbsp;</button></div>
        </form>
    </section>
</div>

<div class="footer">
   <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>