
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
		var uid = "${sessionScope.member.id}";
		if (!uid) {
			location.href = "${pageContext.request.contextPath}/member/login.do";
			return;
		}
		
		var f = document.qnaForm;

		var str = f.opened_code.value;
		if (!str) {
			alert("개설 코드를 입력하세요. ");
			f.subject.focus();
			return;
		}
		
		var str = f.title.value;
		if (!str) {
			alert("질문제목을 입력하세요. ");
			f.subject.focus();
			return;
		}

		str = f.question_content.value;
		if (!str) {
			alert("질문내용을 입력하세요. ");
			f.content.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/qna/created_ok.do";

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
				<h2 class="text-center">[커뮤니티]QnA</h2>
				<div class="form-group">
					<input class="form-control" type="text" name="qna_code"
						placeholder="질문코드">
				</div>
				
				<div class="form-group">
					<input class="form-control" type="text" name="opened_code"
						placeholder="개설코드">
				</div>
				
				<div class="form-group">
					<input class="form-control" type="text" name="title"
						placeholder="제목" >
				</div>

				<div class="form-group">
					<input class="form-control-plaintext" type="text"
						readonly="${sessionScope.member.member_name}" placeholder="${sessionScope.member.member_name}"
						style="padding-left: 13px;">
				</div>
				
				<input type="hidden" name="question_id" value="${sessionScope.member.id}">

				<div class="form-group">
					<textarea class="form-control" name="question_content" placeholder="글쓰기"
						rows="14" style="height: 260px;"></textarea>
				</div>
				<div class="form-group" style="justify-content: space-between;">
					<span>
					<button class="btn btn-secondary" type="button"
						style="background: #07689f;" onclick="sendok();">글 올리기&nbsp;</button>
					</span>	
					<span style="padding-left: 66%">
					<button type="button" class="btn btn-secondary" style="background: #F1F7FC; color: black;" 
					onclick="javascript:location.href='${pageContext.request.contextPath}/qna/list.do';">리스트</button>
					</span>
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