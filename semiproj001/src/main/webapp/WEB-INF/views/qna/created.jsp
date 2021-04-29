
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>created</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp" />
<script type="text/javascript">
	function sendok() {
		var f = document.qnaForm;

		var str = f.subject.value;
		if (!str) {
			alert("질문제목을 입력하세요. ");
			f.subject.focus();
			return;
		}

		str = f.content.value;
		if (!str) {
			alert("질문내용을 입력하세요. ");
			f.content.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/qna/${mode}_ok.do";

		f.submit();
	}
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>


	<div class="container">
		<section class="contact-clean" style="background: rgb(241, 247, 252);">
			<form name="qnaForm" method="post">
				<h2 class="text-center">[커뮤니티]Q&A</h2>
				<div class="form-group">
					<input class="form-control" type="text" name="title"
						placeholder="제목" value="${dto.question_title}">
				</div>

				<div class="form-group">
					<input class="form-control-plaintext" type="text" value="${dto.question_name}"
						readonly="${sessionScope.member.userName}"
						style="padding-left: 13px;">
				</div>

				<div class="form-group">
					<textarea class="form-control" name="content" placeholder="글쓰기"
						rows="14" style="height: 260px;">${dto.question_content}</textarea>
				</div>
				<div class="form-group">
					<button class="btn btn-secondary" type="submit"
						style="background: #07689f;" onclick="sendOk();">글
						올리기&nbsp;</button>
				</div>
			</form>
		</section>
	</div>


	<div class="footer">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp" />
</body>
</html>