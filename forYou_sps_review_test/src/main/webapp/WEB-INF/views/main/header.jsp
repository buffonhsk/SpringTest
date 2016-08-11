<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  
<!-- custom -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/normalize.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/mainPage.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member.css">

<!-- starCount -->
<link rel="stylesheet" type="text/css" href="/resources/css/jquery.rateyo.css"/>


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
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="/resources/css/readPage.css">
<link rel="stylesheet" type="text/css" href="/resources/css/shop.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/resources/js/jQuery-2.1.4.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<!-- custom -->
<script src="/resources/js/login.js"></script>
<script src="/resources/js/menu.js"></script>

<!-- starCount -->
<script src="/resources/js/jquery.rateyo.js"></script>



<title>재능 기부 사이트</title>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="logo">
				<h1>
					<a href="/main/mainPage"> <img src="../resources/img/logo.png"
						alt="logo" width="70px" height="100px"></a>
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
						<input type="text" class="form-control" name='keyword'
							id="keywordInput" placeholder="Search for..."
							value="${cri.keyword}"> <span class="input-group-btn">

							<button id='searchBtn'
								class="input-group-addon glyphicon glyphicon-search search"
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

							<form action="/main/loginPost" method="post" id="login-form"
								class="text-left">
								<fieldset>
									<legend class="none">로그인</legend>
									<div class="main-login-form">
										<div class="login-group">
											<div class="form-group">
												<label for="userid" class="sr-only"></label> <input
													type="text" class="form-control" id="userid" name="userid"
													placeholder="username">
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
							<a href="/member/memberRegist" class="display">회원 가입</a> <a
								href="#">비밀번호 찾기</a>
						</div>
						</form>
				</div>
				<!-- end:Main Form -->
				</c:if>
				
				 <c:if test="${not empty memberVO.userid}">
					<p>${memberVO.username}님 환영합니다.</p>
					
					<!-- <button class="mRemove" type="submit">탈퇴</button> -->
		
					<a href="/main/logout">로그아웃</a>
				</c:if> 
			</div>
	</div>
	</div>
	</header>

	<div class="nav_wrap">
		<div class="nav">
			<ul class="navBar">
				<li class="navMain"><a href="#" class="chat">채팅</a></li>
				<li class="navMain"><a href="/menu/game" class="game">게임</a></li>
				<li class="navMain"><a href="/menu/design" class="design">디자인</a></li>
				<li class="navMain"><a href="/menu/study" class="study">스터디</a></li>
				<li class="navMain"><a href="/menu/music" class="music">음악</a></li>
				<li class="navMain"><a href="/menu/cook" class="cook">요리</a></li>
				<li class="navMain service">
					<a href="/qna/list" class="services">고객지원</a>
					<ul>
						<li><a href="/qna/list">Q&A</a></li>
						<li><a href="/note/list">공지사항</a></li>
					</ul>
				</li>
			</ul>
			
			<c:if test="${empty memberVO.userid}">
				<div id="mySidenav" class="sidenav">
				  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
				  <p class="sidenavP">please login first....</p>
				</div>
			</c:if>
			
			
			<c:if test="${not empty memberVO.userid}">
				<div id="mySidenav" class="sidenav">
				  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
				  <p class="sidenavP">Welcome ${memberVO.username}</p>
				  <p><button class="mModify mainSide" type="submit">MemberInfo.</button></p>
				  <p><button class="mRegister mainSide" type="submit">Add_Talents</button></p>
				  <p><button class="mShop mainSide" type="submit">Shop</button></p>
				  <a href="/main/logout">logout</a>
				</div>
			</c:if>
			<span class="menuIcon glyphicon glyphicon-align-justify" aria-hidden="true" style="cursor:pointer" onclick="openNav();"></span>
			
		</div>
	</div>

	<script type="text/javascript">
	function openNav() {
	    document.getElementById("mySidenav").style.width = "200px";
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}
	
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
										+ "&keyword="
										+ $('#keywordInput').val();
							});

					var result = '${msg}';

					if (result == 'success') {
						alert("처리 되었습니다.");
					}

					var formObj = $("form[role='form']");

					console.log(formObj);

					$(".mModify").on("click", function() {
						formObj.attr("action", "/member/modify");
						formObj.attr("method", "get");
						formObj.submit();
					});

					$(".mRegister").on("click", function() {
						formObj.attr("action", "/sboard/register");
						formObj.attr("method", "get");
						formObj.submit();
					});
					
					
					$(".mShop").on("click", function() {
						formObj.attr("action", "/shop/list");
						formObj.submit();
					});

					$(".mListAll").on("click", function() {
						self.location = "/main/maiPage";
					});
					

				});
		
	</script>