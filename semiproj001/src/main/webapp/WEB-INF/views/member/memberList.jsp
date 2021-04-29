
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
function selectList(type) {
	var url = '${pageContext.request.contextPath}/member/memberList.do';
	var query = "type="+type;
	location.href=url+"?"+query;
}

</script>
</head>
<body>
	<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	<div>
	<table>
		<tr>
			<td><button class="btn ${type=='all'?'btn-primary':'btn-default'}" onclick="selectList('all');">전체</button></td>
			<td><button class="btn ${type=='s'?'btn-primary':'btn-default'}" onclick="selectList('s');">학생</button></td>
			<td><button class="btn ${type=='t'?'btn-primary':'btn-default'}" onclick="selectList('t');">강사</button></td>
		</tr>
	</table>
	</div>
	
    <div class="list-group">
    	<c:forEach var="dto" items="${list}">
    	<div class="list-group-item list-group-item-action flex-column align-items-start">
    	
    	<table>
    		<tr>
    			<td><img src="${pageContext.request.contextPath}/uploads/memberImages/${dto.member_picture_filename}" style="vertical-align: middle;" width="120" height="140"></td>
    			<td>&nbsp;&nbsp;&nbsp;</td>
    			<td>
    				<h5 class="mb-1">
          		    <c:if test="${dto.type == 'a'}">${dto.member_name}</c:if>
					<c:if test="${dto.type == 's'}">${dto.member_name} 학생님 </c:if>
					<c:if test="${dto.type == 't'}">${dto.member_name} 강사님 </c:if>
          			</h5>
          			<br>
            		<p class="mb-1">아이디 : ${dto.id}</p>
            		<small class="text-muted">
           			<c:if test="${dto.type == 's' || dto.type =='t'}">활동시작일 : ${dto.registered} <br>정보수정일 : ${dto.changed} </c:if>
           			<c:if test="${dto.type == 'd'}">탈퇴일 : ${dto.resigned}</c:if>
            		</small>
    			</td>
    		</tr>
    	</table>


    		
    	 	
        </div>
        </c:forEach>
    </div>
    

	<div>
		<table style="width: 100%; border-spacing: 0;">
		<tr height="35">
			<td align="center"> ${paging} </td>
		</tr>
		</table>
	</div>



<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>