<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<style>
#replyM th{
	text-align: center;
}

</style>
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
						<h3 class="mtext-112 cl2 p-b-10">
							<button class="p-r-25">Reply Management</button>
						</h3>
						<hr class="bor21">
						<form method="post" action="faqdeleteSelected2">
							<table class="table-content-board">
								<tbody id="replyM">
									<tr class="table_head">

										<th >No.</th>
										<th >Image</th>
										<th >Product Name</th>
										<th >Content</th>
										<th >Writer</th>
										<th >Date</th>

									</tr>
									<c:forEach var="reply" items="${list}" varStatus="i">
										<tr class="table_row">
											<td >${reply.reply_id}</td>
											<td class="has-img"><img alt="" width="60px"
												src="/resources/images/products/${product_list[i.index].img}"></td>
											<td >${product_list[i.index].product_name}</td>
											<th ><a
												href="/product/productDetail?id=${reply.object_id}"
												class="cl13 hov-cl1 trans-04">${reply.content}</a></th>
											<td >${reply.writer_name}</td>
											<td >${reply.regdate}</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../includes/footer.jsp"%>