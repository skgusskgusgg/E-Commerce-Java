<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp"%>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row" style="width: 100%">
			<div style="width: 100%">
				<div class="p-r-0-lg">
					<!-- My Page -->
					<div class="payment-wrap">
						<h5 class="mtext-113 cl2 p-b-12">Payment</h5>

                  		<p class="stext-107 cl6 p-b-40">Please review the order details and input the information for the orderer, including the order contents.
                  		</p>
						<table class="payment-table">
							<tr class="payment-subtitle">
								<td>
									<span style="margin-left:5px;">배송지 입력</span>
								</td>
							</tr>
							<tr>
								<td style="display:flex; width:100%">
									<input type="text" id="payment-roadAddr" style="width:51%" placeholder="주소를 입력해주세요." value="${memberInfo.member_address}"readonly>
									<input type="text" id="payment-postCode" style="width:12%" placeholder="우편번호" readonly>
									<input type="button" id="zipcode_btn" value="Address Search"class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04 m-l-5">
								</td>
							</tr>
							<tr>
								<td style="display:flex; width:80%;">
									<input type="text" id="payment-extraAddress" placeholder="상세주소를 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td>
									<label style="display: flex; align-items: center;">
									<input type="checkbox" id="address-checkbox" checked="checked" style="margin-left:5px">
										<span style="vertical-align:top; margin-left:5px">회원 정보와 동일</span>
									</label>
								</td>
							</tr>
							<tr class="payment-subtitle">
								<td>
									<span style="margin-left:5px;">주문자 정보</span>
									<input type="hidden" id="memberId" value="${memberInfo.member_id}">
								</td>
							</tr>
							<tr>
								<td>
									<div style="display:flex;">
										<div style="display:flex; flex-direction: column; width:10%;">
											<span style="margin-left:5px;">이름:</span>
											<span style="margin-left:5px;">전화번호:</span>
										</div>
										<div style="display:flex; flex-direction: column;">
											<span style="margin-left:5px;">${memberInfo.member_user_name}</span>
											<span style="margin-left:5px;">${memberInfo.member_phone}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr class="payment-subtitle">
								<td>
									<span style="margin-left:5px;">주문 상품</span>
								</td>
							</tr>
							<tr>
								<td>
									<table class="payment-product-table">
										<tr class="payment-product-table-head">
											<th class="payment-table-column-1"></th>
					                        <th class="payment-table-column-2">Product</th>
					                        <th class="payment-table-column-3">Price</th>
					                        <th class="payment-table-column-4">Quantity</th>
					                        <th class="payment-table-column-5">Total</th>
					                        <th class="payment-table-column-6">Product Option</th>
				                    	</tr>
										<c:forEach var="item" items="${cartList}">
											<tr class="payment-product-table-row">
					                            <td class="payment-product-table-column-1">
					                                <div class="how-itemcart1">
					                                    <img src="/resources/images/products/${item.img}" alt="IMG">
					                                </div>
					                            </td>
					                            <td class="payment-product-table-column-2">${item.product_name}<input type="hidden" class="shopping-cart-cart_id" value="${item.cart_id}"></td>
					                            <td class="payment-product-table-column-3"><fmt:formatNumber value="${item.price}" pattern="###,###" /></td>
					                            <td class="payment-product-table-column-4">${item.count}</td>
					                            <td class="payment-product-table-column-5"><fmt:formatNumber value="${item.count*item.price}" pattern="###,###" /></td>
					                        	<td class="payment-product-table-column-6">
					                        		<div style="display:flex; flex-direction: column;">
					                        			<span style="vertical-align:top; margin-left:5px">color : ${item.color_id}</span>
					                        			<span style="vertical-align:top; margin-left:5px">size : ${item.size_id}</span>
					                        		</div>
					                        	</td>
					                        </tr>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr class="payment-subtitle">
								<td>
									<c:set var="totalPrice" value="0" />
								    <c:forEach var="item" items="${cartList}">
								        <c:set var="totalPrice" value="${totalPrice + (item.price * item.count)}" />
								    </c:forEach>
									<span style="margin-left:5px;">주문 금액 : <fmt:formatNumber value="${totalPrice}" pattern="###,###" /></span>
								</td>
							</tr>
							<tr class="payment-subtitle">
								<td>
									<span style="margin-left:5px;">포인트</span>
								</td>
							</tr>
							<tr>
								<td>
									<label style="display: flex; align-items: center;">
										<span style="vertical-align:top; margin-left:5px">사용 포인트 : </span>
										<input type="text" id="payment-usePoint" placeholder="0" style="text-align:right; width:17%;" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
									</label>
									<label style="display: flex; align-items: center;">
										<span style="vertical-align:top; margin-left:5px">보유 포인트 : </span>
										<input type="text" style="text-align:right; width:17%;" value='<fmt:formatNumber value="${memberInfo.member_point}" pattern="###,###" />' readonly>
									</label>
									<div style="display: flex; align-items: center;">
										<span id="pending-point" style="vertical-align:top; margin-left:5px">적립 예정 포인트 : 
											<fmt:formatNumber value = "${Math.floor(totalPrice * 0.01)}" pattern="#" /></span>
									</div>
								</td>
							</tr>
							<tr class="payment-subtitle payment-Method-tr">
								<td>
									<span style="margin-left:5px;">결제 수단</span>
								</td>
							</tr>
							<tr class="payment-Method-tr">
								<td class="paymentMethod">
									<div>
										<label style="display: flex; align-items: center;">
											<input type="radio" id="payment-method-creditCard" name="payment-method-radio" value="creditCard" checked="checked">
											<span style="vertical-align:top; margin-left:5px">신용카드</span>
										</label>
									</div>
									<div>
										<label style="display: flex; align-items: center;">
											<input type="radio" id="payment-method-bankTransfer" name="payment-method-radio" value="bankTransfer">
											<span style="vertical-align:top; margin-left:5px">무통장입금</span>
										</label>
									</div>
									<div>
										<label style="display: flex; align-items: center;">
											<input type="radio" id="payment-method-naverPay" name="payment-method-radio" value="naverPay">
											<span style="vertical-align:top; margin-left:5px">네이버페이</span>
										</label>
									</div>
									<div>
										<label style="display: flex; align-items: center;">
											<input type="radio" id="payment-method-kakaoPay" name="payment-method-radio" value="kakaoPay">
											<span style="vertical-align:top; margin-left:5px">카카오페이</span>
										</label>
									</div>
								</td>
							</tr>
							<tr class="payment-subtitle">
								<td>
									<span style="margin-left:5px;">결제 상세</span>
								</td>
							</tr>
							<tr>
								<td>
									<div style="display:flex; flex-direction: column;">
										<c:forEach var="item" items="${cartList}">
											<div style="display:flex; margin:5px; border-bottom:1px solid #dedede">
												<div style="width:60%; display:flex; flex-direction: column; align-items: flex-end;">
													<span style="margin-left:5px;">상품 이름</span>
													<span style="margin-left:5px;">상품 금액</span>
													<span style="margin-left:5px;">상품 수량</span>
													<span style="margin-left:5px;">쿠폰 할인</span>
													<span style="margin-left:5px;">최종 상품 금액</span>
												</div>
												<div style="width:40%; display:flex; flex-direction: column; align-items: flex-end;">
													<span style="margin-left:5px;">${item.product_name}</span>
													<span style="margin-left:5px;"><fmt:formatNumber value="${item.price}" pattern="###,###" /></span>
													<span style="margin-left:5px;"><fmt:formatNumber value="${item.count}" pattern="###,###" /></span>
													<span style="margin-left:5px;">0</span>
													<span style="margin-left:5px;"><fmt:formatNumber value="${item.price*item.count}" pattern="###,###" /></span>
												</div>
											</div>
										</c:forEach>
										<div style="display:flex; margin:5px; border-top:1px solid #1f1f1f; border-bottom:1px solid #1f1f1f;">
											<div style="width:60%; display:flex; flex-direction: column; align-items: flex-end;">
												<span style="margin-left:5px;">총 금액</span>
												<span style="margin-left:5px;">배송비</span>
												<span style="margin-left:5px;">쿠폰 할인</span>
												<span style="margin-left:5px;">사용 포인트</span>
												<span style="margin-left:5px;">최종 금액</span>
											</div>
											<div style="width:40%; display:flex; flex-direction: column; align-items: flex-end;">
												<span style="margin-left:5px;"><fmt:formatNumber value="${totalPrice}" pattern="###,###" /></span>
												<span style="margin-left:5px;">0</span>
												<span style="margin-left:5px;">0</span>
												<span id="total-use-point" style="margin-left:5px;">0</span>
												<span id="total-payment-amount" style="margin-left:5px;"><fmt:formatNumber value="${totalPrice}" pattern="###,###" /></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
						<div>
                     		<label style="display: flex; align-items: center; justify-content: flex-end;">
								<input type="checkbox" id="payment-agree-checkbox" style="margin-left:5px">
								<span style="vertical-align:top; margin-left:5px">위 결제 내용을 확인하였으며 이에 동의합니다.</span>
							</label>
                     	</div>
						<div style="display: flex; justify-content: flex-end">
	                        <button id="payment-submit-btn"
	                           class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
	                           style="position: relative; right: 0; display: block;">
	                           confirm payment
	                        </button>
                     	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<%@include file="../includes/footer.jsp"%>
