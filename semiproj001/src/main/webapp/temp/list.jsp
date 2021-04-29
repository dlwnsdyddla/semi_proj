
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

</head>
<body>
	<div class="header">
	    <jsp:include page="/temp/header.jsp"></jsp:include>
	</div>
		
<input class="form-control-plaintext" type="text" value="강의 목록" style="padding: 13px 0px;padding-left: 21px;font-size: 21px;font-family: 'Source Sans Pro', sans-serif;font-weight: 500;font-style: normal;">
    <div class="list-group"><a class="list-group-item list-group-item-action flex-column align-items-start" href="#">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">${lecture_name}</h5><small>신청현황 : ${currnum}/${maxnum}</small>
            </div><input class="float-right" type="checkbox">
            <p class="mb-1">${teacher_name} 강사</p>
            <p class="mb-1" style="font-size: 15px;">${star_date} ~ ${end_date}</p><small class="text-muted">${lecture_subname}</small>
        </a><a class="list-group-item list-group-item-action flex-column align-items-start" href="#">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">앱개발 종합반</h5><small>신청현황 : 18/20</small>
            </div><input class="float-right" type="checkbox">
            <p class="mb-1">방수지 강사</p>
            <p class="mb-1" style="font-size: 15px;">5월 3일(월) ~ 5월 30일(일)</p><small class="text-muted">나만의 앱서비스 만들기</small>
        </a><a class="list-group-item list-group-item-action flex-column align-items-start" href="#">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">AI 딥러닝</h5><small>신청현황 : 18/20</small>
            </div><input class="float-right" type="checkbox">
            <p class="mb-1">한장희 강사</p>
            <p class="mb-1" style="font-size: 15px;">5월 10일(월) ~ 6월 25일(금)</p><small class="text-muted">딥러닝 왕초보 탈출!</small>
        </a></div><button class="btn btn-primary float-right" type="button" style="margin-right: 23px;margin-top: 17px;margin-bottom: 0px;background: #07689f;">수강신청</button>

<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>

</body>
</html>