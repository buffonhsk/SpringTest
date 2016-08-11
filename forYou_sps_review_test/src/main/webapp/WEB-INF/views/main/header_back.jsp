<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="/resources/css/normalize.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/mainPage.css">

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



<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="logo">
				<h1>
					<img src="../resources/img/logo.png" alt="logo" width="90px"
						height="130px">
				</h1>
			</div>

			<div class="wrap-search">
				<div class="search">
					<select name="searchType" class="form-control">
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							전체</option>
						<option value="g"
							<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
							게임</option>
						<option value="d"
							<c:out value="${cri.searchType eq 'd'?'selected':''}"/>>
							디자인</option>
						<option value="s" class="collaboSel"
							<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
							스터디</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							요리</option>
						<option value="m"
							<c:out value="${cri.searchType eq 'm'?'selected':''}"/>>
							음악</option>
					</select>
					<div class="input-group">
						<input type="text" class="form-control" name='keyword' id="keywordInput"
							placeholder="Search for..." value="${cri.keyword}"> <span
							class="input-group-btn">
							
							<button id='searchBtn' class="input-group-addon glyphicon glyphicon-search search"
								type="submit" aria-hidden="true"></button>
						</span>
					</div>
					<!-- /input-group -->
				</div>
			</div>
			<!-- /.row -->
			<div class="wrap_login">

				<div class="text-center">
					<!-- Main Form -->
					<form role="form" method="post">
						<input name="mNo" type="hidden" value="${memberVO.mNo}">
					</form>
					<c:if test="${empty memberVO.userid}">
					<div class="login-form-1">
					
						<form action="/main/loginPost" method="post" id="login-form" class="text-left">
						<fieldset>
							<legend class="none">로그인</legend>
							<div class="main-login-form">
								<div class="login-group">
									<div class="form-group">
										<label for="userid" class="sr-only"></label> <input
											type="text" class="form-control" id="userid"
											name="userid" placeholder="username">
									</div>
									<div class="form-group">
										<label for="userpw" class="sr-only"></label> <input
											type="password" class="form-control" id="userpw"
											name="userpw" placeholder="password">
									</div>
								</div>
								<button type="submit" class="login-button">
									<i class="fa fa-chevron-right"></i>
								</button>
								</fieldset>
							</div>
							<div class="etc-login-form">
								<p>
									forgot your password? <a href="#">click here</a>
								</p>
								<p>
									new user? <a href="#" class="display">create new account</a>
								</p>
							</div>
						</form>
					</div>
					<!-- end:Main Form -->
					</c:if>
					
					<c:if test="${not empty memberVO.userid}">
				<p>${memberVO.username}님</p>
				<button class="modify" type="submit">정보수정</button>
				<button class="remove" type="submit">탈퇴</button>
				<button class="maiPage" type="submit">메인페이지</button>
				<a href="/main/logout">로그아웃</a>
			</c:if>
				</div>

			</div>
	</div>
	</header>
	<%-- <div class='box-body'>
			<select name="searchType" class="selectbox">
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					전체</option>
				<option value="g"
					<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
					게임</option>
				<option value="d"
					<c:out value="${cri.searchType eq 'd'?'selected':''}"/>>
					디자인</option>
				<option value="s" class="collaboSel"
					<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
					스터디</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
					요리</option>
				<option value="m"
					<c:out value="${cri.searchType eq 'm'?'selected':''}"/>>
					음악</option>

			</select> <input type="text" name='keyword' id="keywordInput"
				value='${cri.keyword}'>
			<button id='searchBtn'>Search</button>


		</div>
	</header>	

	<section>
		<article>
			<form role="form" method="post">
				<input name="mNo" type="hidden" value="${memberVO.mNo}">
			</form>
			<c:if test="${empty memberVO.userid}">
				<div class="join_form">
					<!-- httpsession -->
					<form action="/main/loginPost" method="post">
						<fieldset>
							<legend>로그인</legend>
							<div>
								<label>아이디<input type="text" name="userid"
									class="userid" placeholder="아이디를 입력하세요.">
								</label>
							</div>
							<div>
								<label>비밀번호 <input type="password" name="userpw"
									class="userpw" placeholder="비밀번호를 입력하세요.">
								</label>
							</div>

						</fieldset>
						<span class="btn_join"><input type="submit" value="로그인"></span>
					</form>
				</div>
			</c:if>

			<c:if test="${not empty memberVO.userid}">
				<p>${memberVO.username}님</p>
				<button class="modify" type="submit">정보수정</button>
				<button class="remove" type="submit">탈퇴</button>
				<button class="maiPage" type="submit">메인페이지</button>
				<a href="/main/logout">로그아웃</a>
			</c:if>
		</article>
		<ul>
			<li><a href="/menu/game">게임</a></li>
			<li><a href="/menu/design">디자인</a></li>
			<li><a href="/menu/study">스터디</a></li>
			<li><a href="/menu/music">음악</a></li>
			<li><a href="/menu/cook">요리</a></li>
			<li><a href="/menu/qna">고객지원</a></li>
		</ul>--%>

<script type="text/javascript">
$(document).ready(
		function() {
	$('#searchBtn').on(
		"click",
		function(event) {
			/* window.location.replace("/sboard/list"); */
			 self.location = "/sboard/list"
					+ "?page=1&perPageNum=10"
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val(); 
		});
	});
</script> 