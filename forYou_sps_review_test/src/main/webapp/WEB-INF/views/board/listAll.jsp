<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트 페이지</title>
</head>
<body>
	<div class="talent-list">
		<!-- 카테고리 네비게이션 -->
		<div class="category-navi">
			<span class="main-category"> 페이지 정보 </span> <span
				class="products-qty"> 2,188개의 재능 </span>
		</div>

		<!-- 추천순 / 최신순 / 판매순 / 평점순 정렬 탭 -->
		<form method="GET" action="http://www.otwojob.com/list/11"
			accept-charset="UTF-8">
			<input name="sort" type="hidden" value="recommend">

			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a href="#"
					role="submitBtn" data-sort="recommend">추천순</a></li>
				<li role="presentation" class=""><a href="#" role="submitBtn"
					data-sort="latest">최신순 <span class="new-icon">NEW</span></a></li>
				<li role="presentation" class=""><a href="#" role="submitBtn"
					data-sort="score">평점순</a></li>
			</ul>
		</form>
		<!-- 카테고리 메타 -->
		<!-- 플러스 상품 -->
		<div class="plus-products">
			<div class="plus-products-wrap">
				<c:forEach items="${list}" var="tBoardVO">
					<div class="item">
						<ul class="list-unstyled product-info">
							<a href="/board/read?id=${tBoardVO.id}">
								<li class="image">
									<div class="badge-plus"></div> <!-- 우수 재능 뱃지 넣기?  --> <img
									src="${tBoardVO.image}">
							</li>
								<li class="title">${tBoardVO.title}</li>
								<li class="price"><span class="number">${tBoardVO.price}</span>
									<span class="unit">원</span></li>
							</a>
							<li class="info"><span class="pull-left user-id"></span> <span
								class="pull-right score"> <img
									src="http://www.otwojob.com/images/icons/star01.jpg"><img
									src="http://www.otwojob.com/images/icons/star01.jpg"><img
									src="http://www.otwojob.com/images/icons/star01.jpg"><img
									src="http://www.otwojob.com/images/icons/star01.jpg"><img
									src="http://www.otwojob.com/images/icons/star01.jpg"><span
									class="txt"></span>
							</span></li>
						</ul>
						<div class="item-wrap"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var result = "${msg}";
	if (result == 'success') {
		alert("재능이 등록되었습니다.")
	}
	var result = "${msg}";
	if (result == 'remove') {
		alert("재능이 삭제되었습니다.")
	}
	var result = "${msg}";
	if (result == 'modify') {
		alert("재능이 수정되었습니다.")
	}
	
</script>

</html>