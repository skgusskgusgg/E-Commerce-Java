<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="/board/boardListPage?page=1" class="stext-109 cl8 hov-cl1 trans-04"> Notice <i
			class="fa m-l-9 m-r-10" aria-hidden="true"></i>
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
								<span class="cl4">No.&nbsp</span> ${boardDetail.board_id} <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Writer&nbsp</span>
								${boardDetail.user_name} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Date&nbsp</span>
								${boardDetail.updatedate} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> <span class="cl4">Views&nbsp</span>
								${boardDetail.view} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> 
						
						<span class="m-l-auto"> <span class="cl4"> <a
									class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04"
									href="/board/boardListPage?page=1"> 목록 </a>
							</span>
						</span> 
						</span>

						<h4 class="ltext-109 cl2 p-b-28">${boardDetail.title}</h4>

						<p class="stext-117 cl6 p-b-26">${boardDetail.content}</p>
					</div>
					<table class="table-qna-img">
						<tr class="table_head">
							<th class="column-1">image</th>
						</tr>

						<tr class="table_row">
							<td class="column-2 has-img hov-img1"> 
								<c:forEach var="boardboard" items="${boardDetail.imgFiles}">
									<img src="/faq/${boardboard}" alt="">
								</c:forEach>

							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
		
</section>
<%@include file="../includes/footer.jsp"%>
