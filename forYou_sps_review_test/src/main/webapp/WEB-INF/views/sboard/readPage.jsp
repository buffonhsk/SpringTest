<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../main/header.jsp"%>

<div class="body-wrap">
	<div class="talent-view">

		<div class="user-profile-info">
			<ul class="list-inline clearfix">
				
				<li><span class="title">${talentBoardVO.title}</span> <span class="userid">
						${talentBoardVO.memberVO.userid} </span></li>
			</ul>
		</div>
		<form role="form"
			accept-charset="UTF-8" class="form-inline">
			<input name="mNo" type="hidden" value="${memberVO.mNo}">
			<input name="id" type="hidden" value="${talentBoardVO.id}"> <input
				name="userid" type="hidden" value="${talentBoardVO.memberVO.userid}">
				<input name="starCount" type="hidden" value="">
			<input name="page" type="hidden" value="${cri.page}"> <input
				name="perPageNum" type="hidden" value="${cri.perPageNum}"> <input
				name="searchType" type="hidden" value="${cri.searchType}"> <input
				name="keyword" type="hidden" value="${cri.keyword}">
			<div class="product-wrap clearfix">
				<div class="product-info">
					<div class="image">
						<img src="${talentBoardVO.image}" width="426px" height="327px">
					</div>

				</div>
				<div class="order-info">
					<table>
						<tbody>
							<tr>
								<th>가격</th>
								<td class="highlight"><strong><span class="number">${talentBoardVO.price}</span>원</strong>
								</td>
							</tr>
							<tr>
								<th>구매만족도</th>
								<td><span class="avg"></span> </td>
							</tr>
							<tr>
								<th>판매자 문의하기</th>
								<td><a class="link-cursor message-btn" href="#">문의하기</a></td>
							</tr>
						</tbody>
					</table>
					<div class="btn-area">
						<button type="submit" class="btn orange-btn order-btn">
							<span class="glyphicon glyphicon-ok-sign"></span> 주문하기
						</button>
						<button class="addCart btn orange-sub-btn wishlist-btn">담기</button>
						<div class="btn-area">
						<button class="modify btn orange-sub-btn" type="submit">재능 수정</button>
					<button class="remove btn orange-sub-btn" type="submit">재능 삭제</button>
					<button class="listAll btn orange-sub-btn" type="submit">재능 보러 가기</button>
					</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="clearfix">
		<div class="talent-additional-info pull-left">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a href="#detail_view"
					name="detail_view">상세정보</a></li>
				<li role="presentation"><a href="#buyer_review">구매자 리뷰 <span
						class="highlight"></span></a></li>
			</ul>
			<div class="content">

				<pre>${talentBoardVO.contents}</pre>

				<ul class="nav nav-tabs">
					<li role="presentation"><a href="#detail_view">상세정보</a></li>
					<li role="presentation" class="active"><a href="#buyer_review"
						name="buyer_review">구매자 리뷰 <span class="highlight"></span></a></li>

				</ul>
				<div class="content">
					<!-- 리뷰 -->
					<div id="reviewList">

						
					</div>
				</div>
					<table id="reviews" class="table table-bordered">


					</table>
					<c:if test="${!empty memberVO.userid}">
						<input class="hiddenId" type="hidden" value="${memberVO.mNo}">
						<input class="tbId" type="hidden" value="${talentBoardVO.id}">
						
						
						
						<div class="reviews_form">
						
							<ul class="list-unstyled user-review clearfix user-review-list">
	
								<li class="user-content" style="max-width: 649px;">
									<div><p>${memberVO.userid}</p>
										평가 : <input class="starCount" type="hidden" name="starCount">
											</div><span id="rateYo"><strong> </strong></span>
									</div>
									댓글: <input class="review" type="text" name="comment">
								</li>
							</ul>
							<%-- <div>
								아이디: <input class="userid" type="text" name="userid"
									value="${memberVO.userid}" readonly="readonly">
							</div>
							<div>
								댓글: <input class="review" type="text" name="comment">
							</div>
							<div>
								별점: <input class="starCount" type="text" name="starCount">
							</div> --%>
							
							<button id="reviewAddBtn" class="orange-sub-btn">등록</button>
						
						</div>
					</c:if>

					<%-- <form role="form" method="post" class="form-inline">
		 <input name="id" type="hidden" value="${talentBoardVO.id}">
		 <input name="userid" type="hidden" value="${talentBoardVO.memberVO.userid}">
		 <input name="page" type="hidden" value="${cri.page}">
		 <input name="perPageNum" type="hidden" value="${cri.perPageNum}">
		 <input name="searchType" type="hidden" value="${cri.searchType}">
		 <input name="keyword" type="hidden" value="${cri.keyword}">
	</form>
		<div class="product-wrap clearfix">
			<div class="product-info">
				<div class="image">
					<img src="${talentBoardVO.image}">
				</div>
			</div>
			<div class="order-info">
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td class="highlight"><strong>${talentBoardVO.title}</strong>
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td class="highlight"><strong><span class="number">${talentBoardVO.price}</span>원</strong>
							</td>
						</tr>
						<tr>
							<th>재능내용</th>
							<td class="highlight">${talentBoardVO.contents}
							</td>
						</tr>
						<tr>
							<th>판매자 문의하기  ${talentBoardVO.memberVO.userid}</th>
							<td><button type="button">쪽지 보내기</button></td>
						</tr>
					</tbody>
				</table>
				<div class="btn-area">
					<button type="submit" class="btn orange-btn order-btn">
						<span class="glyphicon glyphicon-ok-sign"></span> 주문하기
					</button>
					<button class="btn orange-sub-btn wishlist-btn" type="button">담기</button>
					<button class="modify" type="submit">재능 수정</button>
					<button class="remove" type="submit">재능 삭제</button>
					<button class="listAll" type="submit">재능 보러 가기</button>
				</div>
			</div>
		</div>
	

	<div class="content">
		<pre>
			${tBoardVO.contents}
		</pre>
	</div>
	
	<table id="reviews" class="table table-bordered">
	

