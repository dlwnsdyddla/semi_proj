
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
	
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<input class="form-control-plaintext" type="text" value="[커뮤니티] Q&A"
		style="padding: 13px 0px; padding-left: 21px; font-size: 21px; font-family: 'Source Sans Pro', sans-serif; font-weight: 500; font-style: normal;">

		<form name="qna">
			<div class="list-group">
			<table style="width: 70%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
				<tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 			
					<th width="150" style="color: #787878;">질문번호</th>
					<th width="150" style="color: #787878;">강의번호</th>
			     	<th style="color: #787878;">제목</th>
			      	<th width="150" style="color: #787878;">작성자</th>
			      	<th width="150" style="color: #787878;">작성일</th>
				</tr>
				<c:forEach var="dto" items="${list}">
				  	<tr align="center" bgcolor="#ffffff" height="35" 
				  	<c:if test="${dto.answer_name == null}">
				  	style="border-bottom: 1px solid #cccccc;"
				  	</c:if>
				  	> 
					      <td>${dto.qna_code}</td>
					      <td>${dto.opened_code}</td>
					      <td>
					           <a href="${articleUrl}&qna_code=${dto.qna_code}">${dto.question_title}</a>
					      </td>
					      <td>${dto.question_name}</td>
					      <td>${dto.question_date}</td>
				 	 </tr>
				 	 
				 	 <c:if test="${dto.answer_name != null}">
				 	 <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
				 	 	<td></td>
					    <td></td>
				 	 	<td>
				 	 		<a href="${articleUrl}&qna_code=${dto.qna_code}">└&nbsp;${dto.answer_title}</a>
				 	 	</td>
				 	 	<td>${dto.answer_name}</td>
					    <td>${dto.answer_date}</td>
				 	 </tr>
				 	 </c:if>
				</c:forEach>
				
			</table>
			</div>
			<input type="hidden" name="student_id" value="${sessionScope.member.id}">
		</form>

	<!-- <div class="paging" style="padding: 15px;">
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<tr height="35">
				<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}</td>
			</tr>
		</table>
	</div>
	-->
	<div>
		
	
	</div>


	<div class="footer">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp" />
</body>
</html>