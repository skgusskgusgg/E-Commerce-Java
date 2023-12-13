<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="bg0 m-t-23 p-b-140">
	<div class="container">
		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="0" onclick="location.href='/admin/memberManagement'">맴버관리</button>
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="1" onclick="location.href='/admin/product/productManagement'">상품관리</button>

				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="2" onclick="location.href='/admin/orderManagement'">오더관리</button>

				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="3" onclick="location.href='/admin/deliveryManagement'">배송관리</button>

			</div>






		</div>
		<h3 class="mtext-112 cl2 p-b-10">Order Management</h3>
		<hr class="bor21">
		<h5 style="font-weight: bold;">오더 관리페이지</h5>
		<p>Order_ID & Delivery_ID & Product_ID 는 수정 불가 (FK)</p>
		<p>Price & Status 변경 => Delivery 테이블에 Total Price & Total Status 함께 수정 동기화</p>
		<hr class="bor21">

		<!-- 회원 리스트 -->
		<div class="row ">


			<table class="hyeongyumodify">
				<tr class="table_hea">
					<th>Order_ID</th>
					<th>Delivery_ID</th>
					<th>Product_ID</th>
					<th>Product_count</th>
					<th>Price</th>
					<th>Status</th>
					<th>상세</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="order" items="${orderList}">
					<tr class="table_ro">
						<td><input type="text" value="${order.order_id}"
							id="id${order.order_id}" readonly></td>
						<td><input type="text" value="${order.delivery_id}"
							id="deliveryid${order.order_id}" readonly></td>
						<td><input type="text" value="${order.product_id}"
							id="productid${order.order_id}" readonly></td>
						<td><input type="text" value="${order.product_count}"
							id="count${order.order_id}"></td>
						<td><input type="text" value="${order.price}"
							id="price${order.order_id}"></td>
						<td><select id="status${order.order_id}">


								<option value="0"
									<c:if test="${order.status==0}">selected</c:if>>배송준비</option>
								<option value="1"
									<c:if test="${order.status==1}">selected</c:if>>배송중</option>
								<option value="2"
									<c:if test="${order.status==2}">selected</c:if>>배송완료</option>
						</select></td>

						<td><button class="orderDetail custom-btn btn-14"
								value="${order.delivery_id}">상세</button></td>
						<td><button class="modify custom-btn btn-3"
								value="${order.order_id}">
								<span>수정</span>
							</button></td>
						<td><button class="deleteOrder custom-btn btn-5"
								value="${order.order_id}">
								<span>삭제</span>
							</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td style="height: 20px;"></td>
				</tr>
				<tr>
					<td colspan="5"></td>
					<td colspan="1"><select id="orderSort">
							<option>order_id</option>
							<option>delivery_id</option>
							<option>product_id</option>
							<option>price</option>
							<option>status</option>
					</select></td>
					<td colspan="1" class="size-100"><input
						class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
						placeholder="키워드입력" id="keyword" value="${keyword }"></td>
					<td colspan="2"><button
							class="keywordSearch custom-btn btn-12">
							<span>Click!</span><span>키워드검색</span>
						</button></td>
				</tr>
			</table>

		</div>


		<div class="flex-c-m flex-w w-full p-t-45">

			<!-- Pagination -->
			<table>
				<tr>

					<c:if test="${pageManagement.prev }">
						<td class="paginate_button previous"><a
							class="flex-c-m how-pagination1 trans-04 m-all-7"
							href="${pageManagement.startPage-1 }">Previous</a></td>
					</c:if>

					<c:forEach var="num" begin="${pageManagement.startPage }"
						end="${pageManagement.endPage }">
						<td
							class='paginate_button ${pageManagement.cri.pageNum == num ? "active":"" }'><a
							class='flex-c-m how-pagination1 trans-04 m-all-7 ${pageManagement.cri.pageNum == num ? "active-pagination1":"" } '
							href="${num}">${num}</a></td>
					</c:forEach>

					<c:if test="${pageManagement.next}">
						<td class="paginate_button next"><a
							class="flex-c-m how-pagination1 trans-04 m-all-7"
							href="${pageManagement.endPage+1 }">Next</a></td>
					</c:if>
				</tr>
			</table>

		</div>
	</div>
</div>

<!-- Modal Order Detail -->
<div class="wrap-modal-login js-modal-order p-t-60 p-b-20">
	<div class="overlay-modal-login js-hide-modal-modify"></div>

	<div id="modalContainer">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal-order">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>

			<div class="authincation">

				<div class="container-fluid modal-sizing ">

					


					
							<h4 class="text-center mb-4">배송정보</h4>
							<p class="text-center mb-4"> 관련 delivery 정보 불러오기</p>
						
						<div class="size">
						<table style="width: 80%; height: 100%">
							<thead>
								<tr>
									<th>배송ID</th>
									<th>회원ID</th>
									<th>총구매가격</th>
									<th>구매일</th>
									<th>배송현황</th>
								</tr>
							</thead>
							<tbody class="table_body">

							</tbody>

						</table>


					</div>
					



					
				</div>
			</div>
		</div>
	</div>
