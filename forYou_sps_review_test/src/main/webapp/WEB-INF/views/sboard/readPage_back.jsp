<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../main/header.jsp"%>


	<form role="form" method="post" class="form-inline">
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
</c:if>

	<ul id="replies1">
	</ul>
	
	<ul class='pagination'>
	</ul>	

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modify").on("click", function(){
		formObj.attr("action", "/sboard/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();	
	});
	
	$(".remove").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});
	
	
	$(".listAll").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
		
	});
	
	var id = ${talentBoardVO.id};
	getPageList(1);
	
	function getPageList(page) {
		$.getJSON("/reviews/" + id + "/" + page, function(data) {
			
			console.log(data.list.length);
			var str="";
			
			$(data.list).each(function() {
		
				str += "<tr data-id='"+this.id+"' class='replyLi'>"
			  	+"<td>"
				  +"<td>"
				  +"<div class="+"caption"+">"
				  	+ "<h4>" + this.memberVO.userid + " , "+ this.comment + "</h4>"  
				  	+ "<p>" + this.starCount + "</p>"
				 +"</div>"
				 +"</td>"
				+  "</td>"
			+"</tr>";
				
			});
			
			$("#reviews").html(str);
			
			printPaging(data.pageMaker);
			
		});
	}
	
	function printPaging(pageMaker){
		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){				
				var strClass= pageMaker.cri.page == i?'class=active':'';
			  str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
		}
		$('.pagination').html(str);				
	}
	
	var replyPage = 1;
	
	$(".pagination").on("click", "li a", function(event){
		
		//a href의 기본동작인 페이지 전환을 막는 역할을 한다.
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPageList(replyPage);
		
	});
	
	$("#reviewAddBtn").on("click", function() {
		var id = $(".hiddenId").val();
		console.log("hiddenId:" + id);
		var comment = $(".review").val();
		console.log("comment:" + comment);
		var starCount = $(".starCount").val();
		console.log("starCount:" + starCount);
		var tbId = $(".tbId").val();
		console.log("tbId:" + tbId);
		
		
		
		$.ajax({
			type:'post',
			url:'/reviews',
			contentType: "application/json",
			dataType:'text',
			data:JSON.stringify({
				talentBoardVO :{ id : tbId},
				memberVO :{mNo : id},
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
	
});

</script>
</body>
</html>