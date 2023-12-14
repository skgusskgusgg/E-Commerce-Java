<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
	<title>Order Tracking</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	
</head>
<body class="animsition">
<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row" style="justify-content: center;">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!--  -->
					<div class="p-t-55">
						<h3 class="mtext-112 cl2 p-b-10">Order Tracking</h3>

						<hr class="bor21">



						<table class="table-content-board">
							<tr class="table_head" style="font-weight: bolder; 	">
								<td class="">주문번호</td>
								<td class="">배송번호</td>
								<td class="">상품</td>
								<td class="">상품명</td>
								<td class="">색상</td>
								<td class="">사이즈</td>
								<td class="">구매수량</td>
								<td class="">구매가격</td>
								<td class="">배송현황</td>
								
							</tr>
							<c:forEach var="order" items="${orderList}">
								<tr class="table_row">
									<td class="">${order.order_id}</td>
									<td class="">${order.delivery_id}</td>
									<td class=""><img src="/resources/images/products/${order.img}"
									alt="IMG-PRODUCT" style="height:250px; width:200px;"></td>
									<td class="">${order.product_name}</td>
									<td class="">${order.color_id}</td>
									<td class="">${order.size_id}</td>
									<td class="">${order.product_count}</td>
									<td class="">${order.price}</td>
									<td class="">
									<c:if test="${order.status==1 }">배송준비중 </c:if>
									<c:if test="${order.status==2 }">배송중 </c:if>
									<c:if test="${order.status==3 }">배송완료 </c:if>
									</td>
									
								<tr>
							</c:forEach>
					
						</table>
						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<table>
								<tr>

									<c:if test="${pageMaker.prev }">
										<td class="paginate_button previous"><a
											class="flex-c-m how-pagination1 trans-04 m-all-7"
											href="${pageMaker.startPage-1 }">Previous</a></td>
									</c:if>

									<c:forEach var="num" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }">
										<td
											class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'><a
											class='flex-c-m how-pagination1 trans-04 m-all-7 ${pageMaker.cri.pageNum == num ? "active-pagination1":"" } '
											href="${num}">${num}</a></td>
									</c:forEach>

									<c:if test="${pageMaker.next}">
										<td class="paginate_button next"><a
											class="flex-c-m how-pagination1 trans-04 m-all-7"
											href="${pageMaker.endPage+1 }">Next</a></td>
									</c:if>
								</tr>
							</table>
							
							
						</div>



					</div>
				</div>
			</div>


		</div>
	</div>
</section>
<form id='actionForm' action="/mypage/orderTracking" method='get'>
	<input type='hidden' name="pageNum" value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name="amount" value='${pageMaker.cri.amount}'>
	<input type='hidden' name="id" value='${mVO.id}'>
</form>
<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm")
		var page = 10;
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.find("input[name='amount']").val(page);
			actionForm.submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>