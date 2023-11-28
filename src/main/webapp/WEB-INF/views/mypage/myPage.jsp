<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">My Page</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row" style="width: 100%">
			<div style="width: 100%">
				<div class="p-r-0-lg">
					<!-- My Page -->
					<div class="mypage-wrap">
						<ul>
							<li class="p-b-80">
								<h2>MY PAGE</h2>
							</li>
							<li class="mypage-menu-title">
								<h3>나의 주문 처리 현황</h3>
							</li>
						</ul>
						<div class="mypage-order">

							<ul>
								<li><a href="#"> <strong>입금전</strong> <span> <span>0</span>
									</span>
								</a></li>
								<li><a
									href="/myshop/order/list.html?order_status=shipped_standby">
										<strong>배송준비중</strong> <span> <span>0</span>
									</span>
								</a></li>
								<li><a
									href="/myshop/order/list.html?order_status=shipped_begin">
										<strong>배송중</strong> <span> <span>0</span>
									</span>
								</a></li>
								<li><a
									href="/myshop/order/list.html?order_status=shipped_complate">
										<strong>배송완료</strong> <span> <span>0</span>
									</span>
								</a></li>
								<li>
									<p>
										<a href="/myshop/order/list.html?order_status=order_cancel">
											<strong>취소</strong> <span> <span>0</span>
										</span>
										</a>
									</p>
									<p>
										<a href="/myshop/order/list.html?order_status=order_exchange">
											<strong>교환</strong> <span> <span>0</span>
										</span>
										</a>
									</p>
									<p>
										<a href="/myshop/order/list.html?order_status=order_return">
											<strong>반품</strong> <span> <span>0</span>
										</span>
										</a>
									</p>
								</li>
							</ul>
						</div>

						<div class="mypage-benefit">
							<ul class="mypage-benefit-left">
								<h3>
									<a href="/myshop/coupon/coupon.html">사용 가능 쿠폰</a>
								</h3>
								<li><a href="/myshop/coupon/coupon.html">0</a></li>
							</ul>
							<ul class="mypage-benefit-right">
								<h3>
									<a href="/myshop/mileage/historyList.html">적립금</a>
								</h3>


								<li><a href="/myshop/mileage/historyList.html">0</a></li>
							</ul>
						</div>
						<div class="mypage-sub-menu">
							<ul>
								<li class="hov-btn3 trans-04 "><a
									href="#" class="js-show-modal-Orderhistory"> <span>Order Tracking</span>주문내역
										조회
								</a></li>
								<li class="hov-btn3 trans-04"><a href="#"
									class="js-show-modal-modify"> <span>Profile</span>회원 정보
								</a></li>
								<li class="hov-btn3 trans-04"><a
									href="#" class="js-show-modal-addressManagement"> <span>Address</span>배송 주소록
										관리
								</a></li>
								<li class="hov-btn3 trans-04"><a
									href="#" class="js-show-cart"> <span>Wishlist</span>관심상품
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- Modal Orderhistory -->
<div class="wrap-modal-login js-modal-Orderhistory p-t-60 p-b-20">
	<div class="overlay-modal-login js-hide-modal-Orderhistory"></div>

	<div id="modalContainer">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal-Orderhistory">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>

			<div class="authincation h-100">
				<div class="container-fluid h-100">
					<div class="row justify-content-center h-100 align-items-center">
						<div class="col-md-6">
							<div class="authincation-content">
								<div class="row no-gutters">
									<div class="col-xl-12">
										<div class="auth-form">
											<h4 class="text-center mb-4">주문내역</h4>
											<table>
											<tr>
											<td>
											</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	
	
	
	

	<!-- Modal Profile -->
	<div class="wrap-modal-login js-modal-modify p-t-60 p-b-20">
		<div class="overlay-modal-login js-hide-modal-modify"></div>

		<div id="modalContainer">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-modify">
					<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="authincation h-100">
					<div class="container-fluid h-100">
						<div class="row justify-content-center h-100 align-items-center">
							<div class="col-md-6">
								<div class="authincation-content">
									<div class="row no-gutters">
										<div class="col-xl-12">
											<div class="auth-form">
												<h4 class="text-center mb-4">My Profile</h4>
												
													<form action="register" id="register" method="post"
														name="frm" accept-charset="UTF-8">

														<input type="hidden" id="id" name="id"> <input
															type="hidden" id="email" name="email"> <input
															type="hidden" id="join_date" name="join_date"
															value="now()">
														<table class="tab02 how-pos3-parent">
															<tr>
																<td><label for="email1" class="size-220">이메일:
																</label></td>
																<td><span class="email_input_re_1">v</span> <span
																	class="email_input_re_2">x</span></td>
																<td class="bor19" style="width:900px; " ><input
																	class="how-pos3-parent stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="email1" name="email1" value="${mVO.email }" readonly></td>
															<tr>
																<td colspan="1"></td>
																<td colspan="2" style="font-size: 10px;">비밀번호 8자 이상
																	숫자,영어,특수문자 조합 해주세요</td>
															</tr>
															<tr>
																<td><label for="password" class="size-220">현재비밀번호:
																</label></td>
																<td><span class="password_input_re_1">v</span> <span
																	class="password_input_re_2">x</span></td>
																<td colspan="2" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="password" name="password" placeholder="password *"></td>
															</tr>

															<tr>
																<td><label for="password" class="size-220">새비밀번호:
																</label></td>
																<td><span class="password_input_re_1">v</span> <span
																	class="password_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="password" name="password" placeholder="password *"></td>
															</tr>
															<tr>
																<td><label for="password2" class="size-220">비밀번호
																		확인: </label></td>
																<td><span class="password2_input_re_1">v</span> <span
																	class="password2_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="password2" name="password2"
																	placeholder="password check *"></td>
															</tr>
															<tr>
																<td><label for="user_name" class="size-220">이름:
																</label></td>
																<td><span class="name_input_re_1">v</span> <span
																	class="name_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="user_name" name="user_name" value="${mVO.user_name }"></td>
															</tr>
															<tr>
																<td><label for="gender" class="size-220">성별:
																</label></td>
																<td><span class="gender_input_re_1">v</span></td>
																<td colspan="1" class="size-100"><select
																	name="gender" id="gender"
																	class="stext-111 cl2 plh3  p-lr-18" >
																		<option value=1>남자</option>
																		<option value=2>여자</option>
																</select></td>
															</tr>

															<tr>
																<td><label for="address" class="size-220">주소:
																</label></td>
																<td><span class="address_input_re_1">v</span> <span
																	class="address_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="address" name="address" placeholder="address *"
																	readonly></td>
																
															</tr>
															<tr>
															<td colspan="2"></td>
															<td><input type="button" id="zipcode_btn"
																	value="Address Search"
																	class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04"></td>
															</tr>
														
															<tr>
																<td><label for="phone" class="size-220">휴대폰
																		번호: </label></td>
																<td><span class="phone_input_re_1">v</span> <span
																	class="phone_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																	id="phone" name="phone"
																	placeholder="phone number (do not insert ' - ') *"></td>
															</tr>
															<tr>
																<td><label for="birth_date" class="size-220">생년월일:
																</label></td>
																<td><span class="birth_date_input_re_1">v</span> <span
																	class="birth_date_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																	class="stext-111 cl2 plh3 size-126 p-lr-18" type="date"
																	id="birth_date" name="birth_date"></td>
															</tr>
															
														</table>
														<div style="display: flex; justify-content: center">
															<button type="submit" id="submit_btn"
																class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
																style="position: relative; right: 0; display: block;">
																submit</button>
														</div>

													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<!-- Modal addressManagement -->