<!--===============================================================================================-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$("#zipcode_btn").on("click",function() {
		searchAddress();
  	});
	function searchAddress(){
		new daum.Postcode({
	        oncomplete: function(data) {

	            var zonecode = data.zonecode;
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수

	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('payment-postCode').value = zonecode;
	            document.getElementById('payment-roadAddr').value = roadAddr+extraRoadAddr;

	        }
	    }).open();
		if ($('#address-checkbox').prop('checked')) {
			$('#address-checkbox').prop('checked',false);
		}
	}
});

</script>
<!--===============================================================================================-->
<script>
$(document).ready(function() {
	initialAddress();
});
    $('#address-checkbox').change(function() {
    	var subAddress = classificationAddress();
        if ($(this).prop('checked')) {
        	$('#payment-postCode').val(subAddress[0]);
        	$('#payment-roadAddr').val(subAddress[1]);
        	$('#payment-extraAddress').val(subAddress[2]);
        }else{
        	$('#payment-postCode').val(null);
        	$('#payment-roadAddr').val(null);
        	$('#payment-extraAddress').val(null);
        }
    });
    $('#payment-usePoint').on("input", function (event) {
    	event.preventDefault();
    	if ($('#payment-usePoint').val().trim() !== ''){
	        var usePoint = parseInt($('#payment-usePoint').val());
	        var currentPoint = parseInt('${memberInfo.member_point}');
	        var totalPrice = parseInt('${totalPrice}');
	        var amountDiff = 0;
	        if ((!$('#payment-method-creditCard').prop('checked'))
	        		&&(!$('#payment-method-bankTransfer').prop('checked'))
       				&&(!$('#payment-method-naverPay').prop('checked'))
					&&(!$('#payment-method-kakaoPay').prop('checked'))) {
    			$('#payment-method-creditCard').prop('checked',true);
    			$('.payment-Method-tr').css('display','');
       		}
	        if (usePoint >= currentPoint) {
	        	amountDiff = totalPrice - currentPoint;
	        	$('#payment-usePoint').val(currentPoint);
	        	$('#pending-point').text("적립 예정 포인트 : " + numRoundNComma(amountDiff*0.01));
	            $('#total-use-point').text(numRoundNComma(currentPoint));
	            $('#total-payment-amount').text(numRoundNComma(amountDiff));
	            usePoint = currentPoint;
	        }
	        if(usePoint >= totalPrice){
	        	var amountDiff = 0;
	        	$('#payment-usePoint').val(totalPrice);
	        	$('#total-use-point').text(numRoundNComma(totalPrice));
	        	$('#pending-point').text("적립 예정 포인트 : 0");
	        	$('#total-payment-amount').text("0");
	        	$('.payment-Method-tr').css('display','none');
	        	if ($('#payment-method-creditCard').prop('checked')) {
	    			$('#payment-method-creditCard').prop('checked',false);
	        	}
	        	if ($('#payment-method-bankTransfer').prop('checked')) {
	    			$('#payment-method-bankTransfer').prop('checked',false);
	    		}
	        	if ($('#payment-method-naverPay').prop('checked')) {
	    			$('#payment-method-naverPay').prop('checked',false);
	    		}
	        	if ($('#payment-method-kakaoPay').prop('checked')) {
	    			$('#payment-method-kakaoPay').prop('checked',false);
	    		}
	        	return;
	        }
	        amountDiff = totalPrice - usePoint;
	        $('#total-use-point').text(numRoundNComma(usePoint));
	        $('#pending-point').text("적립 예정 포인트 : " + numRoundNComma(amountDiff*0.01));
	        $('#total-payment-amount').text(numRoundNComma(amountDiff));
    	}else{
        	$('#total-use-point').text("0");
        	$('#pending-point').text("적립 예정 포인트 : " + numRoundNComma(${totalPrice}*0.01));
        	$('#total-payment-amount').text(""+${totalPrice});
    	}
        return;
    });
    function numRoundNComma(number) {
    	number = Math.floor(number);
    	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

	function initialAddress(){
		var subAddress = classificationAddress();
		$('#payment-postCode').val(subAddress[0]);
		$('#payment-roadAddr').val(subAddress[1]);
		$('#payment-extraAddress').val(subAddress[2]);
	}
	
	function classificationAddress(){
		var fullAddr = "${memberInfo.member_address}";
		var findCommaIndex = fullAddr.indexOf(',');
		var subCommaStr = "";
		var subAddress = [];
		for(i=0;i<3;i++){
	    	if(findCommaIndex !== -1){
	    		subCommaStr = fullAddr.substring(0,findCommaIndex).trim();
	    		fullAddr = fullAddr.substring(findCommaIndex+1);
		    	findCommaIndex = fullAddr.indexOf(',');
		    	subAddress[i] = subCommaStr;
	    	}else{
	    		subAddress[i] = fullAddr;
	    		return subAddress;
	    	}
		}
		return subAddress;
	}
</script>
<!--===============================================================================================-->
<script>
	$('#payment-submit-btn').on("click",function(){
		if($('#payment-roadAddr').val().trim() == "") {
			$('#payment-roadAddr').focus();
	        alert("주소를 입력해 주세요.");
	        return;
	    }
		if($('#payment-postCode').val().trim() == "") {
			$('#payment-postCode').focus();
	        alert("우편 번호를 입력해 주세요.");
	        return;
	    }
		if($('#payment-extraAddress').val().trim() == "") {
			$('#payment-extraAddress').focus();
	        alert("상세 주소를 입력해 주세요.");
	        return;
	    }
		if(!$('#payment-agree-checkbox').prop('checked')){
			$('#payment-agree-checkbox').focus();
	        alert("결제 내용 확인 후 체크해 주세요.");
	        return;
		}
		if ($('#payment-method-creditCard').prop('checked')) {
			alert("현재 신용카드 결제 기능은 준비 중입니다.");
			return;
    	}
    	if ($('#payment-method-bankTransfer').prop('checked')) {
			alert("현재 무통장 입금 결제 기능은 준비 중입니다.");
			return;
		}
    	if ($('#payment-method-naverPay').prop('checked')) {
			alert("현재 네이버페이 결제 기능은 준비 중입니다.");
			return;
		}
    	if ($('#payment-method-kakaoPay').prop('checked')) {
			alert("현재 카카오페이 결제 기능은 준비 중입니다.");
			return;
		}
    	
		var usePoint = parseInt($('#total-use-point').text().replace(/,/g, ''));
		
		var paymentInfo = {
				"memberId" : $('#memberId').val(),
				"roadAddr" : $('#payment-roadAddr').val(),
				"postCode" : $('#payment-postCode').val(),
				"extraAddress" : $('#payment-extraAddress').val(),
				"usePoint" : usePoint,
				"totalpaymentAmount" : ${totalPrice},
				"paymentMethod" : "point"
		}
		
		$.ajax({
            url: '/payment/paymentSubmit',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(paymentInfo),
            success: function(data, status, xhr) {
			    var redirectUrl = xhr.getResponseHeader("Location");
			    if (xhr.status === 404) {
			        window.location.href = redirectUrl;
			    }else{
			    	window.location.href = redirectUrl;
			    }
			},
			error: function(jqXHR, textStatus, errorThrown) {
			    console.error("에러 발생:", errorThrown);
			}
   		});
	});
</script>