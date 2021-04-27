<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>
<script type="text/javascript">
function send_ok() {
	var f = document.signupForm;
	var str;
	
	try {
		// 유효성 검사
		str = f.id.value;
		str = str.trim();
		if(!str) {
			f.id.focus();
			throw e;
		}
		if(!/^[a-z][a-z0-9]{4,9}$/.test(str)) {
			alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
			f.id.focus();
			throw e;
		}
		
		str = f.pwd.value;
		str = str.trim();
		if(!str) {
			f.pwd.focus();
			throw e;
		}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/.test(str)) { 
			alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
			f.pwd.focus();
			throw e;
		}
		
		str = f.pwd_ok.value;
		str = str.trim();
		if(!str) {
			f.pwd_ok.focus();
			throw e;
		}
		str = f.member_name.value;
		str = str.trim();
		if(!str) {
			f.member_name.focus();
			throw e;
		}
		if(!/^[가-힣]{2,4}$/.test(str)) {
			alert("이름을 정확히 입력해주세요.");
			f.member_name.focus();
			throw e;
		}
		
		// 패스워드 = 패스워드 확인 검사
		if(f.pwd.value != f.pwd_ok.value) {
			f.pwd_ok.focus();
			alert("패스워드가 일치하지 않습니다.");
			throw e;
		}
		
	} catch (e) {
		return;
	}
	f.action = "${pageContext.request.contextPath}/member/member_ok.do";
	f.submit();
}

function imageView() {
	var file = event.target.files[0];
	if(! file.type.match("image.*")) {
		return false;
	}
	
	var reader = new FileReader();
	reader.onload = function(e) {
		document.getElementById("preImageView").setAttribute("src", e.target.result);
	}
	reader.readAsDataURL(file);
}

</script>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="container">
	<section class="login-clean" style="background: rgb(241,247,252);">
        <form name="signupForm" method="post" enctype="multipart/form-data">
            <h2 class="text-center">회원가입</h2>
            <div class="form-group" style="text-align: center;"><img id="preImageView" style="vertical-align: middle;" width="120" height="140"> <div class="preImageViewLayout" style="display: inline-block;"></div></div>
            <div class="form-group"><input type="file" name="member_picture_filename" onchange="imageView()"></div>
            <div class="form-group"><input class="form-control" type="text" name="id" placeholder="아이디"></div>
            <div class="form-group"><input class="form-control" type="password" name="pwd" placeholder="패스워드"></div>
            <div class="form-group"><input class="form-control" type="password" name="pwd_ok" placeholder="패스워드 확인"></div>
            <div class="form-group"><input class="form-control" type="text" name="member_name" placeholder="이름"></div>
            <div class="form-group"> 
            	<label><input  type="radio" name="type" value="s" checked="checked"> 학생 &nbsp;</label>
            	<label><input  type="radio" name="type" value="t"> 강사 </label>
            </div>
            
            <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="send_ok();" style="background: #07689f;">회원가입</button> <b style="color: red;"> &nbsp;${message} </b></div>
        </form>
    </section>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>