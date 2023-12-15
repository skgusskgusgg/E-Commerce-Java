<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<style>
#replyM th {
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
					
							<table class="table-content-board">
								<tbody id="replyM">
									<tr class="table_head">

										<th>No.</th>
										<th>Image</th>
										<th>Product Name</th>
										<th>Content</th>
										<th>Writer</th>
										<th>Date</th>

									</tr>
									<c:forEach var="reply" items="${list}" varStatus="i">
										<tr class="table_row">
											<td>${reply.reply_id}</td>
											<td class="has-img"><img alt="" width="60px"
												src="/resources/images/products/${reply.img}"></td>
											<td>${reply.product_name}</td>
											<th><a
												href="/product/productDetail?id=${reply.object_id}"
												class="cl13 hov-cl1 trans-04">${reply.content}</a></th>
											<td>${reply.writer_name}</td>
											<td>${reply.regdate}</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>

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
												class='flex-c-m how-pagination1 trans-04 m-all-7 ${pageMaker.cri.pageNum == num ? "active-pagination1":"" } '
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
	<form id='actionForm' action="/mypage/replyManagement?id=" method='get'>
			<input type='hidden' name="pageNum" value='${pageMaker.cri.pageNum}'>
	</form>
<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm")
		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));

			actionForm.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>