<div class="wrap-modal-login js-modal-addressManagement p-t-60 p-b-20">
	<div class="overlay-modal-login js-hide-modal-addressManagement"></div>

	<div id="modalContainer">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal-addressManagement">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>

			<div class="authincation h-100">
				<div class="container-fluid h-100">
					<div class="row justify-content-center h-100 align-items-center">
						<div class="col-md-6">
							<div class="authincation-content">
								<div class="row no-gutters">
									<div class="col-xl-12">
										<div class="auth-form">
											<h4 class="text-center mb-4">배송 주소관리</h4>
											<form action="login">
												<div class="form-group">
													<label><strong>Email</strong></label> <input type="email"
														class="form-control" value="hello@example.com">
												</div>
												<div class="form-group">
													<label><strong>Password</strong></label> <input
														type="password" class="form-control" value="Password">
												</div>
												<div
													class="form-row d-flex justify-content-between mt-4 mb-2">
													<div class="form-group">
														<div class="form-check ml-2">
															<input class="form-check-input" type="checkbox"
																id="basic_checkbox_1"> <label
																class="form-check-label" for="basic_checkbox_1">Remember
																me</label>
														</div>
													</div>
													<div class="form-group">
														<a href="page-forgot-password.html">Forgot Password?</a>
													</div>
												</div>
												<div class="text-center">
													<button type="submit" class="btn btn-primary btn-block">Sign
														me in</button>
												</div>
											</form>
											<div class="new-account mt-3">
												<p>
													Don't have an account? <a class="text-primary"
														href="/join/join">Sign up</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




