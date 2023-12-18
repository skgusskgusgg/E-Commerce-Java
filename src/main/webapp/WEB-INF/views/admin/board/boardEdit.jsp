<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">Notice</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80" style="margin: auto; text-align: left">
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
						</span>
						<form name="faq-frm" method="post" enctype="multipart/form-data">
							<table>
								<thead>
									<tr>
										<td class="ltext-109 cl13 p-b-20 p-lr-10 m-b-10">Notice</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text"
											class="mtext-111 cl2 p-all-10 m-b-5"
											style="width: 850px; border: 1px solid #cccccc;" name="title"
											placeholder="Enter Title Here" value="${boardDetail.title}"></td>
										<td></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="stext-117 cl6 p-tb-10 m-tb-5"><textarea
												name="content"
												style="width: 850px; height: 400px; border: 1px solid #cccccc; padding: 10px;"
												placeholder="Enter Contents Here">${boardDetail.content}</textarea></td>
										<td></td>
									</tr>
									<tr>

									</tr>
								</tbody>
							</table>

							<table class="table-qna-img m-b-20">
								<tbody>
									<tr class="table_head">
										<th class="column-1">파일 첨부하기 <input type="hidden"
											name="originalImg_board" value="${boardDetail.img}" /> <input
											type="file" id="board_img2" name="files2"
											onchange="board_previewImages2();" multiple="multiple">
										</th>
									</tr>

									<tr class="table_head">
										<td class="column-1">현재 첨부된 파일 : <c:forEach
												var="fileName"
												items="${empty boardDetail.imgFiles ? '' : boardDetail.imgFiles}">
                                            ${fileName}<br />
											</c:forEach>
										</td>
									</tr>
									<tr class="table_row">
										<td class="column-1 has-img hov-img1"
											id="board_imagePreviewContainer2">
											<!-- Image previews will be displayed here --> <c:forEach
												var="boardboard" items="${boardDetail.imgFiles}">
												<img src="/faq/${boardboard}" alt="FAQ Image">
											</c:forEach>
										</td>
									</tr>
							</table>
							<input type="submit" value="Submit"
								class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	function board_previewImages2() {
		var input = document.getElementById('board_img2');
		var previewContainer = document
				.getElementById('board_imagePreviewContainer2');
		previewContainer.innerHTML = ''; // Clear previous previews

		if (input.files && input.files.length > 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var image = document.createElement('img');
					image.src = e.target.result;
					image.width = 500; // Set the width as needed
					image.height = 500; // Set the height as needed
					previewContainer.appendChild(image);
				};

				reader.readAsDataURL(input.files[i]);
			}
		}
	}
</script>
<%@include file="../../includes/footer.jsp"%>