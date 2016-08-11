<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../main/header.jsp"%>

<div class="searchFailed" style="display: none;">
	<p>검색조건이 없습니다.</p>
</div>

<div class="search_wrap">
	<div class="row">
		<div class="span12">
			<div class="tab-content">
				<div class="tab-pane active" id="one">
					<c:forEach items="${list}" var="tBoardVO">

							<div class="item">
								<a
									href="
				/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&id=${tBoardVO.id}&userid=${tBoardVO.memberVO.userid}">
									<div class="col-md-3 portfolio-item">
										<div class="portfolio-section">
											<img class="img-responsive" src="${tBoardVO.image}" alt="">
											<div class="main-margin">
												<h3>${tBoardVO.title}</h3>
												<p class="mainPrice">${tBoardVO.price}원</p>
												<span class="mainUserid">${tBoardVO.memberVO.userid}</span>
												<span class="mainStartCount">${reviewVO.starCount}별점</span>
											</div>
										</div>
									</div>
								</a>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="wrap_paging">

	<ul class="pagination">

		<c:if test="${pageMaker.prev}">

			<li><a
				href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">%laquo;</a></li>

		</c:if>



		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">

			<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>

				<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>

			</li>

		</c:forEach>



		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">

			<li><a
				href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>

		</c:if>



	</ul>



</div>



<script>
	$(document).ready(

	function() {

		$('#searchBtn').on(

		"click",

		function(event) {

			self.location = "list"

			+ '${pageMaker.makeQuery(1)}'

			+ "&searchType="

			+ $("select option:selected").val()

			+ "&keyword=" + $('#keywordInput').val();

		});

		var searchResult = '${failed}';

		if (searchResult == 'searchFailed') {

			$('.searchFailed').css('display', 'block');

		} else {

			$('.searchFailed').css('display', 'none');

		}

	});
</script>

</body>

</html>