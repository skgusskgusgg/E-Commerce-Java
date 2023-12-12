<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">Notice</h2>
</section>
<style>
.new-button {
	background-color: transparent; /* Transparent background */
	border: 2px solid violet; /* Violet outline */
	padding: 3px 3px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	/* Smooth transition on hover */
}

.new-button:hover {
	background-color: violet; /* Violet background on hover */
	color: #fff; /* White text color on hover */
}

.flex-c-m.how-pagination1.trans-04.m-all-7.active-pagination1 {
	color: white;
}

.new-button-edit {
	background-color: transparent; /* Transparent background */
	border: 2px solid black; /* Violet outline */
	padding: 3px 3px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.new-button-edit:hover {
	background-color: black; /* Violet background on hover */
	color: white; /* White text color on hover */
}
</style>

<!-- Content page -->
<section class="bg0 p-t-30 p-b-60">
	<div class="container">
		<div class="flex-w flex-l-m filter-tope-group m-tb-10"></div>
		<div class="row" style="width: 100%">
			<div style="width: 100%">
				<div class="p-r-0-lg">
					<!-- item Q&A -->

					<h1 class="ltext-109 cl2 ">Notice</h1>

					<hr class="bor21">
					<form method="post" action="deleteSelected">
						<table class="table-content-board">
							<tr class="table_head">
								<c:if test="${loginOK == 99}">
									<th class="column-0"><input type="checkbox" id="selectAll"></th>
								</c:if>
								<th class="column-1">No.</th>
								<th class="column-3">Title</th>
								<th class="column-4">Writer</th>
								<th class="column-5">Date</th>
								<th class="column-6">views</th>
								<c:if test="${loginOK == 99}">
									<th class="column-6" colspan="2">
										<button class="new-button" type="submit"
											onclick="return deleteSelected()">
											<b>선택 삭제</b>
										</button>
									</th>
								</c:if>

							</tr>
							<c:forEach items="${list}" var="board">
								<tr class="table_row">
									<c:if test="${loginOK == 99}">
										<td class="column-0"><input name="deleteList"
											type="checkbox" value="${board.board_id}"></td>
									</c:if>
									<td class="column-1"><c:out value="${board.board_id}" /></td>
									<td class="column-3"><a
										href="/board/boardDetail?board_id=${board.board_id}"
										class="cl13 hov-cl1 trans-04"><c:out
												value="${board.title}" /></a></td>
									<td class="column-4"><c:out value="${board.user_id}" /></td>
									<td class="column-5"><c:out value="${board.updatedate}" /></td>
									<td class="column-6"><c:out value="${board.view}" /></td>
									<c:if test="${loginOK == 99}">
										<td class="column-6"><a class="new-button-edit"
											href="/board/boardEdit?board_id=${board.board_id}">수정</a></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</form>



				</div>
				<!-- Pagination -->
				<div class="flex-l-m flex-w w-full p-t-10 m-lr-7">
					<c:if test="${prev}">
						<span> <a
							href="/board/boardListPage?page=${startPageNum - 1}"
							class="flex-c-m how-pagination1 trans-04 m-all-7"><</a>
						</span>
					</c:if>

					<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
						<span> <c:if test="${select != num}">
								<a href="boardListPage?page=${num}"
									class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a>
							</c:if> <c:if test="${select == num}">
								<a
									class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><b>${num}</b></a>
							</c:if>
						</span>
					</c:forEach>

					<c:if test="${next}">
						<span> <a
							href="/board/boardListPage?page=${endPageNum + 1}"
							class="flex-c-m how-pagination1 trans-04 m-all-7">></a>
						</span>
					</c:if>


					<a href="/board/boardWrite"
						class="flex-r-m how-pagination1 trans-04 m-all-7"
						onclick="return loginCheck_help()"> 글쓰기 </a>

				</div>

			</div>
		</div>
	</div>

</section>
<%@include file="../includes/footer.jsp"%>
<script>
	$(document).ready(function() {
		// 전체 선택 체크박스
		$("#selectAll").click(function() {
			$("input[name='deleteList']").prop('checked', this.checked);
		});
	});
	// 선택 삭제 함수
	function deleteSelected() {
		var selectedItems = [];

		// 선택된 체크박스 가져오기
		$('input[name="deleteList"]:checked').each(function() {
			selectedItems.push($(this).val());
		});

		// 선택된 항목이 없을 경우 알림
		if (selectedItems.length === 0) {
			alert("선택된 항목이 없습니다.");
			return false;
		}

		// 사용자에게 삭제 여부 확인
		var isConfirmed = confirm("선택한 항목을 삭제하시겠습니까?");

		// 사용자가 확인을 눌렀을 때 삭제 요청
		if (isConfirmed) {
			console.log("deleteSelected 함수 호출됨");
			alert("삭제완료");
			return true;
		} else {
			return false;
		}
	}
</script>