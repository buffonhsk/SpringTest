<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../main/header.jsp"%>
<div class="row">
	<div class="col-lg-12 service">
		<h1 class="page-header service">공지사항</h1>
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

	<c:forEach items="${list}" var="nBoardVO" varStatus="status">
		<tbody>
			<tr><p>${pageMaker.totalCount} , ${pageMaker.startPage}, ${cri.perPageNum},  ${status.index}</p>
				<td>${pageMaker.totalCount - ((pageMaker.startPage - 1) * cri.perPageNum + status.index)}</td>
				<td><a
					href="/note/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${nBoardVO.id}&userid=${nBoardVO.memberVO.userid}">${nBoardVO.title}</a></td>
				<td>${nBoardVO.memberVO.userid}</td>
				<td>${nBoardVO.regdate}</td>
			</tr>
		</tbody>
	</c:forEach>
</table>
<div class="submit_btn">
	<button type="submit" class="createBtn" name="create">글작성</button>
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
			<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
		</c:if>

	</ul>

</div>

<script>
	$(document).ready(function() {
		$(".createBtn").on("click", function() {
			self.location = "/note/register";
		});
		
		$(".services").addClass("focus");

	});
</script>
</body>
</html>