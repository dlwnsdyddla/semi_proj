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
	var f = document.changePwdForm;
	var str;
	
	try {
		
		str = f.currentPwd.value;
		str = str.trim();
		if(!str) {
			f.currentPwd.focus();
			throw e;
		}
		str = f.newPwd.value;
		str = str.trim();
		if(!str) {
			f.newPwd.focus();
			throw e;
		}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/.test(str)) { 
			alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
			f.newPwd.focus();
			throw e;
		}
		str = f.newPwdOk.value;
		str = str.trim();
		if(!str) {
			f.newPwdOk.focus();
			throw e;
		}
				
		if(f.newPwd.value != f.newPwdOk.value) {
			alert("패스워드가 일치하지 않습니다.");
			f.newPwdOk.focus();
			throw e;
		}
		
	} catch (e) {
		return;
	}
	
	// 현재 비밀번호 검사는 서블릿에서 진행합니다.
	f.action = "${pageContext.request.contextPath}/member/changePwd_ok.do";
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
        <form name="changePwdForm" method="post">
            <h2 class="sr-only">changePwd Form</h2>
            <div class="form-group"><input class="form-control" type="password" name="currentPwd" placeholder="현재 비밀번호"></div>
            <div class="form-group"><input class="form-control" type="password" name="newPwd" placeholder="새 비밀번호"></div>
            <div class="form-group"><input class="form-control" type="password" name="newPwdOk" placeholder="새 비밀번호 확인"></div>
            <div class="form-group" style="color: red;"> ${result} </div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="send_ok();" style="background: #07689f;">비밀번호 변경하기</button></div>
        </form>
    </section>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>