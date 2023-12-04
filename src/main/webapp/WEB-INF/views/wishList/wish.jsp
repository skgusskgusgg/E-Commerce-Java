<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.wishUl::-webkit-scrollbar {
	display: none; /* 크롬, 사파리, 오페라, 엣지 */

}
.wishUl{
	overflow-y: scroll;
	height: 80%;
}

</style>
<!-- Cart -->

<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>

	<div class="header-cart flex-col-l p-l-65 p-r-25">
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2"> Wish List </span>

			<div
				class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>

		<div class="header-cart-content flex-w ">
			<ul class="header-cart-wrapitem w-full wish wishUl">
				<li class="header-cart-item flex-w flex-t m-b-12">


					<div class="header-cart-item-img box">
						
						<img style="width: 50px;" src="/resources/images/item-cart-01.jpg"
							alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							White Shirt Pleat </a> <span class="header-cart-item-info"> 1
							x $19.00 </span>

					</div>
				</li>

			</ul>


			<div class="w-full">
				<div class="header-cart-total w-full"></div>

				<div class="header-cart-buttons flex-w w-full">
					<a href=""
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10 add-btn">
						Add Cart </a> <a href=""
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10 delete-btn">
						Delete </a>
				</div>
				
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/wishList.js">
</script>