<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="bg0 m-t-23 p-b-140">
	<div class="container">
		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					style="color: #6c7ae0;" data-filter="0" onclick="filterPage(this)">All
					Products</button>
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter="1" onclick="filterPage(this)">Outer</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter="2" onclick="filterPage(this)">Top</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
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
						name="search-product" placeholder="Search">
				</div>
			</div>
			<!-- Filter -->
			<div class="dis-none panel-filter w-full p-t-10">
				<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
					<div class="filter-col1 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Sort By</div>

						<ul>
							<li class="p-b-6"><a
								class="filter-link stext-106 trans-04 filter-link-active"
								data-filter="ASC"> All </a></li>

							<li class="p-b-6"><a
								class="filter-link stext-106 trans-04 sort" 
								data-filter="ASC">
									Price: Low to Low </a></li>

							<li class="p-b-6"><a
								class="filter-link stext-106 trans-04 sort" 
								data-filter="DESC">
									Price: High to High </a></li>
						</ul>
					</div>

					<div class="filter-col2 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Size</div>

						<ul>
							<li class="p-b-6"><a
								class="filter-link stext-106 trans-04 size"
								data-filter="1">Small</a></li>

							<li class="p-b-6"><a
								class="filter-link stext-106 trans-04 size"
								data-filter="2">Medium</a></li>

							<li class="p-b-6"><a 
								class="filter-link stext-106 trans-04 size"
								data-filter="3">Large</a></li>

						</ul>
					</div>

					<div class="filter-col3 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Color</div>

						<ul>
							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #222;"> <i class="zmdi zmdi-circle"></i>
							</span> <a class="filter-link stext-106 trans-04 color"
									data-filter="1"> Black </a></li>
							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #00ad5f;"> <i class="zmdi zmdi-circle"></i>
							</span> <a class="filter-link stext-106 trans-04 color"
									data-filter="2"> Green </a></li>

							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i>
							</span> <a class="filter-link stext-106 trans-04 color"
									data-filter="3"> Red </a></li>

							<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
								style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i>
							</span> <a class="filter-link stext-106 trans-04 color"
									data-filter="4"> White </a></li>
						</ul>
					</div>

					<div class="filter-col4 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Price</div>

						<ul>
							<li class="p-b-6"><a href="/product/productList"
								class="filter-link stext-106 trans-04 filter-link-active">
									All </a></li>

							<li class="p-b-6"><a href="#"
								class="filter-link stext-106 trans-04"> 0won - 50,000won </a></li>

							<li class="p-b-6"><a href="#"
								class="filter-link stext-106 trans-04"> 50,000won -
									100,000won </a></li>

							<li class="p-b-6"><a href="#"
								class="filter-link stext-106 trans-04"> 100,000won -
									150,000won </a></li>

						</ul>
					</div>
				<button id="searchBtn">검색!!!!!!!!!!!!!!!!!!!</button>
				</div>
			</div>
		</div>

		<div class="row ">
			<c:forEach items="${product }" var="product">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0"
							style="height: 300px; overflow: hidden;">
							<img src="/resources/images/products/${product.img }"
								alt="IMG-PRODUCT"> <a href="#"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View </a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/product/productDetail"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${product.product_name } </a> <span class="stext-105 cl3">
									${product.price } </span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#"
									class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04"
									src="/resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l"
									src="/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>


		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="#"
				class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
				Load More </a>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">


	var url = "/product/productList?category_id=";
	
	$(document).ready(
			function() {
				var isotopeButton = $('.filter-tope-group button');

				isotopeButton.each(function() {
					$(this).on('click', function() {
						var filter = $(this).attr("data-filter");

						// 현재 선택된 버튼에 클래스 추가
						$(this).addClass('how-active1');

						// 다른 버튼에서 클래스 제거
						isotopeButton.not(this).removeClass('how-active1');

						// localStorage에 선택된 필터 저장
						localStorage.setItem('selectedFilter', filter);

					});
				});

				// 저장된 필터가 있으면 해당 필터에 클래스 추가
				var storedFilter = localStorage.getItem('selectedFilter');

				if (storedFilter) {
					isotopeButton
							.filter('[data-filter="' + storedFilter + '"]')
							.addClass('how-active1');
				}

				// 가격 오름차순
				var sort = $(".sort");
				var currentUrl = $(location).attr("href");
				
				sort.each(function() {
					$(this).on("click",function() {
						var filter = $(this).attr("data-filter");

						// 현재 URL에 sort 파라미터가 이미 있는지 확인
						if (currentUrl.indexOf('sort=') !== -1) {
							// sort 파라미터가 이미 있다면 새 값으로 교체
							currentUrl = currentUrl.replace(/sort=[^&]*/, 'sort=' + filter);
						} else {
				            // sort 파라미터가 없다면 URL에 추가
				            currentUrl += '&sort=' + filter;
				        };
				        // location.href = currentUrl;
				        
				        // 검색버튼으로 보내기 위해 localStorage에 저장
						localStorage.setItem("currentUrl",currentUrl);
			
					})		
				})
				var currentItem =localStorage.getItem('currentUrl')
				
				
				
				// 사이즈 순
				var size = $(".size");
				size.each(function () {
					$(this).on("click",function(){
						var filter = $(this).attr("data-filter");
						
						if (currentUrl.indexOf('size_id=') !== -1) {
							// sort 파라미터가 이미 있다면 새 값으로 교체
							currentUrl = currentUrl.replace(/size_id=[^&]*/, 'size_id=' + filter);
						} else {
				            // sort 파라미터가 없다면 URL에 추가
				            currentUrl += '&size_id=' + filter;
				        };
				        localStorage.setItem("currentUrl",currentUrl);
				        
					})
				})
				
				// 컬러 순
				var color = $(".color");
				color.each(function () {
					$(this).on("click",function(){
						var filter = $(this).attr("data-filter");
						
						if(currentUrl.indexOf('color_id') !== -1){
															
							currentUrl = currentUrl.replace(/color_id=[^&]*/,'color_id=' + filter); 
						}else{
							currentUrl += '&color_id=' + filter;
						}
						localStorage.setItem("currentUrl",currentUrl);
					})
				})
				
				var searchBtn = $("#searchBtn");
				searchBtn.on("click",function(){
					location.href = currentItem;
				})
				console.log(currentItem)
				// 다른 페이지로 이동할 때 저장된 필터 삭제
				window.addEventListener('beforeunload', function() {
					localStorage.removeItem('selectedFilter');
				});

			});
		function filterPage(element) {
			location.href = url + $(element).attr("data-filter");
	
		}
</script>