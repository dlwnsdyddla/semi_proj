<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
function send_ok() {
	var f = document.resignForm;
	var str;
	
	try {
		confirm("정말 탈퇴하시겠습니까 ?");
		
		str = f.currentPwd.value;
		str = str.trim();
		if(!str) {
			f.currentPwd.focus();
			throw e;
		}
		
	} catch (e) {
		return;
	}
	
	// 현재 비밀번호 검사는 서블릿에서 진행합니다.
	f.action = "${pageContext.request.contextPath}/member/resign.do";
	f.submit();
}
</script>

</head>
<body>
<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">
     <section class="login-clean" style="background: rgb(241, 247, 252);">
        <form name="resignForm" method="post">
            <h2 class="sr-only">resign Form</h2>
            <div class="form-group" style="color: red;"> 비밀번호를 입력해 주세요. </div>
            <div class="form-group"><input class="form-control" type="password" name="currentPwd" placeholder="현재 패스워드"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="send_ok();" style="background: #07689f;">회원탈퇴</button></div>
        </form>
    </section>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>