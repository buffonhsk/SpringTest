<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>

<div class="row">
	<div class="col-lg-12 service">
		<h1 class="page-header service">Q&A</h1>
	</div>
</div>
<form action="/qna/register" method="post">
	<!-- 파일 enctype="multipart/form-data" -->
	<input name="mNo" type="hidden" value="${memberVO.mNo}"> <input
		name="_method" type="hidden" value="post">

	<div class="mypage-wrap board-wrap">
		<div class="mypage-content board-default">

			<div class="alert alert-hint article-title">
				<input class="form-control input-sm" name="title" type="text"
					placeholder="제목">
			</div>


			<div class="article-body">
				<textarea class="form-control input-sm" rows="20" name="contents"
					cols="80" placeholder="내용입력..."></textarea>
			</div>
		</div>
	</div>
	<div class="btn-area submit_btn mypage-wrap">
		<input class="main-btn createBtn" type="submit" value="등록하기">
	</div>


</form>
</body>
</html>