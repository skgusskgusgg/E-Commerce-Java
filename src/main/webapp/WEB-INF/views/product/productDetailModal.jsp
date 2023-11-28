<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal1 -->
<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
	<div class="overlay-modal1 js-hide-modal1"></div>

	<div class="container">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal1">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb modalImgList">
								<div class="item-slick3"
									data-thumb="/resources/images/product-detail-01.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="/resources/images/product-detail-01.jpg"
											alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="/resources/images/product-detail-01.jpg"> <i
											class="fa fa-expand"></i>
										</a>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<input type="hidden" name="product_id" class="product_id">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14 productName">Lightweight
							Jacket</h4>

						<span class="mtext-106 cl2 productPrice"> $58.79 </span>

						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">Size</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="size">
											<option>Choose an option</option>
											<option value="1">Size S</option>
											<option value="2">Size M</option>
											<option value="3">Size L</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">Color</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="color">
											<option>Choose an option</option>
											<option value="1">Black</option>
											<option value="2">Green</option>
											<option value="3">Red</option>
											<option value="4">White</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<!-- 이 부분이 수량 조정 부분 -->
										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<button
										class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										Add to cart</button>
								</div>
							</div>
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
									data-tooltip="Add to Wishlist"> <i
									class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">
$(document).on('click', '.js-addwish-detail', function () {
    var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
    var product_name = $(".productName").html();
    var productId = $(".product_id").val();
	console.log("click!!!!!!!!!!!!!!!!!!!!!!!");
    Swal.fire({
        title: "WishLists에 저장하시겠습니까?",
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: "추가",
        denyButtonText: `삭제`
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'POST',
                url: "/productDetail/postWish",
                contentType: 'application/json',
                data: JSON.stringify({ product_name: product_name }),
                success: function (response) {
                    Swal.fire("WishList에 추가되었습니다!", "", "success");
                   
                },
                error: function (xhr, status, error) {
                    Swal.fire("WishList 추가 중 오류가 발생했습니다.", "", "error");
                }
            });
        } else if (result.isDenied) {
            $.ajax({
                type: 'DELETE',
                url: '/productDetail/deleteWish',
                contentType: 'application/json',
                data: JSON.stringify({ product_id: productId}),
                success: function (response) {
                    Swal.fire("WishList에서 제거되었습니다.", "", "success");
                    
                },
                error: function (xhr, status, error) {
                    Swal.fire("WishList 제거 중 오류가 발생했습니다.", "", "error");
                }
            });
        }
    });
	
    $(this).toggleClass('js-addedwish-detail');
});
</script>
