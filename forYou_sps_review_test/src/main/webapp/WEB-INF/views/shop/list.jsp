<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="../main/header.jsp"%>


<%-- 	<c:forEach items="${list}" var="ShopVO">

							<div class="item">
								<a
									href="
				/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&id=${ShopVO.id}&userid=${ShopVO.memberVO.userid}">
									<div class="col-md-3 portfolio-item">
										<div class="portfolio-section">
											<img class="img-responsive" src="${ShopVO.image}" alt="">
											<div class="main-margin">
												<h3>${ShopVO.title}</h3>
												<p class="mainPrice">${ShopVO.price}원</p>
												<span class="mainUserid">${ShopVO.memberVO.userid}</span>
												<span class="mainStartCount">${reviewVO.starCount}별점</span>
											</div>
										</div>
									</div>
								</a>
							</div>
					</c:forEach> --%>
<div class="row">
	<div class="row">
		<div class="col-lg-12 service">
			<h1 class="page-header service">재능 장바구니</h1>
		</div>
	</div>

	<div class="table_box">
		<table cellspacing="0" border="1"
			class="tb_list tb_order_check _order_area">
			<caption>장바구니 항목</caption>
			<colgroup>
				<col width="36">
				<col>
				<col width="55">
				<col width="111">
				<col width="78">
				<col width="84">
				<col width="83">
				<col width="132">
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="shop_total">
						<label for="shop_total" class="blind">전체 상품선택</label></th>
					<th scope="col" class="product"><strong>재능정보</strong></th>
					<th scope="col">가격</th>
					<th scope="col" class="bg_point">주문금액</th>
				</tr>
			</thead>

			<tfoot>
				<tr>
					<td colspan="3" class="tb_btnone">&nbsp;</td>
					<td colspan="1" class="amount bg_point2 tot">
						<dl>
							<dt class="blind">결제정보</dt>
							<dd>
								<strong>결제금액</strong>
								<p>
									<input id="subTotal" class="thm _subTotal" name="_subTotal"
										value=0 readonly="readonly" /> 원
								</p>

							</dd>
						</dl>
					</td>
				</tr>
			</tfoot>
			<c:forEach items="${list}" var="ShopVO" varStatus="status">
				<tbody>
					<tr>
						<td class="check"><input type="checkbox"
							id="shop_chk${status.index}" name="cartProductIds"
							class="_cart_order_checkbox" value="${ShopVO.price}"
							onclick="shop();"><label for="shop_chk${status.index}"
							class="blind">상품선택</label></td>
						<td class="product">
							<div>
								<div class="thmb">
									<div class="img_center">
										<a
											href="/sboard/readPage?&id=${ShopVO.talentBoardVO.id}&userid=${ShopVO.memberVO.userid}">
											<img src="${ShopVO.talentBoardVO.image}" alt="재능이미지"
											class="_view_image_area">
										</a>
									</div>
								</div>
								<dl class="title">
									<dt class="zzim_add">
										<a
											href="/sboard/readPage?&id=${ShopVO.talentBoardVO.id}&userid=${ShopVO.memberVO.userid}">${ShopVO.title}</a>
									</dt>
									<dd class="shp_toggle"></dd>
								</dl>
							</div>
						</td>
						<td><span class="num"><em class="thm _sumOrderAmount">
									${ShopVO.price}</em>원</span></td>
						<td class="bg_point order_money"><strong class="pointcol">
								<em class="thm">${ShopVO.price}</em>원
						</strong>


							<form role="form" method="post">
								<p class="btn_group">
									<input type="submit" class="sRemove btn orange-sub-btn"
										value="삭제">
								</p>
								<input name="id" type="hidden" value="${ShopVO.id}"> <input
									name="mNo" type="hidden" value="${ShopVO.memberVO.mNo}">
							</form></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

	<div class="btn_product_group">
		<p class="btn_group">
			<input type="submit" class="cRemove btn orange-sub-btn" onclick="AllRemove();" value="전체 삭제">
		</p>
	</div>
	<div class="btn_section mgt40">
		<a href="#"
			class="_btn_order _click(nmp.front.order.cart.orderChecked()) _stopDefault"><img
			src="//img.pay.naver.net/o/wstatic/img/service/front/order/btn_order.gif"
			alt="주문하기"></a> <a
			href="http://pc.shopping2.naver.com/home/p/index.nhn"><img
			src="//img.pay.naver.net/o/wstatic/img/service/front/order/btn_shopping.gif"
			alt="쇼핑 계속하기"><span class="blind">쇼핑 계속하기</span></a>

	</div>

	<%-- <tr>
							<td><img class="img-responsive" src="${ShopVO.talentBoardVO.image}" alt="">
							<td>${ShopVO.title}</td>
							<td>${ShopVO.price}</td>
						</tr> --%>

	<script type="text/javascript">
		function shop() {
			var opt = 0;

			for (var i = 0; i < $("input[name=cartProductIds]").length; i++) {
				var chkObj = $("#shop_chk" + i);
				if (chkObj.is(":checked")) {
					opt += Number(chkObj.val());
				}
			}
			console.log(opt);
			document.getElementById("subTotal").value = opt;
			console.log(document.getElementById("subTotal").value);

		}

		$("#shop_total").click(function() {
			if ($("#shop_total").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);

			} else {
				$("input[type=checkbox]").prop("checked", false);
			}

			var opt = 0;

			for (var i = 0; i < $("input[name=cartProductIds]").length; i++) {
				var chkObj = $("#shop_chk" + i);
				if (chkObj.is(":checked")) {
					opt += Number(chkObj.val());
				}
			}
			console.log(opt);
			document.getElementById("subTotal").value = opt;
			console.log(document.getElementById("subTotal").value);
		});
		
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			$(".sRemove").on("click", function() {

				if (confirm("삭제할까요?")) {
					formObj.attr("action", "/shop/removePage");
					formObj.submit();

				}
			});

		});
		
		function AllRemove() {
			
			var formObj = $("form[role='form']");
			
			if (confirm("모두 삭제할까요?")) {
				formObj.attr("action", "/shop/allRemovePage");
				formObj.submit();
			}
		}
		
		
	</script>


	</body>

	</html>