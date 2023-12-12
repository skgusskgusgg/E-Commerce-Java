<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">Notice</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="p-t-32">
						<form action="boardInsert" name="board-frm" method="post">
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
											placeholder="Enter Title Here"></td>
										<td></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="stext-117 cl6 p-tb-10 m-tb-5"><textarea
												name="content"
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
										<td class="column-1"><input type="file" id="board_img"
											name="files" onchange="board_previewImages();" multiple="multiple"></td>
									</tr>
									<tr class="table_row">
										<td class="column-1 has-img hov-img1"
											id="board_imagePreviewContainer">
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

			<div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">
					<div class="bor17 of-hidden pos-relative">
						<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55"
							type="text" name="search" placeholder="Search">

						<button
							class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
					</div>

					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-33">Categories</h4>

						<ul>
							<li class="bor18"><a href="#"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Fashion </a></li>

							<li class="bor18"><a href="#"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Beauty </a></li>

							<li class="bor18"><a href="#"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Street Style </a></li>

							<li class="bor18"><a href="#"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Life Style </a></li>

							<li class="bor18"><a href="#"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									DIY &amp; Crafts </a></li>
						</ul>
					</div>

					<div class="p-t-65">
						<h4 class="mtext-112 cl2 p-b-33">Featured Products</h4>

						<ul>
							<li class="flex-w flex-t p-b-30"><a href="#"
								class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img
									src="images/product-min-01.jpg" alt="PRODUCT">
							</a>

								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04"> White
										Shirt With Pleat Detail Back </a> <span
										class="stext-116 cl6 p-t-20"> $19.00 </span>
								</div></li>

							<li class="flex-w flex-t p-b-30"><a href="#"
								class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img
									src="images/product-min-02.jpg" alt="PRODUCT">
							</a>

								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
										Converse All Star Hi Black Canvas </a> <span
										class="stext-116 cl6 p-t-20"> $39.00 </span>
								</div></li>

							<li class="flex-w flex-t p-b-30"><a href="#"
								class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img
									src="images/product-min-03.jpg" alt="PRODUCT">
							</a>

								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04"> Nixon
										Porter Leather Watch In Tan </a> <span
										class="stext-116 cl6 p-t-20"> $17.00 </span>
								</div></li>
						</ul>
					</div>

					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-20">Archive</h4>

						<ul>
							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> July 2018 </span> <span> (9) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> June 2018 </span> <span> (39) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> May 2018 </span> <span> (29) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> April 2018 </span> <span> (35) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> March 2018 </span> <span> (22) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> February 2018 </span> <span> (32) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> January 2018 </span> <span> (21) </span>
							</a></li>

							<li class="p-b-7"><a href="#"
								class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> December 2017 </span> <span> (26) </span>
							</a></li>
						</ul>
					</div>

					<div class="p-t-50">
						<h4 class="mtext-112 cl2 p-b-27">Tags</h4>

						<div class="flex-w m-r--5">
							<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Fashion </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Lifestyle </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Denim </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Streetstyle </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Crafts </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	function board_previewImages() {
		var input = document.getElementById('board_img');
		var previewContainer = document.getElementById('board_imagePreviewContainer');
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
<%@include file="../includes/footer.jsp"%>