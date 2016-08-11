<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<%@include file="../main/header.jsp"%>

		<article>
			<h2>신규재능</h2>
				<div class="item-box1">
					
				
				
				</div>
			<h2>공지사항</h2>
				<div class="note">
					
				
				
				</div>
		</article>
	</section>

	<script type="text/javascript">
		$(document).ready(function() {

			var result = '${msg}';

			if (result == 'success') {
				alert("회원 가입 되었습니다.");
			}

			/* var formObj = $("form[role='form']");

			console.log(formObj);

			$(".modify").on("click", function() {
				formObj.attr("action", "/member/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".remove").on("click", function() {
				formObj.attr("action", "/member/remove");
				formObj.submit();
			});

			$(".listAll").on("click", function() {
				self.location = "/main/maiPage";
			});
			 */
			var str = "";
			
			$.ajax({
				url : "/main/talents",
				type : "get",
				dataType : "json",
				success : function(data) {
					 $(data).each(function() {
						/* str += "<a href='/sboard/readPage?&id=" + this.id + "'><img src='" + this.image +"'></img></a>"; */ 
						 str += "<div class='item'>" +
							"<ul class='item-info'>" +
								"<a href='/sboard/readPage?&id="+ this.id +"&userid=" + this.memberVO.userid +"'>"+
									"<li class='image'>" + 
										"<img src='"+ this.image +"'>"+
									"</li>" +
									"<li class='title'>" + 
										this.title + this.memberVO.userid +
									"</li>" +
									"<li class='price'>" +
										"<span class='number'>"+ this.price +"</span>" +
										"<span class='unit'>원</span>" + "</li>" +
								"</a>" +
								"<li class='info clearfix'>" +
									"<span class='pull-left user-id'>" +
										"<a href='/sboard/readPage?&id="+ this.id +"&userid=" + this.memberVO.userid +"'>"+
										"</a>" +
									"</span>" +
									"<span class='pull-right score'>" +
									"</span>" +
								"</li> </ul> </div>"
					 
					 });
					
					/* str="dddddd";
					console.log(data[0].image);
					str=data[0].image; */
					 $(".item-box1").html(str);
				}
			});
			console.log(str);
			$(".item-box1").html(str);
			
		});
	</script> 
<%-- <%@include file="../main/footer.jsp"%> --%>