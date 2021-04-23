<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

</head>
<body>

<div class="header">
    <jsp:include page="/temp/header.jsp"></jsp:include>
</div>
	
<div class="container">
	<section class="contact-clean" style="background: rgb(241,247,252);">
        <form method="post">
            <h2 class="text-center">게시판</h2>
            <div class="form-group"><input class="form-control" type="text" name="title" placeholder="제목"></div>
            <div class="form-group"><input class="form-control-plaintext" type="text" value="작성자" readonly="" style="padding-left: 13px;"></div>
            <div class="form-group"><textarea class="form-control" name="content" placeholder="글쓰기" rows="14" style="height: 260px;"></textarea></div>
            <div class="form-group"><button class="btn btn-secondary" type="submit" style="background: #07689f;">글올리기&nbsp;</button></div>
        </form>
    </section>
</div>

<div class="footer">
    <jsp:include page="/temp/footer.jsp"></jsp:include>
</div>

</body>
</html>