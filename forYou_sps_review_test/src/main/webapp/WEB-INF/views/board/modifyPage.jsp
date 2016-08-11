<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<title>재능 수정</title>
</head>
<body>

	<form role="form" method="post" ><!-- 파일 enctype="multipart/form-data" -->

		<input name="_method" type="hidden" value="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<h1 class="title">프로필관리</h1>
		<article class="attach-picture clearfix">
			<div class="profile-picture">
				<input name="image" type="file">
			</div>
			
			<div class="profile-picture-info">
				<img src="https://www.otwojob.com/images/mypage/profile_tit.jpg">

				<span>금액</span>	
				<!-- <input class="text-right"
					required="required" pattern="\d+" minimum="5" valid_title="기본금액"
					name="price" type="text"> -->
					
					<select class="form-control input-sm" name="price">
						<option value="0">무료</option>
						<option value="10000">10,000원</option>
						<option value="20000">20,000원</option>
						<option value="30000">30,000원</option>
						<option value="40000">40,000원</option>
						<option value="50000">50,000원</option>
					</select>
					
					<%-- ${talentBoardVO.catalog_id} --%>
					<%-- <c:if test="${talentBoardVO.catalog_id == 1}">
						<input name="catalog_id">전문분야: 게임
					</c:if>
					<c:if test="${talentBoardVO.catalog_id == 2} ">
						<input name="catalog_id">전문분야: 디자인 
					</c:if>
					<c:if test="${talentBoardVO.catalog_id == 3} ">
						<input name="catalog_id">전문분야: 스터디 
					</c:if>
					<c:if test="${talentBoardVO.catalog_id == 4} ">
						<input name="catalog_id">전문분야: 요리
					</c:if>
					<c:if test="${talentBoardVO.catalog_id == 5}">
						<input name="catalog_id">전문분야: 음악
					</c:if>
					 --%>
				</div>
			
		</article>
		<br>
		<div class="well well-sm">※ 연락처, 이메일 등 개인정보가 포함된 글이 게시될 경우, 사이트
			관리자에 의하여 임의로 삭제될 수 있습니다.</div>

		<table class="profile-info basic-table">
			<tbody>
				<tr>
					<th>소개제목</th>
					<td><input class="form-control input-sm" name="title"
						type="text" value="${talentBoardVO.title}"></td>
				</tr>
				<tr>
					<th>재능내용</th>
					<td><textarea class="form-control input-sm" rows="50"
							name="contents" cols="80">${talentBoardVO.contents}</textarea></td>
				</tr>

			</tbody>
		</table>
		</form>
		<div class="btn-area">
			<button class="modify" type="submit" value="수정하기">수정하기</button>
			<button class="cancel" type="submit" value="돌아가기">돌아가기</button>
		</div>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".cancel").on("click", function() {
			self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});

		$(".modify").on("click", function() {
			formObj.submit();
		});

	});
</script>
	
</body>
</html>