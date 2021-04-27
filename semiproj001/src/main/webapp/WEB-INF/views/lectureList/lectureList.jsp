
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp" />
<script type="text/javascript">
	function searchList() {
		var f = documenet.searchForm;
		f.submit;
	}
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<input class="form-control-plaintext" type="text" value="강의 목록"
		style="padding: 13px 0px; padding-left: 21px; font-size: 21px; font-family: 'Source Sans Pro', sans-serif; font-weight: 500; font-style: normal;">
	<div class="list-group">
		<a
			class="list-group-item list-group-item-action flex-column align-items-start"
			href="#"> <c:forEach var="dto" items="${list}">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1">강의명: ${dto.lecture_name}</h5>
					<small>신청현황 : ${dto.curnum}/${dto.maxnum}</small>
				</div>
				<input class="float-right" type="checkbox">
				<p class="mb-1">강사명: ${dto.teacher_name} </p>
				<p class="mb-1" style="font-size: 15px;">강의기간: ${dto.start_date} ~ ${dto.end_date}</p>
				<small class="text-muted">강의상세: ${dto.lecture_subname}</small>
				<button class="btn btn-primary float-right" type="button" style="background: #1F90A3; border-color: #1F90A3" onclick="javascript:location.href='${pageContext.request.contextPath}/lectureList/lectureDetailed.do';">자세히</button> 
			
				<hr>
			</c:forEach>

		</a>

	</div>
	
	<div class="paging" style="padding: 15px;">
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">
				${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		</tr>
	</table>
	</div>
	
	<div class="form" style="padding: 15px;">
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	 <tr height="40">
		<td align="left" width="100">
			<button class="btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/lectureList/lectureList.do';"
			style="background: gray; color: white">새로고침</button>
		</td>
	
		<td align="center">
			<form name="searchForm" action="${pageContext.request.contextPath}/lectureList/lectureList.do" method="post">
				<select name="condition" class="selectField">
					<option value="lecture_name" ${condition=="lecture_name"?"selected='selected'":""}>강의명</option>
					<option value="teacher_name" ${condition=="teacher_name"?"selected='selected'":""}>강사명</option>
				</select>
				<input type="text" name="keyword" class="boxTF" style="height: 25px">
				<button type="button" class="btn" onclick="searchList()" style="border: 1px solid gray; height: 25px; padding: 0px; vertical-align: top;">검색</button>
			</form>
		</td>	
	<td align="right" width="100">
		<button class="btn" type="button" style="background: #07689f; color: white">수강신청</button>
	</td>
	</tr>
</table>
</div>


	<div class="footer">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp" />
</body>
</html>