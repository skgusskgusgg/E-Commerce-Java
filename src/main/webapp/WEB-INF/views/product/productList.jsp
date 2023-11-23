<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 " data-filter="*" onclick="location.href='/product/productList'">
						All Products
					</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter="outer" onclick="location.href='/product/productList?category_id=1'">
						Outer
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter="top" onclick="location.href='/product/productList?category_id=2'">
						Top
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter="pants" onclick="location.href='/product/productList?category_id=3'">
						Pants
					</button>

				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<%@include file="../includes/search.jsp" %>

				<!-- Filter -->
				<%@include file="../includes/filter.jsp" %>

			<div class="row ">
				<c:forEach items="${product }" var="product">
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0" style="height: 300px; overflow: hidden;">
							<img src="/resources/images/products/${product.img }" alt="IMG-PRODUCT">

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/product/productDetail" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${product.product_name }
								</a>

								<span class="stext-105 cl3">
									${product.price }
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="/resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			
			</div>

		
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More
				</a>
			</div>
		</div>
	</div>
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
$(document).ready(function () {
    var isotopeButton = $('.filter-tope-group button');
  
    isotopeButton.each(function () {
        $(this).on('click', function () {
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
        isotopeButton.filter('[data-filter="' + storedFilter + '"]').addClass('how-active1');
    }
});

</script>