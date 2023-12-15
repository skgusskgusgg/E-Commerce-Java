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
		<h3 class="mtext-112 cl2 p-b-10">Delivery Management</h3>
		<hr class="bor21">
		<p>배송ID, 회원ID, Total Price 는 수정 불가 </p>
		<p>구매일자 & 전체배송상태 수정 가능, but 수정버튼 누를 시, 하위 order 전부 status 동일하게 수정 동기화 됨에 유의</p>
		<p>삭제버튼 누를 시, 하위 order 전부 삭제 동기화 됨에 유의</p>
		<hr class="bor21">

		<!-- 회원 리스트 -->
		<div class="row ">


			<table class="hyeongyumodify">
				<tr class="table_hea">
					<th>배송ID</th>
					<th>회원ID</th>
					<th>구매일자</th>
					<th>전체배송상태</th>
					<th>상세</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="delivery" items="${deliveryList}">
					<tr class="table_ro">
					
						<td><input type="text" value="${delivery.delivery_id}" id="id${delivery.delivery_id}"
							readonly></td>
						<td><input type="text" value="${delivery.member_id}" id="member${delivery.delivery_id}" readonly></td>
						
						<td><input type="text"
							value="${delivery.regdate}" id="regdate${delivery.delivery_id}"></td>
						
							<td><select id="totalstatus${delivery.delivery_id}">


								<option value="1"
									<c:if test="${delivery.total_status==1}">selected</c:if>>배송준비</option>
								<option value="2"
									<c:if test="${delivery.total_status==2}">selected</c:if>>배송중</option>
								<option value="3"
									<c:if test="${delivery.total_status==3}">selected</c:if>>배송완료</option>
						</select></td>
							
							
							<td><button class="deliveryDetail custom-btn btn-12" value="${delivery.delivery_id}"><span>Click!</span><span>상세</span></button></td>
							
						<td><button class="modify custom-btn btn-4" value="${delivery.delivery_id}"><span>수정</span></button></td>
						<td><button class="deleteDelivery custom-btn btn-5" value="${delivery.delivery_id}"><span>삭제</span></button></td>
					</tr>
					<input type="hidden" value="${delivery.total_price}" id="totalprice${delivery.delivery_id}" readonly>
				</c:forEach>
				<tr><td colspan="7" style="height: 20px;"></td></tr>
					<tr>
					<td colspan="3"></td>
					<td colspan="1"><select id="deliverySort">
							<option value="delivery_id">배송ID</option>
							<option value="member_id">회원ID</option>

							<option value="regdate">구매일자</option>
							<option value="total_status">전체배송상태</option>
					</select></td>
					<td colspan="1" class="size-100"><input class="stext-111 cl2 plh3 size-126 p-lr-18" type="text" value="${keyword }"  placeholder="키워드입력" id="keyword"></td>
					<td colspan="2"><button class="keywordSearch custom-btn btn-8" style="width: 200px;" >키워드검색</button></td>
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
							class='flex-c-m how-pagination1 trans-04 m-all-7 ${pageManagement.cri.pageNum == num ? "active-pagination1":"" } ' href="${num}">${num}</a></td>
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



<div id="myModal" class="modal">


	<div class="Modalhead">
		<h4 class="text-center mb-4">배송정보</h4>
		<p class="text-center mb-4"> 관련 delivery 정보 불러오기</p>
	</div>
	
  <div class="modal-content">
    <span class="close">&times;</span>
    <table style=" text-align: center; ">
    <thead>
    <tr>
    <th>오더ID</tH>
    <th>배송id</th>
    <th>상품ID</th>
    <th>구매수량</th>
    <th>상품가격</th>
    <th>배송현황</th>
    </tr>
    </thead>
    
    
    <tbody id="orderList">
    
    </tbody>
    </table> 
  </div>
</div>


<form id='actionForm' action="/admin/deliveryManagement" method='get'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'>
</form>

<form id='keywordSearchForm' action="/admin/deliveryManagement/deliveryKeywordSearch/" method='get'>
	<input type='hidden' name="pageNum"	value='${pageManagement.cri.pageNum}'>
	<input type='hidden' name="amount" value='${pageManagement.cri.amount}'>
  <input type='hidden' name="deliverySort">
	<input type='hidden' name="keyword">
