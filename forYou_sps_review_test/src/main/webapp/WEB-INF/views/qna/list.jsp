<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../main/header.jsp"%>

<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header service">Q&A</h1>
		</div>
	</div>
	
<table class="note qna">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="qBoardVO" varStatus="status">
		<tbody>
			<tr>
				<td>${pageMaker.totalCount - ((pageMaker.startPage - 1) + status.index)}</td>
				<td><a
					href="/qna/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${qBoardVO.id}&userid=${qBoardVO.memberVO.userid}">${qBoardVO.title}</a></td>
				<td>${qBoardVO.memberVO.userid}</td>
				<td>${qBoardVO.regdate}</td>
			</tr>
		</tbody>
	</c:forEach>
</table>
<div class="submit_btn">
	<button type="submit" class="createBtn" name="create" >글작성</button>
</div>
	<div class="wrap_paging">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">%laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="list${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>

		</ul>

	</div>

<script>
	$(document).ready(
			function() {
				$(".createBtn").on("click", function(){
					self.location = "/qna/register";
				});
				
				$(".services").addClass("focus");
			});
</script>
</body>
</html>