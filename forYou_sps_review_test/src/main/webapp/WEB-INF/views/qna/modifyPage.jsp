<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../main/header.jsp"%>

<div class="row">
	<div class="col-lg-12 service">
		<h1 class="page-header service">Q&A</h1>
	</div>
</div>

	<form role="form" method="post"><!-- 파일 enctype="multipart/form-data" -->

		<input name="_method" type="hidden" value="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		
		<input name="mNo" type="hidden" value="${memberVO.mNo}">
		<input name="_method" type="hidden" value="post">
		
		<div class="mypage-wrap board-wrap">
		<div class="mypage-content board-default">

			<div class="alert alert-hint article-title">
				<input class="form-control input-sm" name="title" type="text"
					value="${qnaVO.title}">
			</div>


			<div class="article-body">
				<textarea class="form-control input-sm" rows="20" name="contents"
					cols="80" >${qnaVO.contents}</textarea>
			</div>
		</div>
	</div>
	<div class="article-menu text-right mypage-wrap">
			<button class="modify main-btn" type="submit" value="수정하기">수정하기</button>
			<button class="cancel main-btn" type="submit" value="돌아가기">돌아가기</button>
		</div>
		</form>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".cancel").on("click", function() {
			self.location = "/qna/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});

		$(".modify").on("click", function() {
			formObj.submit();
		});

	});
</script>
	
</body>
</html>