</section>

<%@include file="../includes/footer.jsp"%>

<script>



$('.js-show-modal-Orderhistory').on('click', function(e) {
	e.preventDefault();
	$('.js-modal-Orderhistory').addClass('show-modal-Orderhistory');
});

$('.js-hide-modal-Orderhistory').on('click', function() {
	$('.js-modal-Orderhistory').removeClass('show-modal-Orderhistory');
});


$('.js-show-modal-modify').on('click', function(e) {
	e.preventDefault();
	$('.js-modal-modify').addClass('show-modal-modify');
});

$('.js-hide-modal-modify').on('click', function() {
	$('.js-modal-modify').removeClass('show-modal-modify');
});


$('.js-show-modal-addressManagement').on('click', function(e) {
	e.preventDefault();
	$('.js-modal-addressManagement').addClass('show-modal-addressManagement');
});

$('.js-hide-modal-addressManagement').on('click', function() {
	$('.js-modal-addressManagement').removeClass('show-modal-addressManagement');
});



</script>
<style>
.tab02 {
	position: relative;
	border-collapse: separate;
	border-spacing: 10px 10px;
	display: flex;
	overflow-x: auto;
	width: 100%;
}


.show-modal-Orderhistory {
	visibility: visible;
	opacity: 1;
}

.show-modal-modify {
	visibility: visible;
	opacity: 1;
}

.show-modal-addressManagement {
	visibility: visible;
	opacity: 1;
}

.email_input_re_1 {
	color: green;
	display: none;
}

.email_input_re_2 {
	color: red;
	display: inline-block;
}

.password_input_re_1 {
	color: green;
	display: none;
}

.password_input_re_2 {
	color: red;
	display: inline-block;
}

.password2_input_re_1 {
	color: green;
	display: none;
}

.password2_input_re_2 {
	color: red;
	display: inline-block;
}

.name_input_re_1 {
	color: green;
	display: none;
}

.name_input_re_2 {
	color: red;
	display: inline-block;
}

.gender_input_re_1 {
	color: green;
}

.address_input_re_1 {
	color: green;
	display: none;
}

.address_input_re_2 {
	color: red;
	display: inline-block;
}

.phone_input_re_1 {
	color: green;
	display: none;
}

.phone_input_re_2 {
	color: red;
	display: inline-block;
}

.birth_date_input_re_1 {
	color: green;
	display: none;
}

.birth_date_input_re_2 {
	color: red;
	display: inline-block;
}
</style>
