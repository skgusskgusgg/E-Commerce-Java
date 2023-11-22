<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../includes/header.jsp" %>
<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="qna.html" class="stext-109 cl8 hov-cl1 trans-04">
				Q&A
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				13135
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section >
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80" style="margin: auto; text-align: left">
					<div class="p-r-45 p-r-0-lg">
						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">No.&nbsp</span> 13135  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span>
									<span class="cl4">Product&nbsp</span> 2325  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span>
									<span class="cl4">Writer&nbsp</span> admin  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span>
									<span class="cl4">Date&nbsp</span> 2023.11.15  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span>
									<span class="cl4">Views&nbsp</span> 13157 
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span class="m-l-auto">
									<span class="cl4">
										<button class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04" onClick="location.href='qna-modify.html'">
											글 수정
										</button>
									</span>
								</span>
								
								<span class="m-l-8">
									<span class="cl4">
										<button class="flex-c-m stext-101 cl5 size-127 bg2 bor18 hov-btn3 p-lr-15 trans-04">
											글 삭제
										</button>
									</span>
								</span>
							</span>

							<h4 class="ltext-109 cl2 p-b-28">
								Free shipping for standard order over $100 
							</h4>

							<p class="stext-117 cl6 p-b-26">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet est vel orci luctus sollicitudin. Duis eleifend vestibulum justo, varius semper lacus condimentum dictum. Donec pulvinar a magna ut malesuada. In posuere felis diam, vel sodales metus accumsan in. Duis viverra dui eu pharetra pellentesque. Donec a eros leo. Quisque sed ligula vitae lorem efficitur faucibus. Praesent sit amet imperdiet ante. Nulla id tellus auctor, dictum libero a, malesuada nisi. Nulla in porta nibh, id vestibulum ipsum. Praesent dapibus tempus erat quis aliquet. Donec ac purus id sapien condimentum feugiat.
							</p>

							<p class="stext-117 cl6 p-b-26">
								Praesent vel mi bibendum, finibus leo ac, condimentum arcu. Pellentesque sem ex, tristique sit amet suscipit in, mattis imperdiet enim. Integer tempus justo nec velit fringilla, eget eleifend neque blandit. Sed tempor magna sed congue auctor. Mauris eu turpis eget tortor ultricies elementum. Phasellus vel placerat orci, a venenatis justo. Phasellus faucibus venenatis nisl vitae vestibulum. Praesent id nibh arcu. Vivamus sagittis accumsan felis, quis vulputate
							</p>
						</div>
						<table class="table-qna-img">
								<tr class="table_head">
									<th class="column-1">image</th>
								</tr>
								
								<tr class="table_row">
									<td class="column-2 has-img hov-img1">
										<a href="./product-detail.html" class="js-show-modal1">
											<img src="/resources/images/item-cart-04.jpg" alt="IMG">
										</a>
									</td>
									<td class="column-2 has-img hov-img1">
										<a href="./product-detail.html" class="js-show-modal1">
											<img src="/resources/images/item-cart-05.jpg" alt="IMG">
										</a>
									</td>
								</tr>
							</table>
							
								
									
						
						<!--  -->
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>

							<p class="stext-107 cl6 p-b-40">
								Your email address will not be published. Required fields are marked *
							</p>

							<form>
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
								</div>

								<div class="bor19  m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="name" placeholder="Name *">
								</div>

								<div class="bor19  m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="email" placeholder="Email *">
								</div>

								<div style="display: flex;justify-content: end">
								<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
									Post Comment
								</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</section>	
	 <%@include file="../includes/footer.jsp" %>	