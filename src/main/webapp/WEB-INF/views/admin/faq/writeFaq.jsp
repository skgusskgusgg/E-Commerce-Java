<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">Help</h2>
</section>


<!-- Content page -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80" style="margin: auto; text-align: left">
				<div class="p-r-45 p-r-0-lg">
					<div class="p-t-32">
						<form action="faqInsert" method="post"
							enctype="multipart/form-data" id="writeFaq">

							<table>
								<thead>
									<tr>
										<td class="ltext-109 cl13 p-b-20 p-lr-10 m-b-10">Help</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text"
											class="mtext-111 cl2 p-all-10 m-b-5"
											style="width: 850px; border: 1px solid #cccccc;"
											name="faqTitle" placeholder="Enter Title Here"></td>
										<td></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="stext-117 cl6 p-tb-10 m-tb-5"><textarea
												name="faqContents"
												style="width: 850px; height: 400px; border: 1px solid #cccccc; padding: 10px;"
												placeholder="Enter Contents Here"></textarea></td>
										<td></td>
									</tr>
									<tr>

									</tr>
								</tbody>
							</table>

							<table class="table-qna-img m-b-20">
								<tbody>
									<tr class="table_head">
										<th class="column-1">이미지 업로드<br></th>
									</tr>
									<tr class="table_head">
										<td class="column-1"><input type="file" id="faq_img"
											name="files" onchange="faq_previewImages();"
											multiple="multiple"></td>
									</tr>
									<tr class="table_row">
										<td class="column-1 has-img hov-img1"
											id="faq_imagePreviewContainer">
											<!-- Image previews will be displayed here -->
										</td>
									</tr>
								</tbody>
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
	function faq_previewImages() {
		var input = document.getElementById('faq_img');
		var previewContainer = document
				.getElementById('faq_imagePreviewContainer');
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