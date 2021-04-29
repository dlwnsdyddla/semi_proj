
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
	function sendOk() {
		var uid = "${sessionScope.member.id}";
		if (!uid) {
			location.href = "${pageContext.request.contextPath}/member/login.do";
			return;
		}

		var f = document.qnaForm;
		var str;
		
		str = f.title.value;
		if (!str) {
			alert("제목을 입력 하세요 !!!");
			f.content.focus();
			return;
		}
		str = f.content.value;
		if (!str) {
			alert("내용을 입력 하세요 !!!");
			f.content.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/qna/qna_ok.do";
		f.submit();
	}
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<input class="form-control-plaintext" type="text" value="[커뮤니티] Q&A"
		style="padding: 13px 0px; padding-left: 21px; font-size: 21px; font-family: 'Source Sans Pro', sans-serif; font-weight: 500; font-style: normal;">

	<div>
		<!-- 질문내용 출력 -->
		<table class="question"
			style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td>${dto.question_title}</td>
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

		<!-- 이미 등록된 답변내용 출력-->
		<c:if test="${dto.answer_title != null}">
			<table class="answered"
				style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				<tr height="35"
					style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td>${dto.answer_title}</td>
				</tr>

				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td width="50%" align="left" style="padding-left: 5px;">
						${dto.answer_id}</td>
					<td width="50%" align="right" style="padding-right: 5px;">
						${dto.answer_date}</td>
				</tr>
				<tr style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding: 10px 5px;"
						valign="top" height="200">${dto.answer_content}</td>
				</tr>
			</table>
		</c:if>

		<!-- 미답변시 답변달기 폼이 보임, 클릭하면 created로 이동함 -->
		<c:if test="${answernull == 'yes' }">
		<table class="list"
			style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td align="left">
						<div class="container">
							<section class="contact-clean"
								style="background: rgb(241, 247, 252);">
								<form name="qnaForm" method="post">
									<h4 class="text-center">답변</h4>
									<div class="form-group">
										<input class="form-control" type="text" name="title"
											placeholder="답변제목" value="${dto.answer_title}">
									</div>

									<div class="form-group">
										<input class="form-control-plaintext" type="text"
											value="${dto.answer_name}"
											readonly="${sessionScope.member.member_name}"
											style="padding-left: 13px;">
									</div>

									<div class="form-group">
										<textarea class="form-control" name="content"
											placeholder="글쓰기" rows="14" style="height: 260px;">${answer_content}</textarea>
									</div>
									<div class="form-group">
										<button class="btn btn-secondary" type="submit"
											style="background: #07689f;" onclick="sendOk();">답변 달기&nbsp;</button>
									</div>
									
									<input type="hidden" name="qna_code" value="${dto.qna_code }">
									<input type="hidden" name="answer_id" value="${sessionScope.member.id}">
								</form>
							</section>
						</div>
					</td>

				
			</tr>
		</table>
		</c:if>
	<div style="text-align: right">
	<button type="button" class="btn"
			onclick="javascript:location.href='${pageContext.request.contextPath}/qna/list.do';">리스트</button>
	</div>		
	</div>

	<div class="footer">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp" />
</body>
</html>