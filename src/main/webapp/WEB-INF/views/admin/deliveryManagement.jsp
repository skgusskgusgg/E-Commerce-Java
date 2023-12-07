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
					data-filter="1" onclick="location.href='/admin/productManagement'">상품관리</button>

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
		<p>배송관리페이지..</p>
		<p>...</p>
		<hr class="bor21">

		<!-- 회원 리스트 -->
		<div class="row ">


			<table class="hyeongyumodify">
				<tr class="table_hea">
					<th>Delivery_ID</th>
					<th>Member_ID</th>
					<th>Total_Price</th>
					<th>RegDate</th>
					<th>Total_Status</th>
					<th>상세</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="delivery" items="${deliveryList}">
					<tr class="table_ro">
						<td><input type="text" value="${delivery.delivery_id}" id="id${delivery.delivery_id}"
							readonly></td>
						<td><input type="text" value="${delivery.member_id}" id="member${delivery.delivery_id}"></td>
						<td><input type="text" value="${delivery.total_price}" id="totalprice${delivery.delivery_id}"></td>
						<td><input type="text"
							value="${delivery.regdate}" id="regdate${delivery.delivery_id}"></td>
						<td><input type="text"
							value="${delivery.total_status}" id="totalstatus${delivery.delivery_id}"></td>
							<td><button class="custom-btn btn-12" value=""><span>Click!</span><span>상세</span></button></td>
							
						<td><button class="modify custom-btn btn-4" value="${delivery.delivery_id}"><span>수정</span></button></td>
						<td><button class="deleteMember custom-btn btn-5" value="${delivery.delivery_id}"><span>삭제</span></button></td>
					</tr>
				</c:forEach>
				<tr><td colspan="7" style="height: 20px;"></td></tr>
					<tr>
					<td colspan="4"></td>
					<td colspan="1" class="size-100"><input class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"  placeholder="키워드입력" id="keyword"></td>
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
<form id='actionForm' action="/admin/deliveryManagement" method='get'>
	<input type='hidden' name="pageNum"
		value='${pageManagement.cri.pageNum}'> <input type='hidden'
		name="amount" value='${pageManagement.cri.amount}'>
</form>

<form id='keywordSearchForm' action="/admin/deliveryManagement/deliveryKeywordSearch/" method='get'>
	<input type='hidden' name="pageNum"	value='${pageManagement.cri.pageNum}'>
	<input type='hidden' name="amount" value='${pageManagement.cri.amount}'>
	<input type='hidden' name="keyword">
</form>

<form id='modifyForm' action="/admin/deliveryManagement/modifyDelivery/" method='post'>
	<input type='hidden' name="pageNum" value='${pageManagement.cri.pageNum}'>
	<input type='hidden' name="amount" name="amount" value='${pageManagement.cri.amount}'>
	<input type='hidden' name="id"	value=''> 
	<input type='hidden'name="user_name" value=''>
	<input type='hidden'name="password" value=''>
	<input type='hidden'name="email" value=''>
	<input type='hidden'name="address" value=''>
	<input type='hidden'name="gender" value=''>
	<input type='hidden'name="birth_date" value=''>
	<input type='hidden'name="phone" value=''>
	<input type='hidden'name="point" value=''>
	<input type='hidden'name="join_date" value=''>
</form>

<form id='deleteForm' action="/admin/memberManagement/deleteMember/" method='post'>
	<input type='hidden' name="pageNum" value='${pageManagement.cri.pageNum}'>
	<input type='hidden' name="amount" name="amount" value='${pageManagement.cri.amount}'>
	<input type='hidden' name="id"	value=''> 
</form>

<script>


	$(document).ready(function() {
		var page = 10;
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.find("input[name='amount']").val(page);

			actionForm.submit();
		});
		
		var keywordSearchForm = $("#keywordSearchForm");
		$(".keywordSearch").on("click", function() {
			var keyword = $("#keyword").val();
			keywordSearchForm.find("input[name='keyword']").val(keyword);
			keywordSearchForm.submit();
		});

		
		var deleteForm = $("#deleteForm");
		$(".deleteMember").on("click",function(){
			
			var deleteId = $(this).val();
			deleteForm.find("input[name='id']").val(deleteId);
			deleteForm.submit();
		});
		
		var modifyForm = $("#modifyForm");
		$(".modify").on("click",function(){
	
	
			var selecetedId = $(this).val();
			var selectedPw =  $("#pw"+selecetedId).val();
			var selectedName =  $("#name"+selecetedId).val();
			var selectedEmail =  $("#email"+selecetedId).val();
			var selectedAddress =  $("#address"+selecetedId).val();
			if($("#gender"+selecetedId).val() === '1'){
			var selectedGender = 1;}
			if($("#gender"+selecetedId).val() === '2'){
			var selectedGender = 2;}
			var selectedBir =  $("#bir"+selecetedId).val();
			var selectedPhone =  $("#phone"+selecetedId).val();
			var selectedPoint =  $("#point"+selecetedId).val();
			var selectedJoin =  $("#join"+selecetedId).val();
			
			modifyForm.find("input[name='id']").val(selecetedId);
			modifyForm.find("input[name='user_name']").val(selectedName);
			modifyForm.find("input[name='password']").val(selectedPw);
			modifyForm.find("input[name='email']").val(selectedEmail);
			modifyForm.find("input[name='address']").val(selectedAddress);
			modifyForm.find("input[name='gender']").val(selectedGender);
			modifyForm.find("input[name='birth_date']").val(selectedBir);
			modifyForm.find("input[name='phone']").val(selectedPhone);
			modifyForm.find("input[name='point']").val(selectedPoint);
			modifyForm.find("input[name='join_date']").val(selectedJoin);
	
			modifyForm.submit();
		
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/addWish.js"></script>

<style>
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
	width: 20%;
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
	width: 5%;
}
.hyeongyumodify tr td:last-child {
	width: 5%;
}
</style>