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
										<li>
											<a href="#">
												<strong>입금전</strong>
												<span>
													<span >0</span>
												</span>
											</a>
										</li>    
										<li>
											<a href="/myshop/order/list.html?order_status=shipped_standby">
											<strong>배송준비중</strong>
											<span>
												<span>0</span>
												</span>
											</a>
										</li>
										<li>
											<a href="/myshop/order/list.html?order_status=shipped_begin">
												<strong>배송중</strong>
												<span>
													<span>0</span>
												</span>
											</a>
										</li>
										<li>
											<a href="/myshop/order/list.html?order_status=shipped_complate">
												<strong>배송완료</strong>
												<span>
													<span>0</span>
												</span>
											</a>
										</li>    
										<li>
										<p>
											<a href="/myshop/order/list.html?order_status=order_cancel">
												<strong>취소</strong>
												<span>
													<span>0</span>
												</span>
											</a>
										</p>
										<p>
											<a href="/myshop/order/list.html?order_status=order_exchange">
												<strong>교환</strong>
												<span>
													<span>0</span>
												</span>
											</a>
										</p>
										<p>
											<a href="/myshop/order/list.html?order_status=order_return">
												<strong>반품</strong>
												<span>
													<span>0</span>
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
										<li>
											<a href="/myshop/coupon/coupon.html">0</a>
										</li>    
									</ul>
									<ul class="mypage-benefit-right">
										<h3>
											<a href="/myshop/mileage/historyList.html">적립금</a>
										</h3>  
										<li>
											<a href="/myshop/mileage/historyList.html">0</a>
										</li>    
									</ul>
								</div>    
									<div class="mypage-sub-menu">
										<ul>
											<li class="hov-btn3 trans-04 ">
												<a href="/myshop/order/list.html">
													<span>Order Tracking</span>주문내역 조회
												</a>
											</li> 
											<li class="hov-btn3 trans-04">
												<a href="/member/modify.html">
													<span>Profile</span>회원 정보
												</a>
											</li>     
											<li class="hov-btn3 trans-04">
												<a href="/myshop/addr/list.html">
													<span>Address</span>배송 주소록 관리
												</a>
											</li>
											<li class="hov-btn3 trans-04">
												<a href="/myshop/wish_list.html"> 
													<span>Wishlist</span>관심상품
												</a>
											</li>
										</ul>
									</div>
								</div>    
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<%@include file="../includes/footer.jsp"%>