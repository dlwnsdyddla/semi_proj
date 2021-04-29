
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>article</title>
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

	<div>
		<table class="question"
			style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td>
				${dto.answer_title}
				</td>
			</tr>
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td width="50%" align="left" style="padding-left: 5px;">
					${dto.qna_code}</td>
				<td width="50%" align="right" style="padding-right: 5px;">
					${dto.opened_code}</td>
			</tr>
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td width="50%" align="left" style="padding-left: 5px;">
					${dto.question_id}</td>
				<td width="50%" align="right" style="padding-right: 5px;">
					${dto.question_date}</td>
			</tr>
			<tr style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="left" style="padding: 10px 5px;" valign="top"
					height="200">${dto.question_content}</td>
			</tr>
		</table>

		<table class="answered"
			style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td width="50%" align="left" style="padding-left: 5px;">
					${dto.answer_id}</td>
				<td width="50%" align="right" style="padding-right: 5px;">
					${dto.answer_date}</td>
			</tr>
			<tr style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="left" style="padding: 10px 5px;" valign="top"
					height="200">${dto.question_content}</td>
			</tr>
		</table>


		<table class="list"
			style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td align="right">
					<button type="button" class="btn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/qna/list.do?${query}';">리스트</button>
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