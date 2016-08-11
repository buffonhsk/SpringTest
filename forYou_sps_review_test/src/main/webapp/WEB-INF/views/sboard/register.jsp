<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp"%>

	<div class="talent-view">

	<form role="form" method="post" enctype="multipart/form-data">
		<input name="mNo" type="hidden" value="${memberVO.mNo}">
		
		<div class="user-profile-info">
			<ul class="list-inline clearfix">

				<li><input class="form-control input-sm" name="title"
						type="text" value="" placeholder="제목입력란.."></li>
			</ul>
		</div>
		
			
			<div class="product-wrap clearfix">
				<div class="product-info">
					<div class="image">
						<img src="" width="426px" height="327px">
					</div>
					<div class="profile-picture">
					<input name="image_1" type="file">
					</div>

				</div>
				<div class="order-info price">
					<table>
						<tbody>
							<tr>
								<th>가격</th>
								<td class="highlight"><select class="form-control input-sm" name="price">
						<option value="0">무료</option>
						<option value="10000">10,000원</option>
						<option value="20000">20,000원</option>
						<option value="30000">30,000원</option>
						<option value="40000">40,000원</option>
						<option value="50000">50,000원</option>
					</select>
								</td>
							</tr>
								<tr>
								<th>전문분야</th>
								<td class="highlight"><select class="form-control input-sm" name="catalogVO.id">
						<option value="">선택</option>
						<option value="1">게임</option>
						<option value="2">디자인</option>
						<option value="3">스터디</option>
						<option value="4">요리</option>
						<option value="5">음악</option>
					</select>
								</td>
							</tr>
							
						</tbody>
					</table>
					

				</div>
				<div class="talent-additional-info pull-left">
				<div class="content">
	
					<textarea class="form-control input-sm" rows="30"
								name="contents" cols="115" placeholder="내용입력란.."></textarea>
				</div>
				</div>
			
			</div>
		</form>
	</div>
		<div class="btn-area">
						<button class="register btn orange-sub-btn" type="submit">재능 등록</button>
					<button class="btn orange-sub-btn" type="reset">다시입력</button>
					<button class="listAll btn orange-sub-btn" type="submit">돌아가기</button>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

/* 		$(".cancel").on("click", function() {
			self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		}); */

		$(".register").on("click", function() {
			formObj.submit();
		});
		
		$(".listAll").on("click", function() {
			window.history.back();
		});
		

	});
</script>
	
</body>
</html>