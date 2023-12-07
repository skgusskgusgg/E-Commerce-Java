<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="bg0 m-t-23 p-b-140">
	<div class="container">
		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="0" onclick="filterPage(this)">All Products</button>
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="1" onclick="filterPage(this)">Outer</button>

				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
					data-filter="2" onclick="filterPage(this)">Top</button>

				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 category"
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
									class="filter-link stext-106 trans-04 size" data-filter="99">All</button></li>
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
									data-filter="99">All</button></li>
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

		<div class="row ">
			<c:forEach items="${product }" var="product">
				<input type="hidden" class="product_id">
				<input type="hidden" class="productName">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0"
							style="height: 300px; overflow: hidden;">
							<img src="/resources/images/products/${product.img }"
								alt="IMG-PRODUCT" style="height: 100%;">
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/product/productDetail?id=${product.product_id }"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 ">
									${product.product_name } </a> <span class="stext-105 cl3"> <fmt:formatNumber
										type="number" maxFractionDigits="3" value="${product.price}" />
									won
								</span>
							</div>


						</div>
					</div>
				</div>
			</c:forEach>

		</div>


		<div class="flex-c-m flex-w w-full p-t-45">

			<nav>
				<ul class="pagina">
					<c:if test="${pageMaker.prev }">
						<li>
							<button class="pageBtn" data-filter="prev"
								onclick="location.href='/product/productList?category_id=0&pageStart=${pageMaker.cri.pageNum - 1}'">
								Previous</button>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li>
							<button class="pageBtn " onclick="pageNum(${num})"
								data-filter="${num }">${num }</button>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li>
							<button class="pageBtn" data-filter="next"
								onclick="location.href='/product/productList?category_id=0&pageStart=${pageMaker.cri.pageNum + 1}'">
								Next</button>
						</li>
					</c:if>

				</ul>
			</nav>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/addWish.js">

</script>
<script type="text/javascript">
	var url = "/product/productList?category_id=";
	var href = $(location).attr("href");
	
	function filterPage(element) {
		    var categoryId = $(element).attr("data-filter");
		    var colorId = $("button.color.pageActive").attr("data-filter");
		    var sizeId = $("button.size.pageActive").attr("data-filter");
		    var defaultColor = 99;
		    var defaultSize = 99;
		    
		    colorId = colorId || defaultColor;
		    sizeId = sizeId || defaultSize;
		    
		    location.href = url + categoryId + "&color_id=" + colorId + "&size_id=" + sizeId;
	}
	
	function pageNum(number) {
		if(href.indexOf('pageStart') !== -1){
			location.href = location.href.replace(/pageStart=[^&]*/,'pageStart=' + number);
		}else{
			location.href = href + '&pageStart=' + number;
		}
	}
	 $(document).ready(function () {
		 var pageBtn = $('.pageBtn');
		 var pagenation = localStorage.getItem('pagenation');
		 pageBtn.on('click', function() {
			 	var filter = $(this).attr("data-filter");
				// 현재 선택된 버튼에 클래스 추가
				$(this).addClass("pageActive");
			
				// 다른 버튼에서 클래스 제거	
				pageBtn.not(this).removeClass("pageActive");
				
				// pageBtn에 선택된 필터 저장
				localStorage.setItem('pagenation', filter);
			});
		 if (pagenation) {
			 pageBtn.filter('[data-filter="' + pagenation + '"]')
						.addClass("pageActive");
			}
		 window.addEventListener('beforeunload', function() {
				localStorage.removeItem('selectedFilter');		
			});
		 console.log(pagenation);
		 
		 $('.btn-addwish-b2').each(function () {
		        var pId = $(this).data('product_id');
		        var element = $(this);  
				console.log(pId)
		        $.ajax({
		            type: 'GET',
		            url: '/productDetail/checkWishStatus/' + pId,
		            success: function (response) {
		                if (response === "exists") {
		                	element.addClass('js-addedwish-b2');
		                    console.log("존재" + pId)
		                } else {
		                	console.log("존재안함" + pId)
		                }
		            },
		            error: function (xhr, status, error) {
		                console.error(xhr.responseText);
		            }
		        });
		    });

			
		 
	})
	
  $('.js-hide-modal1').on('click',function(){
        $('.js-modal1').removeClass('show-modal1');
       location.reload();
       
    });
 
		
</script>
<script type="text/javascript" src="/resources/js/productList.js">
</script>