</form>


<form id='modifyForm' action="/admin/deliveryManagement/modifyDelivery/"
	method='post'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="delivery_id"> <input type='hidden'
		name="regdate"> <input type='hidden' name=total_status>
	<input type='hidden' name="deliverySort"> <input type='hidden'
		name="keyword">
</form>

<form id='deleteForm' action="/admin/deliveryManagement/deleteDelivery/"
	method='post'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'> <input
		type='hidden' name="id"><input type='hidden' name="deliverySort"> <input type='hidden'
		name="keyword">
</form>




<script>


	$(document).ready(function() {
		$("#deliverySort").val("${deliverySort}");
		var page = 10;
		var actionForm = $("#actionForm");
		var keywordSearchForm = $("#keywordSearchForm");
		
		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			keyword = $("#keyword").val();
			deliverySort = $("#deliverySort").val();

      	if (keyword.length > 0) {
										
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
						                  "input[name='deliverySort']").val(
						                    deliverySort);
						              keywordSearchForm.submit();
									} else {
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.find("input[name='amount']").val(page);

			actionForm.submit();
                  }
		});




		
        $(".keywordSearch").on(
            "click",
            function() {
              keyword = $("#keyword").val();
              var deliverySort = $("#deliverySort").val();
              if (keyword == null || deliverySort == null) {
                return false;

              }
              keywordSearchForm.find(
                  "input[name='keyword']").val(
                  keyword);
              keywordSearchForm.find(
                  "input[name='deliverySort']").val(
                    deliverySort);
              keywordSearchForm.submit();
            });

        var modifyForm = $("#modifyForm");
		$(".modify")
				.on(
						"click",
						function() {
							var selecetedId = $(this).val();

							var regdate = $(
									"#regdate" + selecetedId)
									.val();
							var total_status = $(
									"#totalstatus" + selecetedId)
									.val();
							var keyword = $("#keyword").val();
				            var deliverySort = $("#deliverySort").val();
							
							modifyForm.find(
									"input[name='delivery_id']")
									.val(selecetedId);
							modifyForm
									.find(
											"input[name='regdate']")
									.val(regdate);
							modifyForm
									.find(
											"input[name='total_status']")
									.val(total_status);
							modifyForm.find(
									"input[name='deliverySort']").val(
											deliverySort);
							modifyForm.find(
									"input[name='keyword']")
									.val(keyword);

							modifyForm.submit();

						});





            
        var deleteForm = $("#deleteForm");
        $(".deleteDelivery").on("click", function() {

          var deleteId = $(this).val();
          var keyword = $("#keyword").val();
          var deliverySort = $("#deliverySort").val();
          deleteForm.find("input[name='id']").val(deleteId);
          deleteForm.find("input[name='keyword']").val(keyword);
          deleteForm.find("input[name='deliverySort']").val(deliverySort);
          deleteForm.submit();
        });


		$(".deliveryDetail").on("click", function() {
			var deliveryI = $(this).val();
			$("#myModal").css("display", "block");
			
			$.ajax({
				  type: "GET",
				  url: "/admin/deliveryManagement/deliveryDetail/",
				  data: { id: deliveryI },
				  dataType :'json',
				  success: function(result) {
					  console.log(result);
				    var orderList = $("#orderList");
				    orderList.empty(); 
				    
				    var del = "";
				    for (var i = 0; i < result.length; i++) {
				      var order = result[i]; 
				      
				      if(order.status==1){del="배송전"}
				      if(order.status==2){del="배송중"}
				      if(order.status==3){del="배송완료"}
				      
				      orderList.append("<tr>" +
				        "<td>" + order.order_id + "</td>" +
				        "<td>" + order.delivery_id + "</td>" +
				        "<td>" + order.product_id + "</td>" +
				        "<td>" + order.product_count + "</td>" +
				        "<td>" + order.price + "</td>" +
				        "<td>" + del + "</td>" +
				        "</tr>");
				    }
				  },
				  error: function(xhr, status, error) {
				    console.error("Error: " + error);
				  }
				});

			
			
		});
			$(".close, .modal").click(function() {
			    $("#myModal").css("display", "none"); 
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

.modal {
  display: none; /* 모달 창은 초기에 숨김 */
  position: fixed;
  z-index: 9000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4); /* 배경에 어둡게 */
}

/* 모달 창 내용 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}








.custom-btn {
  width: 60px;
  height: 40px;
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
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}


/* 3 */
.btn-3 {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  width: 60px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
   background: rgba(2,126,251,1);
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
.btn-3:hover{
   background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover{
   color: rgba(2,126,251,1);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
   background: rgba(2,126,251,1);
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
  width: 60px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  background: rgb(255,27,0);
background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
}
.btn-5:hover {
  color: #f0094a;
  background: transparent;
   box-shadow:none;
}
.btn-5:before,
.btn-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f0094a;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:400ms ease all;
}
.btn-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn-5:hover:before,
.btn-5:hover:after{
  width:100%;
  transition:800ms ease all;
}



.btn-8 {
   line-height: 40px;
  padding: 0;
  background: transparent;
  position: relative;
  z-index: 2;
  color: #fff;
  -webkit-perspective: 300px;
  perspective: 300px;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
.btn-8:hover{
  color: #000;
}
.btn-8:after {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  z-index: -1;
  -webkit-transform-origin: center bottom;
  transform-origin: center bottom;
  -webkit-transform: rotateX(0);
  transform: rotateX(0);
  transition: all 0.3s ease;
}
.btn-8:hover:after {
  -webkit-transform: rotateX(-180deg);
  transform: rotateX(-180deg);
}

/* 4 */
.btn-4 {
  position: relative;
  color: #000;
  z-index: 2;
  line-height: 40px;
  padding: 0;
}
.btn-4:hover{
  border: none;
}
.btn-4:before,
.btn-4:after {
  position: absolute;
  content: "";
  width: 0%;
  height: 0%;
  border: 2px solid;
  z-index: -1;
  transition: all 0.3s ease;
}
.btn-4:before {
  top: 0;
   left: 0;
   border-bottom-color: transparent;
   border-right-color: transparent;
   border-top-color: #000;
   border-left-color: #000;
}
.btn-4:after{
   bottom: 0;
   right: 0;
   border-top-color: transparent;
   border-left-color: transparent;
   border-bottom-color: #000;
   border-right-color: #000;
}
.btn-4:hover:before,
.btn-4:hover:after {
  border-color: #000;
  height: 100%;
  width: 100%;
}



.btn-12{
  position: relative;
  right: 20px;
  bottom: 20px;
  border:none;
  box-shadow: none;
  width: 130px;
  height: 40px;
  line-height: 42px;
  -webkit-perspective: 230px;
  perspective: 230px;
}
.btn-12 span {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  display: block;
  position: absolute;
  width: 130px;
  height: 40px;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  border-radius: 5px;
  margin:0;
  text-align: center;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.btn-12 span:nth-child(1) {
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
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
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
}
.btn-12:hover span:nth-child(2) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
 color: transparent;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}

.hyeongyumodify{
position:relative;
width:100%;
font-size: 12px;
}

.hyeongyumodify input{
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
	
	height:45px;
 	padding-left:2px;
 	padding-bottom:10px;
	text-align: center;
}
.hyeongyumodify th {
	
	height:45px;
 	padding-left:2px;
 	padding-bottom:10px;
	text-align: center;
}
.hyeongyumodify tr {
	
	
 height:45px;
}

.hyeongyumodify tr td:nth-child(1) { 
	width: 10%;
}

.hyeongyumodify tr td:nth-child(2) {
	width: 10%;
}

.hyeongyumodify tr td:nth-child(3) {
	width: 40%;
}

.hyeongyumodify tr td:nth-child(4) {

	width: 20%;
}

.hyeongyumodify tr td:nth-child(5) {
	
}

.hyeongyumodify tr td:nth-child(6) {
	width: 10%;
}
.hyeongyumodify tr td:nth-child(7) {
	width: 10%;
}
.hyeongyumodify tr td:last-child {
	width: 10%;
}
</style>