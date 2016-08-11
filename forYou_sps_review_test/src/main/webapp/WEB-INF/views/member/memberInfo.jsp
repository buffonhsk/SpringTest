<%@ page import="kr.co.choongang.domain.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<title>개인 정보 확인</title>
</head>
<body>

	<section>
		<div class="join_form">
			<form role="form" method="post">
				<input type="hidden" name="mNo" value="${memberVO.mNo}">
			</form>
				<%-- <input type="hidden" value="${memberVO.username}">
				<input type="hidden" value="${memberVO.userpw}">
				<input type="hidden" value="${memberVO.email}">
				<input type="hidden" value="${memberVO.contactNum}"> --%>
				<fieldset>
					<legend>회원 정보</legend>
					<div>
						<label> 
							이름 :${memberVO.username}
						</label>
					</div>
					<div>				
							아이디 :${memberVO.userid}
					</div>
					<div>
						<label> 
							이메일 :${memberVO.email}
						</label>
					</div>
					<div>
						<label> 
							연락처 :${memberVO.contactNum}
						</label>
					</div>

				</fieldset>
				<button class="modify" type="submit">수정하기</button>
				<button class="remove" type="submit">회원 탈퇴</button>
				<button class="main" type="submit">메인페이지</button>
			<!-- </form> -->
		</div>
	</section>

	
	<script type="text/javascript">
	$(document).ready(function(){
	
	var result = "${msg}";
	if (result == 'modify') {
		alert("회원정보가 수정되었습니다.")
	}
	

	
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".modify").on("click", function(){
			formObj.attr("action", "/member/modify");
			formObj.attr("method", "get");
			formObj.submit();	
		});
		
		$(".remove").on("click", function(){
			formObj.attr("action", "/member/remove");
			formObj.submit();
		});
		
		
		$(".main").on("click", function(){
			self.location="/main/mainPage";	
		});
	});

	</script>

	
</body>
</html>