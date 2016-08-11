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
		<div class="logo">register</div>
		<div class="login-form-1">

			<form:form action="/member/memberRegist" commandName="memberVO"
				id="register-form" class="text-left" method="post">
				<!-- <form role="form" method="post" id="join_form"> -->
				<fieldset>
					<legend class="none">회원 가입</legend>
					<div class="main-login-form">
						<div class="login-group">
							<div class="form-group">
								<label for="userid sr-only"> <form:input
										class="form-control" path="userid" placeholder="userid"
										onkeyup="chkMbId();" />
								</label>
								<form:errors path="userid" cssClass="error useridE" />
							</div>
							<div class="form-group">
								<label for="userpw"><form:input class="form-control"
										path="userpw" placeholder="password" /> </label>
								<form:errors path="userpw" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="username"><form:input class="form-control"
										path="username" placeholder="username" /> </label>
								<form:errors path="username" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="email"><form:input class="form-control"
										path="email" placeholder="email" /> </label>
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="contactNum"><form:input class="form-control"
										path="contactNum" placeholder="contactNum" /> </label>
								<form:errors path="contactNum" cssClass="error" />
							</div>
						</div>
					</div>
					<div class="btn-area">
						<button class="regist btn orange-sub-btn" name="checkBtn" type="submit" value="수정하기">가입하기</button>
						<button class="listAll btn orange-sub-btn" type="button" value="메인페이지">메인페이지</button>
					</div>

				</fieldset>

			</form:form>
			<!-- </form> -->
		</div>
	</div>
	<%-- <!-- REGISTRATION FORM -->
	<div class="text-center" style="padding: 50px 0">
		<div class="logo">register</div>
		<!-- Main Form -->
		<div class="login-form-1">
			<form:form action="/member/memberRegist" commandName="memberVO"
				id="register-form" class="text-left" method="post">
				<fieldset>
					<legend class="none">회원 가입</legend>
					<div class="main-login-form">
						<div class="login-group">
							<div class="form-group">
								<label for="userid" class="sr-only">Email address</label> <input
									type="text" class="form-control" id="userid" name="userid"
									placeholder="userid">
								<button class="id_chk" name="checkBtn" onclick="chkMbId();">ID
									중복확인</button>
							</div>
							<div class="form-group">
								<label for="userpw" class="sr-only">Password</label> <input
									type="password" class="form-control" id="userpw" name="userpw"
									placeholder="password">
							</div>
							<div class="form-group">
								<label for="userpw_confirm" class="sr-only">Password
									Confirm</label> <input type="password" class="form-control"
									id="userpw_confirm" name="userpw_confirm"
									placeholder="confirm password">
							</div>

							<div class="form-group">
								<label for="email" class="sr-only">Email</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="email">
							</div>
							<div class="form-group">
								<label for="username" class="sr-only">username</label> <input
									type="text" class="form-control" id="username" name="username"
									placeholder="이름">
							</div>

							<div class="form-group">
								<label for="contactNum" class="sr-only">contactNum</label> <input
									type="text" class="form-control" id="contactNum"
									name="contactNum" placeholder="contactNum">
							</div>
						</div>

						<button type="submit" name="checkBtn" class="login-button check">
							<i class="fa fa-chevron-right"></i>
						</button>
					</div>
				</fieldset>
				<div class="etc-login-form">
					<p>
						already have an account? <a href="/main/mainPage">login here</a>
					</p>
				</div>
			</form:form>
		</div>
		<!-- end:Main Form -->
	</div>
 --%>
</body>
<script type="text/javascript">
	$(function() {
		$(".id_chk").keyup(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요.");
			} else {
				chkMbId();
			}
		});

	});

	function chkMbId() {
		$.ajax({
			url : "/member/chkMbId",
			type : "get",
			data : {
				userid : $("#userid").val()
			},
			dataType : "json",
			success : function(data) {
				$(".useridE").html(data.resultMsg);
				console.log(data.resultMsg);
			}
		});
	};
	
	var formObj = $("form[role='form']");
	console.log(formObj);

	$(".listAll").on("click", function() {
		self.location = "/main/mainPage";
	});

	$(".regist").on("click", function() {
		formObj.submit();
	});
	
</script>
</html>