<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/normalize.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/mainPage.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- font-awesome  -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/resources/js/jQuery-2.1.4.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/login.js"></script>
<title>회원 가입</title>
<style type="text/css">
.error {
	color: red;
}
</style>

</head>
<body>

	<div class="text-center" style="padding: 50px 0">
		<div class="logo">정보수정</div>
		<div class="login-form-1">

			<form role="form" id="register-form" class="text-left" method="post">
				<!-- <form role="form" method="post" id="join_form"> -->
					<input type="hidden" name="mNo" value="${memberVO.mNo}">
				<fieldset>
					<legend class="none">회원 정보 수정</legend>
					<div class="main-login-form">
						<div class="login-group">
							<div class="form-group">
								이름: <label for="username sr-only"> <input
										class="form-control" value="${memberVO.username}" name="username"
										readonly="readonly" />
								</label>
						
							</div>
							<div class="form-group">
								아이디: <label for="userid"><input class="form-control"
										value="${memberVO.userid}" name="userid"
										readonly="readonly" /> </label>
							</div>
							<div class="form-group">
								비밀번호: <label for="userpw"><input class="form-control"
										value="${memberVO.userpw}" name="userpw" /> </label>
								<form:errors path="userpw" cssClass="error" />
							</div>
							
							<div class="form-group">
								이메일: <label for="email"><input class="form-control"
										value="${memberVO.email}" name="email"/> </label>
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								연락처: <label for="contactNum"><input class="form-control"
										value="${memberVO.contactNum}" name="contactNum"/> </label>
								<form:errors path="contactNum" cssClass="error" />
							</div>
						</div>
					</div>
					<div class="btn-area">
						<button class="modify btn orange-sub-btn" type="submit" value="수정하기">수정하기</button>
						<button class="listAll btn orange-sub-btn" type="submit" value="메인페이지">메인페이지</button>
					</div>

				</fieldset>

			</form>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	
$(document).ready(function() {

	var formObj = $("form[role='form']");
	console.log(formObj);

	$(".listAll").on("click", function() {
		self.location = "/main/mainPage";
	});

	$(".modify").on("click", function() {
		formObj.submit();
	});

});
	
</script>
</html>