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
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					 data-filter="0" onclick="filterPage(this)">All
					Products</button>
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="1" onclick="filterPage(this)">Outer</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="2" onclick="filterPage(this)">Top</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="3" onclick="filterPage(this)">Pants</button>

			</div>

			<div class="flex-w flex-c-m m-tb-10">
				<div
					class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
					<i
						class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
					<i
						class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Filter
				</div>

				<div
					class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i
						class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Search
				</div>
			</div>

			<!-- Search product -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text"
						name="keyword" placeholder="Search">
				</div>
			</div>
			<!-- Filter -->
			<div class="dis-none panel-filter w-full p-t-10">
				<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
					<div class="filter-col1 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Sort By</div>

						<ul>
							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 sort" data-filter="ASC">
									Price: Low to Low</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 sort" data-filter="DESC">
									Price: High to High</button></li>
						</ul>
					</div>

					<div class="filter-col2 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Size</div>

						<ul>
							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 size" data-filter="1">Small</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 size" data-filter="2">Medium</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 size" data-filter="3">Large</button></li>

						</ul>
					</div>

					<div class="filter-col3 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Color</div>

						<ul>
							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #222;"> <i class="zmdi zmdi-circle"></i>
							</span>
								<button class="filter-link stext-106 trans-04 color"
									data-filter="1">Black</button></li>
							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #00ad5f;"> <i class="zmdi zmdi-circle"></i>
							</span>
								<button class="filter-link stext-106 trans-04 color"
									data-filter="2">Green</button></li>

							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i>
							</span>
								<button class="filter-link stext-106 trans-04 color"
									data-filter="3">Red</button></li>

							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i>
							</span>
								<button class="filter-link stext-106 trans-04 color"
									data-filter="4">White</button></li>
						</ul>
					</div>

					<div class="filter-col4 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Price</div>

						<ul>
							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 price" data-filter=0
									data-limit=500000>All</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 price" data-filter=50000
									data-limit=150000>50,000won - 150,000won</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 price" data-filter=150000
									data-limit=250000>150,000won - 250,000won</button></li>

							<li class="p-b-6"><button
									class="filter-link stext-106 trans-04 price" data-filter=250000
									data-limit=350000>250,000won - 350,000won</button></li>

						</ul>
					</div>
					<div
						style="width: 100%; display: flex; justify-content: center; padding: 20px 0">
						<button id="searchBtn"
							class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">Filtering</button>
					</div>
				</div>
			</div>
		</div>
		<h3 class="mtext-112 cl2 p-b-10">User Management</h3>
		<hr class="bor21">
			<p>아이디 수정 불가</p>
			<p>포인트 남발 자제 요망</p>
			<hr class="bor21">
			
		<!-- 회원 리스트 -->
		<div class="row ">
			
			
						<table class="hyeongyumodify">
							<tr class="table_hea">
								<th>ID</th>
								<th>이메일</th>
								<th>이름</th>
								<th>주소</th>
								<th>성별</th>
								<th>생일</th>
								<th>phone</th>
								<th>point</th>
								<th>join_date</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="member" items="${memberList}">
								<tr class="table_ro">
									<td class="bor19"><input type="text" value="${member.id}" readonly></td>
									<td class="bor19"><input type="text" value="${member.email}" ></td>
									<td class="bor19"><input type="text" value="${member.user_name}" ></td>
									<td class="bor19"><input type="text" value="${member.address}"></td>
									<c:if test="${member.gender==1}">
									<td class="bor19"><input type="text" value="남자"></td>
									</c:if>
									<c:if test="${member.gender==2}">
									<td class="bor19"><input type="text" value="여자"></td>
									</c:if>
									
									<td class="bor19"><input type="text" value="${member.birth_date}" ></td>
									<td class="bor19"><input type="text" value="${member.phone}" ></td>
									<td class="bor19"><input type="text" value="${member.point}" ></td>
									<td class="bor19"><input type="text" value="${member.join_date}" ></td>
									<td class="bor19"><a href=#>수정</a></td>
									<td class="bor19"><a href=#>삭제</a></td>
								</tr>
							</c:forEach>
					
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
											class="flex-c-m how-pagination1 trans-04 m-all-7"
											href="${num}">${num}</a></td>
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
<form id='actionForm' action="/admin/" method='get'>
	<input type='hidden' name="pageNum" value='${pageManagement.cri.pageNum}'>
	<input type='hidden' name="amount" value='${pageManagement.cri.amount}'>
</form>
<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm")
		var page = 10;
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/addWish.js"></script>

<style>
.hyeongyumodify td input[type="text"]{
	width: 100%;
	text-align: center;
}
.hyeongyumodify td{
	text-align: center;
}
.hyeongyumodify tr td:nth-child(1) {

    width: 5%;
    
}
.hyeongyumodify tr td:nth-child(2) {

    width: 10%;
   
}
.hyeongyumodify tr td:nth-child(3) {

    width: 5%;
}
.hyeongyumodify tr td:nth-child(4) {
	background-color : red;
    
}
.hyeongyumodify tr td:nth-child(5) {

    width: 5%;
}
.hyeongyumodify tr td:nth-child(6) {

    width: 10%;
}
.hyeongyumodify tr td:nth-child(7) {

    width: 10%;
}
.hyeongyumodify tr td:nth-child(8) {

    width: 5%;
}
.hyeongyumodify tr td:nth-child(9) {

    width: 15%;
}
.hyeongyumodify tr td:nth-child(10) {

    width: 5%;
}
.hyeongyumodify tr td:last-child {

    width: 5%;
}
</style>