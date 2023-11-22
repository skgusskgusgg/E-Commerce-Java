<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">Help&FaQs</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="flex-w flex-l-m filter-tope-group m-tb-10">
			<!-- <button
				class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
				data-filter="*">Help&FaQs</button> -->
			

		</div>
		<div class="row" style="width: 100%">
			<div style="width: 100%">
				<div class="p-r-0-lg">
					<!-- item Q&A -->
					<div class="p-t-55">
						<h3 class="mtext-112 cl2 p-b-10">Help&FaQs</h3>
						<hr class="bor21">

						<table class="table-content-board">
							<tr class="table_head">
								<th class="column-1">No.</th>
								<th class="column-2">Product</th>
								<th class="column-3">Title</th>
								<th class="column-4">Writer</th>
								<th class="column-5">Date</th>
								<th class="column-6">views</th>
							</tr>
							<tr class="table_row">
								<td class="column-1">13135</td>
								<td class="column-2 has-img"><img
									src="/resources/images/item-cart-04.jpg" alt="IMG"></td>
								<td class="column-3"><a href="/faq/faqDetail"
									class="cl13 hov-cl1 trans-04">Free shipping for standard
										order over $100</a></td>
								<td class="column-4">admin</td>
								<td class="column-5">2023.11.15</td>
								<td class="column-6">13156</td>
							</tr>

						</table>
					</div>
					<!-- Pagination -->
					<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
						<a href="#"
							class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
							1 </a> <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
							2 </a> <a href="#" class="flex-r-m how-pagination1 trans-04 m-all-7">
							글쓰기 </a>
					</div>

				</div>
			</div>
		</div>
	</div>

</section>
<%@include file="../includes/footer.jsp"%>