</div>


<form id='actionForm' action="/admin/orderManagement/" method='get'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'>
</form>

<form id='keywordSearchForm'
	action="/admin/orderManagement/orderKeywordSearch/" method='get'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="orderSort"> <input type='hidden'
		name="keyword">

</form>


<form id='modifyForm' action="/admin/orderManagement/modifyOrder/"
	method='post'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="order_id"> <input type='hidden'
		name="delivery_id"> <input type='hidden' name="product_count">
	<input type='hidden' name="price"> <input type='hidden'
		name="status">
</form>

<form id='deleteForm' action="/admin/orderManagement/deleteOrder/"
	method='post'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="id">
</form>

<form id='orderDetailForm'
	action="/admin/orderManagement/orderDetailForm/" method='get'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="order_id">
</form>

<script>
	$(document)
			.ready(
					function() {

						$("#orderSort").val("${orderSort}");

						var page = 10;
						var actionForm = $("#actionForm");
						var keyword = $("#keyword").val();
						var orderSort = $("#orderSort").val();

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();

									if (keyword.length > 0) {
										keyword = $("#keyword").val();
										orderSort = $("#orderSort").val();
										keywordSearchForm.find(
												"input[name='pageNum']").val(
												$(this).attr("href"));
										keywordSearchForm.find(
												"input[name='amount']").val(
												page);
										keywordSearchForm.find(
												"input[name='keyword']").val(
												keyword);
										keywordSearchForm.find(
												"input[name='orderSort']").val(
												orderSort);
										keywordSearchForm.submit();
									} else {
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.find("input[name='amount']")
												.val(page);

										actionForm.submit();
									}
								});

						var deleteForm = $("#deleteForm");
						$(".deleteOrder").on("click", function() {

							var deleteId = $(this).val();
							deleteForm.find("input[name='id']").val(deleteId);
							deleteForm.submit();
						});

						var keywordSearchForm = $("#keywordSearchForm");
						$(".keywordSearch").on(
								"click",
								function() {
									keyword = $("#keyword").val();
									var orderSort = $("#orderSort").val();
									if (keyword == null || orderSort == null) {
										return false;

									}
									keywordSearchForm.find(
											"input[name='keyword']").val(
											keyword);
									keywordSearchForm.find(
											"input[name='orderSort']").val(
											orderSort);
									keywordSearchForm.submit();
								});

						var modifyForm = $("#modifyForm");
						$(".modify")
								.on(
										"click",
										function() {
											var selecetedId = $(this).val();
											var product_count = $(
													"#count" + selecetedId)
													.val();
											var price = $(
													"#price" + selecetedId)
													.val();
											var status = $(
													"#status" + selecetedId)
													.val();
											var delivery_id = $(
													"#deliveryid" + selecetedId)
													.val();
											modifyForm.find(
													"input[name='order_id']")
													.val(selecetedId);
											modifyForm
													.find(
															"input[name='delivery_id']")
													.val(delivery_id);
											modifyForm
													.find(
															"input[name='product_count']")
													.val(product_count);
											modifyForm.find(
													"input[name='price']").val(
													price);
											modifyForm.find(
													"input[name='status']")
													.val(status);

											modifyForm.submit();

										});

						var orderDetailForm = $("#orderDetailForm");
						$(".orderDetail")
								.on(
										"click",
										function() {
											var orderDetailID = $(this).val();
											orderDetailForm.find(
													"input[name='order_id']")
													.val(orderDetailID);
											$('.js-modal-order').addClass(
													'js-modal-order-show');

											$
													.ajax({
														type : "get",
														url : "/admin/orderManagement/orderDetail/",
														data : {
															id : orderDetailID
														},
														dataType : "json",
														success : function(data) {

															console.log("통신성공");
															console.log(data);
															var str = '';
															var de = '';
															if(data.total_status==0){de="배송전";}
															else if(data.total_status==1){de="배송중";}
															else{de="배송완료";}
															
															str += '<tr>'
																	+ '<td>'
																	+ data.delivery_id
																	+ '</td>'
																	+ '<td>'
																	+ data.member_id
																	+ '</td>'
																	+ '<td>'
																	+ data.total_price
																	+ '</td>'
																	+ '<td>'
																	+ data.regdate
																	+ '</td>'
																	+ '<td>'
																	+ de
																	
																	+ '</td>'
																	+ '</tr>';
															$('.table_body')
																	.empty()
																	.append(str);

														},
														error : function() {
															console.log("통신에러");
														}
													});

										});

						$(".js-hide-modal-order").on(
								"click",
								function() {
									$('.js-modal-order').removeClass(
											'js-modal-order-show');
								});

					});
