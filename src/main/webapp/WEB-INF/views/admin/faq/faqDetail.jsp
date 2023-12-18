<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자 용 faqDetail -->

<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="/faq/faqListPage?page=1"
			class="stext-109 cl8 hov-cl1 trans-04"> Help <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
	</div>
</div>


<!-- Content page -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80"
				style="margin: auto; text-align: left">
				<div class="p-r-45 p-r-0-lg">
					<div class="p-t-32">
						<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
								<span class="cl4">No.&nbsp</span> ${faqDetail.faqId} <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Writer&nbsp</span>
								${faqDetail.user_name} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Date&nbsp</span>
								${faqDetail.updateDate} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Views&nbsp</span>
								${faqDetail.viewCount} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span class="m-l-auto"> <span class="cl4"> <a
									class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
									href="/admin/faq/faqListPage?page=1"> 목록 </a>
							</span>
						</span> <c:if test="${mVO.id != null}">
								<span class="m-l-8"> <span class="cl4"> <a
										class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
										href="/admin/faq/faqEdit?faqId=${faqDetail.faqId}"
										onclick="return loginCheck_help()"> 수정 </a>
								</span>
								</span>
								<span class="m-l-8"> <span class="cl4"> <a
										class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
										href="/admin/faq/faqDelete?faqId=${faqDetail.faqId}"
										onclick="return toDelete()"> 삭제 </a>
								</span>
								</span>
							</c:if>
						</span>

						<h4 class="ltext-109 cl2 p-b-28">${faqDetail.faqTitle}</h4>

						<p class="stext-117 cl6 p-b-26">${faqDetail.faqContents}</p>
					</div>
					<table class="table-qna-img">
						<tr class="table_head">
							<th class="column-1">image</th>
						</tr>

						<tr class="table_row">
							<td class="column-2 has-img hov-img1"><c:forEach
									var="faqfaqfaq" items="${faqDetail.imgFiles}">
									<img src="/faq/${faqfaqfaq}">
								</c:forEach></td>
						</tr>
					</table>

					<!-- 							<td class="column-2 has-img hov-img1"><a
								href="./product-detail.html" class="js-show-modal1"> <img
									src="/resources/images/item-cart-05.jpg" alt="IMG">
							</a></td> -->


					<div class="p-t-40">
						<h5 class="mtext-113 cl2">Comment</h5>
						<br>
						<c:forEach items="${reply}" var="reply">
							<div class="flex-w flex-m stext-111 cl2 p-b-19">
								<span style="border: solid 1px; margin: 5px; padding: 2px;">${reply.user_name}</span>
								<span class="cl12 m-l-4 m-r-6">:</span> <span>${reply.comment}</span>
								<span class="cl12 m-l-4 m-r-6">|</span> <span>${reply.wDate}</span>

								<div class="m-l-auto">
									<button
										class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
										onclick="admintoggleEditForm('${reply.reply_no}', '${reply.comment}')">수정</button>
								</div>
								<div class="m-l-8">
									<form action="faqReplyDelete" method="post">
										<input type="hidden" name="reply_no" value="${reply.reply_no}" />
										<input type="hidden" name="faqId" value="${reply.faqId}" /> <input
											class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
											type="submit" value="삭제" onclick="return toDelete()" />
									</form>
								</div>
							</div>
							<div id="editForm_${reply.reply_no}" style="display: none;">
								<form action="faqReplyUpdate" method="post">
									<input type="hidden" name="reply_no" value="${reply.reply_no}" />
									<input type="hidden" name="faqId" value="${reply.faqId}" />
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
										name="comment" style="resize: none;">${reply.comment}</textarea>

									<div style="display: flex; justify-content: flex-end;">
										<input
											class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
											type="submit" value="수정" /> <input
											class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
											type="button"
											onclick="admincancelEditForm('${reply.reply_no}')" value="취소">
									</div>
								</form>
							</div>
							<!-- <hr class="bor21"> -->
							<br>
						</c:forEach>

						
						<!-- 페이징 -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr-7">
						    <c:if test="${replyStartPageNum > 1}">
						        <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="?faqId=${faqDetail.faqId}&replyPage=1">&lt;</a>
						    </c:if>
						    
						    <c:forEach var="num" begin="${replyStartPageNum}" end="${replyEndPageNum}">
						        <c:choose>
						            <c:when test="${replySelect == num}">
						                <span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</span>
						            </c:when>
						            <c:when test="${replySelect != num}">
						                <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="?faqId=${faqDetail.faqId}&replyPage=${num}">${num}</a>
						            </c:when>
						        </c:choose>
						    </c:forEach>
						
						    <c:if test="${replyEndPageNum < replyPageNum}">
						        <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="?faqId=${faqDetail.faqId}&replyPage=${replyEndPageNum+1}">&gt;</a>
						    </c:if>
						</div>






						<div>
							<form action="faqReplyInsert" method="post" name="frm_faqReply">
								<input type="hidden" name="faq_number"
									value="${faqDetail.faqId}">
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
										name="comment" placeholder="Comment..." style="resize: none;"></textarea>
								</div>

								<div style="display: flex; justify-content: end">
									<button
										class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
										onclick="return loginCheck_help()">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
</section>
<script>
	function admintoggleEditForm(reply_no, currentComment) {
		var editForm = document.getElementById('editForm_' + reply_no);
		var textarea = editForm.querySelector('textarea');

		if (editForm.style.display === 'block') {
			// If the form is currently visible, hide it
			editForm.style.display = 'none';
		} else {
			// If the form is currently hidden, show it and set the textarea value
			textarea.value = currentComment;
			editForm.style.display = 'block';
			editForm.style.border = 'solid 1px';
		}
	}

	function admincancelEditForm(reply_no) {
		var editForm = document.getElementById('editForm_' + reply_no);
		editForm.style.display = 'none';
	}
</script>
<%@include file="../../includes/footer.jsp"%>
