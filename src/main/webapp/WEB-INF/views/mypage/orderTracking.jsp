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
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
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
							<tr class="table_head">
								<td class="column-1">Order_id</td>
								<td class="column-2">Delivery_id</td>
								<td class="column-3">Product_id</td>
								<td class="column-4">Product_count</td>
								<td class="column-5">Price</td>
								<td class="column-6">Status</td>
								<td class="column-7">Delivery history</td>
							</tr>
							<c:forEach var="order" items="${orderList}">
								<tr class="table_row">
									<td class="column-1">${order.order_id}</td>
									<td class="column-2">${order.delivery_id}</td>
									<td class="column-3">${order.product_id}</td>
									<td class="column-4">${order.product_count}</td>
									<td class="column-5">${order.price}</td>
									<td class="column-6">${order.status}</td>
									<td class="column-7"><a href=#>내역 확인</a></td>
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
											class="flex-c-m how-pagination1 trans-04 m-all-7"
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
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>