</script>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/addWish.js"></script>

<style>

.modal-sizing{

height: 300px;	

}


.js-modal-order-show {
	visibility: visible;
	opacity: 1;
}
.size{
position: relative;
border-collapse: separate;
border-spacing: 10px 10px;
display: flex;
overflow-x: auto;
width:100%;
height:100%;
}


.custom-btn {
	width: 60px;
	height: 60px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

/* 3 */
.btn-3 {
	background: rgb(0, 172, 238);
	background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
	width: 80px;
	height: 60px;
	line-height: 42px;
	padding: 0;
	padding-top: 0px;
	border: none;
}

.btn-3 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.btn-3:before, .btn-3:after {
	position: absolute;
	content: "";
	right: 0;
	top: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3:before {
	height: 0%;
	width: 2px;
}

.btn-3:after {
	width: 0%;
	height: 2px;
}

.btn-3:hover {
	background: transparent;
	box-shadow: none;
}

.btn-3:hover:before {
	height: 100%;
}

.btn-3:hover:after {
	width: 100%;
}

.btn-3 span:hover {
	color: rgba(2, 126, 251, 1);
}

.btn-3 span:before, .btn-3 span:after {
	position: absolute;
	content: "";
	left: 0;
	bottom: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3 span:before {
	width: 2px;
	height: 0%;
}

.btn-3 span:after {
	width: 0%;
	height: 2px;
}

.btn-3 span:hover:before {
	height: 100%;
}

.btn-3 span:hover:after {
	width: 100%;
}

/* 5 */
.btn-5 {
	width: 80px;
	height: 60px;
	line-height: 42px;
	padding: 0;
	border: none;
	background: rgb(255, 27, 0);
	background: linear-gradient(0deg, rgba(255, 27, 0, 1) 0%,
		rgba(251, 75, 2, 1) 100%);
}

.btn-5:hover {
	color: #f0094a;
	background: transparent;
	box-shadow: none;
}

.btn-5:before, .btn-5:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #f0094a;
	box-shadow: -1px -1px 5px 0px #fff, 7px 7px 20px 0px #0003, 4px 4px 5px
		0px #0002;
	transition: 400ms ease all;
}

.btn-5:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btn-5:hover:before, .btn-5:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/* 11 */
.btn-11 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	width: 130px;
	height: 40px;
	line-height: 40px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-11 span {
	display: block;
	position: absolute;
	width: 130px;
	height: 40px;
	border: 2px solid #000;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-11 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-11 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-11:hover span:nth-child(1) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-11:hover span:nth-child(2) {
	background: #e0e5ec;
	color: #e0e5ec;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}

.btn-12 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	box-shadow: none;
	width: 130px;
	height: 40px;
	line-height: 42px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-12 span {
	background: rgb(0, 172, 238);
	background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
	display: block;
	position: absolute;
	width: 130px;
	height: 40px;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	border-radius: 5px;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-12 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12:hover span:nth-child(1) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-12:hover span:nth-child(2) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	color: transparent;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}

/* 14 */
.btn-14 {
	background: rgb(255, 151, 0);
	border: none;
	z-index: 1;
}

.btn-14:after {
	position: absolute;
	content: "";
	width: 100%;
	height: 0;
	top: 0;
	left: 0;
	z-index: -1;
	border-radius: 5px;
	background-color: #eaf818;
	background-image: linear-gradient(315deg, #eaf818 0%, #f6fc9c 74%);
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	transition: all 0.3s ease;
}

.btn-14:hover {
	color: #000;
}

.btn-14:hover:after {
	top: auto;
	bottom: 0;
	height: 100%;
}

.btn-14:active {
	top: 2px;
}

.hyeongyumodify {
	position: relative;
	width: 100%;
	font-size: 12px;
}

.hyeongyumodify input {
	border-radius: 5px;
	border: 1px solid black;
	box-sizing: border-box;
	height: 100%;
}

.hyeongyumodify td input[type="text"] {
	text-align: center;
	height: 100%;
	width: 100%;
}

.hyeongyumodify td {
	height: 45px;
	padding-left: 2px;
	padding-bottom: 10px;
	text-align: center;
}

.hyeongyumodify th {
	height: 45px;
	padding-left: 2px;
	padding-bottom: 10px;
	text-align: center;
}

.hyeongyumodify tr {
	height: 45px;
}

.hyeongyumodify tr td:nth-child(1) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(2) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(3) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(4) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(5) {
	width: 20%;
}

.hyeongyumodify tr td:nth-child(6) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(7) {
	width: 5%;
}

.hyeongyumodify tr td:nth-child(8) {
	width: 5%;
}

.hyeongyumodify tr td:last-child {
	width: 5%;
}
</style>