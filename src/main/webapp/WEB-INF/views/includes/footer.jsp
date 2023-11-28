<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-3 p-b-50">
				<h4 class="stext-301 cl0 p-b-30">Categories</h4>

				<ul>
					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Women </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Men </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Shoes </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Watches </a></li>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-50">
				<h4 class="stext-301 cl0 p-b-30">Help</h4>

				<ul>
					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Track Order </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Returns </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> Shipping </a></li>

					<li class="p-b-10"><a href="#"
						class="stext-107 cl7 hov-cl1 trans-04"> FAQs </a></li>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-50">
				<h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

				<p class="stext-107 cl7 size-201">Any questions? Let us know in
					store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on
					(+1) 96 716 6879</p>

				<div class="p-t-27">
					<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
						class="fa fa-facebook"></i>
					</a> <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
						class="fa fa-instagram"></i>
					</a> <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
						class="fa fa-pinterest-p"></i>
					</a>
				</div>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-50">
				<h4 class="stext-301 cl0 p-b-30">Newsletter</h4>

				<form>
					<div class="wrap-input1 w-full p-b-4">
						<input class="input1 bg-none plh1 stext-107 cl7" type="text"
							name="email" placeholder="email@example.com">
						<div class="focus-input1 trans-04"></div>
					</div>

					<div class="p-t-18">
						<button
							class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
							Subscribe</button>
					</div>
				</form>
			</div>
		</div>

		<div class="p-t-40">
			<div class="flex-c-m flex-w p-b-18">
				<a href="#" class="m-all-1"> <img
					src="/resources/images/icons/icon-pay-01.png" alt="ICON-PAY">
				</a> <a href="#" class="m-all-1"> <img
					src="/resources/images/icons/icon-pay-02.png" alt="ICON-PAY">
				</a> <a href="#" class="m-all-1"> <img
					src="/resources/images/icons/icon-pay-03.png" alt="ICON-PAY">
				</a> <a href="#" class="m-all-1"> <img
					src="/resources/images/icons/icon-pay-04.png" alt="ICON-PAY">
				</a> <a href="#" class="m-all-1"> <img
					src="/resources/images/icons/icon-pay-05.png" alt="ICON-PAY">
				</a>
			</div>

			<p class="stext-107 cl6 txt-center">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | Made with <i class="fa fa-heart-o"
					aria-hidden="true"></i> by <a href="https://colorlib.com"
					target="_blank">Colorlib</a> &amp; distributed by <a
					href="https://themewagon.com" target="_blank">ThemeWagon</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</p>
		</div>
	</div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
	<span class="symbol-btn-back-to-top"> <i
		class="zmdi zmdi-chevron-up"></i>
	</span>
</div>

<%@include file="../product/productDetailModal.jsp" %>
<!-- Modal login -->
<div class="wrap-modal-login js-modal-login p-t-60 p-b-20">
	<div class="overlay-modal-login js-hide-modal-login"></div>

	<div id="modalContainer">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal-login">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>

			<div class="authincation h-100">
				<div class="container-fluid h-100">
					<div class="row justify-content-center h-100 align-items-center">
						<div class="col-md-6">
							<div class="authincation-content">
								<div class="row no-gutters">
									<div class="col-xl-12">
										<div class="auth-form">
											<h4 class="text-center mb-4">Sign in your account</h4>
											<form action="index.html">
												<div class="form-group">
													<label><strong>Email</strong></label> <input type="email"
														class="form-control" value="hello@example.com">
												</div>
												<div class="form-group">
													<label><strong>Password</strong></label> <input
														type="password" class="form-control" value="Password">
												</div>
												<div
													class="form-row d-flex justify-content-between mt-4 mb-2">
													<div class="form-group">
														<div class="form-check ml-2">
															<input class="form-check-input" type="checkbox"
																id="basic_checkbox_1"> <label
																class="form-check-label" for="basic_checkbox_1">Remember
																me</label>
														</div>
													</div>
													<div class="form-group">
														<a href="page-forgot-password.html">Forgot Password?</a>
													</div>
												</div>
												<div class="text-center">
													<button type="submit" class="btn btn-primary btn-block">Sign
														me in</button>
												</div>
											</form>
											<div class="new-account mt-3">
												<p>
													Don't have an account? <a class="text-primary"
														href="/join/join">Sign up</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/slick/slick.min.js"></script>
<script src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script
	src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script src="/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	/* 위시리스트 모달 -> productList, productDetailModal에 각각 있음. */

	

	/*---------------------------------------------*/

	$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().parent()
						.find('.js-name-detail').html();
				$(this).on('click', function() {
					Swal.fire({
						  position: "center",
						  icon: "success",
						  title: "Added to your cart!",
						  showConfirmButton: false,
						  timer: 1500
						});
				});
			});
</script>
<!--===============================================================================================-->
<script
	src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function() {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed : 1,
			scrollingThreshold : 1000,
			wheelPropagation : false,
		});

		$(window).on('resize', function() {
			ps.update();
		})
	});
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<script src="/resources/js/wishList.js"></script>
<script src="/resources/js/productDetail.js"></script>
</body>
</html>