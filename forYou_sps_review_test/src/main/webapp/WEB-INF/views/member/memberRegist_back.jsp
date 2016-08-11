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
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<title>회원 가입</title>
<style type="text/css">
.error {
	color: red;
}
</style>

</head>
<body>

	<header> </header>

	<section>
		<div class="join_form">
			<form:form action="/member/memberRegist" commandName="memberVO"
				method="post">
				<!-- <form role="form" method="post" id="join_form"> -->
				<fieldset>
					<legend>회원 가입</legend>
					<div>
						<!-- input onkeyup="chkMbId();"  -->
						<!--onclick="checkId();"-->
						<label for="userid">아이디 <form:input path="userid" />
							<button class="id_chk" name="checkBtn" onclick="chkMbId();">ID 중복확인</button> <form:errors
								path="userid" cssClass="error" />
						</label>
					</div>
					<div>
						<label for="userpw">비밀번호 <form:input path="userpw" /> <form:errors
								path="userpw" cssClass="error" />
						</label>
					</div>
					<div>
						<label for="username">이름 <form:input path="username" /> <form:errors
								path="username" cssClass="error" />
						</label>
					</div>
					<div>
						<label for="email">이메일 <form:input path="email" /> <form:errors
								path="email" cssClass="error" />
						</label>
					</div>
					<div>
						<label for="contactNum">연락처 <form:input path="contactNum" />
							<form:errors path="contactNum" cssClass="error" />
						</label>
					</div>

				</fieldset>
				<span class="btn_join"><input class="check" type="submit" name="checkBtn" value="가입하기"></span>
			</form:form>
			<!-- </form> -->
		</div>
	</section>
</body>
<script type="text/javascript">
   $(function() {
	$(".id_chk").keyup(function(){
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
				alert(data.resultMsg);
			}
		});
	};	
</script>	
</html>