</table>
	
	<c:if test="${!empty memberVO.userid}">
	<input class="hiddenId" type="hidden" value="${memberVO.mNo}">
	<input class="tbId" type="hidden" value="${talentBoardVO.id}">
	<div>
		<div>
			아이디: <input class="userid" type="text" name="userid" value="${memberVO.userid}" readonly="readonly">
		</div>
		<div>
			댓글: <input class="review" type="text" name="comment">
		</div>
		<div>
			별점: <input class="starCount" type="text" name="starCount">
		</div>
		<button id="reviewAddBtn">등록</button>
	
	</div>
</c:if> --%>

		<ul id="replies1">
		</ul>
	<div class="wrap_paging">
		<ul class='pagination'>
		</ul>
		</div>
	
<script type="text/javascript">
$(document).ready(
		
		function() {
		
			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".modify").on("click", function() {
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".remove").on("click", function() {
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
			});

			$(".listAll").on("click", function() {
				window.history.back();
			});
			
			$(".addCart").on("click", function() {
				formObj.attr("action", "/shop/cart_add");
				formObj.attr("method", "post");
				formObj.submit();
				alert("장바구니에 담았습니다.")
			});
			

			var id = ${talentBoardVO.id};
			getPageList(1);
			var mid = $(".hiddenId").val();
			console.log("mid:" + mid);
			var tbId = $(".tbId").val();
			console.log("tbId..." + tbId)
			var dataLength = 0;
			var avg = 0;
			var totalCnt = 0;
			var viewStar = $("input[name=starCount]").val();
			function getPageList(page) {
				$.getJSON("/reviews/" + id + "/" + page,
						function(data) {
							dataLength = data.list.length;
							console.log("total" + data.list.length);
							var str = "";
						//댓글 보이기
							$(data.list).each(function() {
										
										totalCnt += this.starCount;
										str += "<ul class='list-unstyled user-review clearfix user-review-list'>" 

											 + "<li class='user-content' style='max-width: 649px;'>"
										    + "<div><p>" + this.memberVO.userid + "</p> 평가 : <span class='rateYo'><strong>"
										      + "</strong></span> </div> <div class='txt'>" + this.comment
										    + "</div> <span class='help-block regdate'>" + this.regdate + "</span>"
										    +"<input class='count' type='hidden' value='" + this.starCount +"'></li>";
										    if( this.memberVO.mNo == mid ){
										    	str +="<button>dd</button></ul>";
										    }else{
										    	str +="</ul>";
										    }
										    
										  console.log("mNo"+ mid + "this.mNo" + this.memberVO.mNo );
										  console.log(this.memberVO.userid);
									
										console.log(this.starCount);
									
									});
							$("#reviewList").html(str);
							//댓글 별점 보이기
							$("li.user-content").each( function( index ){
								var starCount = $(this).find(".count").val();

								$(this).find(".rateYo").rateYo({
								    rating: starCount,
								    readOnly: true
							
								  });
								
								
							});
							//댓글 전체 평균 값
						 	avg = totalCnt/data.list.length;
							$(".avg").rateYo({
								rating: avg,
								readOnly: true
							});
							
							
							addVal(viewStar, tbId);
							
							
							
				
						});
				}
			//starCount 평균값 메인에 뿌리기..(파라미터값이 안넘어감.)
			function addVal(viewStar, tbId) {
				$.ajax({
					type : 'post',
					url : '/board/avgStar',
					contentType : "application/json",
					dataType : 'text',
					data :({
							id : 1,
							avgStar : viewStar
					}),
					success : function(avgStar) {
						if (avgStar > 0) {
							console.log("avgStar 등록" +avgStar);							
						}
					}
				});
				
			} 
			
			var fixRating = 0;
			$("#rateYo" ).rateYo({
				fullStar: true,
				onSet: function (rating, rateYoInstance) {
					 
				      fixRating = rating;
				      console.log(fixRating);
				}
			});
			
			
			
			$("#reviewAddBtn").on("click", function() {
				var id = $(".hiddenId").val();
				

				console.log("hiddenId:" + id);
				var comment = $(".review").val();
				console.log("comment:" + comment);
				var starCount = $(".starCount").val();
				starCount = fixRating;
				console.log("starCount:" + starCount);
				
				console.log("tbId:" + tbId);

				
				$.ajax({
					type : 'post',
					url : '/reviews',
					contentType : "application/json",
					dataType : 'text',
					data : JSON.stringify({
						talentBoardVO : {
							id : tbId,
						},
						memberVO : {
							mNo : id
						},
						comment : comment,
						starCount : starCount
					}),
					success : function(result) {
						if (result == 'success') {
							alert("등록 되었습니다.");
							location.reload();
						}
					}
				});
				

			});
			
			
			

			function printPaging(pageMaker) {

				var str = "";

				if (pageMaker.prev) {
					str += "<li><a href='" + (pageMaker.startPage - 1)
							+ "'> << </a></li>";
				}

				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.cri.page == i ? 'class=active'
							: '';
					str += "<li " + strClass + "><a href='" + i + "'>"
							+ i + "</a></li>";
				}

				if (pageMaker.next) {
					str += "<li><a href='" + (pageMaker.endPage + 1)
							+ "'> >> </a></li>";
				}
				$('.pagination').html(str);
			}

			var replyPage = 1;

			$(".pagination").on("click", "li a", function(event) {

				// a href의 기본동작인 페이지 전환을 막는 역할을 한다.
				event.preventDefault();

				replyPage = $(this).attr("href");

				getPageList(replyPage);

			});

			
			

		});


</script>
</body>
</html>