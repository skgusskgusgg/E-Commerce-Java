<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">Best Products</h3>
		</div>

		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
					data-filter="*">All Products</button>
				

			</div>
	
		</div>

	<div class="row bestProduct">
		<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women ">
			<!-- Block2 -->
			<div class="block2">
				<div class="block2-pic hov-img0"
					style="height: 300px; overflow: hidden;">
					<img src="/resources/images/products/outer/23.jpg"
						alt="IMG-PRODUCT" style="height: 100%;">
				</div>

				<div class="block2-txt flex-w flex-t p-t-14">
					<div class="block2-txt-child1 flex-col-l ">
						<a href="/product/productDetail?id=207"
							class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 ">
							Crop Jacket </a> <span class="stext-105 cl3"> 350,000 won </span>
					</div>

					<div class="block2-txt-child2 flex-r p-t-3">
						<a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"
							data-product_id="207" data-product_name="Crop Jacket"> <img
							class="icon-heart1 dis-block trans-04"
							src="/resources/images/icons/icon-heart-01.png" alt="ICON">
							<img class="icon-heart2 dis-block trans-04 ab-t-l"
							src="/resources/images/icons/icon-heart-02.png" alt="ICON">
						</a>
					</div>
				</div>
			</div>
		</div>
		</div>
		</section>	


<script type="text/javascript">
	var bestProduct = $(".bestProduct");
	$.ajax({
		url : "/productDetail/bestProducts",
		type:"GET",
		dataType:"json",
		success:function(data){
			console.log(data)
			var html="";
			for (var i = 0; i < data.length; i++) {
				var price = data[i].price.toLocaleString()
				html += '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women ">'
				html += '<div class="block2">'
				html += '<div class="block2-pic hov-img0"'
				html += 	'style="height: 300px; overflow: hidden;">'
				html += 	'<img src="/resources/images/products/' + data[i].img + '">'
				html += 		' alt="IMG-PRODUCT" style="height: 100%;">'
				html += '</div>'

				html += '<div class="block2-txt flex-w flex-t p-t-14">'
				html += 			'<div class="block2-txt-child1 flex-col-l ">'
				html += 	'<a href="/product/productDetail?id=' + data[i].product_id + '"'
				html += 		'class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 ">'
				html += 		data[i].product_name + '</a> <span class="stext-105 cl3">' + price + ' won </span>'
				html += 	'</div>'

				html += 	'<div class="block2-txt-child2 flex-r p-t-3">'
				html += 		'<a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"'
				html += 			'data-product_id="207" data-product_name="Crop Jacket"> <img'
				html += 			'class="icon-heart1 dis-block trans-04"'
				html += 			'src="/resources/images/icons/icon-heart-01.png" alt="ICON">'
				html += 		'<img class="icon-heart2 dis-block trans-04 ab-t-l"'
				html += 			'src="/resources/images/icons/icon-heart-02.png" alt="ICON">'
				html += 		'</a>'
				html += 	'</div>'
				html += '</div>'
				html += '</div>'
				html += '</div>'
			}
			bestProduct.html(html)
		},error:function(err){
			console.log(err + " - >에러")
		}
	})
</script>