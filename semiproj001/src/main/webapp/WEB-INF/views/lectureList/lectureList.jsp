
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
		var f = document.searchForm;
		f.submit();
	}
	
	function lecture_ok() {
		var f = document.lectureForm;
		
		if(f.opened_code == undefined) {
			return;
		}
		
		var cnt=0;
		if(f.opened_code.length!=undefined) {
			for(var i=0; i<f.opened_code.length; i++) {
				if(f.opened_code[i].checked) cnt++;
			}
		} else {
			if(f.nums.checked) cnt++;
		}
		
		if(cnt<1) {
			alert("수강신청할 강의를 선택하세요");
			return;
		}
		
		if(confirm("선택한 강의를 수강신청하시겠습니까 ?")) {
			f.action = "${pageContext.request.contextPath}/lectureList/register.do";
			f.submit();
			
		}
	}
	
	
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<input class="form-control-plaintext" type="text" value="강의 목록"
		style="padding: 13px 0px; padding-left: 21px; font-size: 21px; font-family: 'Source Sans Pro', sans-serif; font-weight: 500; font-style: normal;">
		
	<form name="lectureForm">	
	<div class="list-group">
		<c:forEach var="dto" items="${list}">
		<div class="list-group-item list-group-item-action flex-column align-items-start">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1">강의명: ${dto.lecture_name}</h5>
					<c:if test="${mode == 'update' }">
					<small>신청현황 : ${dto.curnum}/${dto.maxnum}</small>
					</c:if>
				</div>
				<c:if test="${sessionScope.member.type == 's'}">
					<input class="float-right" type="checkbox" name="opened_code" value="${dto.opened_code}">
				</c:if>
				<p class="mb-1">강사명: ${dto.teacher_name} </p>
				<p class="mb-1" style="font-size: 15px;">강의기간: ${dto.start_date} ~ ${dto.end_date}</p>
				<small class="text-muted">${dto.lecture_subname}</small>
				<button class="btn btn-primary float-right" type="button" style="background: #1F90A3; border-color: #1F90A3" onclick="javascript:location.href='${articleUrl}&opened_code=${dto.opened_code}'">자세히</button> 
				</div>
			</c:forEach>
	</div>
	<input type="hidden" name="student_id" value="${sessionScope.member.id}">
	</form>
	
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
			<c:if test="${mode == 'register' }">
			<button class="btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/lectureList/lectureList.do';"
			style="background: gray; color: white">새로고침</button>
			</c:if>
			<c:if test="${mode == 'approve' }">
			<button class="btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/approved/list.do';"
			style="background: gray; color: white">새로고침</button>
			</c:if>
		</td>
	<c:if test="${mode == 'register' }">
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
	</c:if>	
	<td align="right" width="100">
	<c:if test="${sessionScope.member.type == 's' && mode == 'register' }">
		<button class="btn" type="button" style="background: #07689f; color: white" onclick="lecture_ok();">수강신청</button>
	</c:if>
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