<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>


	<form role="form" method="post" class="form-inline">
		 <input name="id" type="hidden" value="${talentBoardVO.id}">
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
							<th>판매자 문의하기</th>
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

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modify").on("click", function(){
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");
		formObj.submit();	
	});
	
	$(".remove").on("click", function(){
		formObj.attr("action", "/board/remove");
		formObj.submit();
	});
	
	
	$(".listAll").on("click", function(){
		self.location="/board/listAll";	
	});
});

</script>
</body>
</html>