$(document).ready(
	function() {
		var isotopeButton = $('.filter-tope-group button');
		var currentUrl = $(location).attr("href");
		var storedFilter = localStorage.getItem('selectedFilter');
		var navFilter = localStorage.getItem('navFilter');
		
		  if (currentUrl.includes("category_id=" + navFilter)) {
		        isotopeButton.filter('[data-filter="' + navFilter + '"]').addClass("how-active2");
		     
		  }
		isotopeButton.on('click', function() {
			var filter = $(this).attr("data-filter");
		
			// 현재 선택된 버튼에 클래스 추가
			$(this).addClass("how-active2");

			
			// 다른 버튼에서 클래스 제거	
			isotopeButton.not(this).removeClass("how-active2");

			// localStorage에 선택된 필터 저장
			localStorage.setItem('selectedFilter', filter);
		
		});
		
		if (storedFilter) {
			isotopeButton
					.filter('[data-filter="' + storedFilter + '"]')
					.addClass("how-active2");
		}

		
		var btnTag = $('button[data-filter]');
	 
	 	
	 	var color = $('.color');
	 	var size = $('.size');
	 	var sort = $('.sort');
	 	var price = $('.price');
	 	
	 	color.each(function () {
			$(this).on('click',function(){
				// 현재 선택된 버튼에 클래스 추가
				$(this).addClass('filter-link-active');
			
				// 다른 버튼에서 클래스 제거
				color.not(this).removeClass('filter-link-active');
			})
		})
		size.each(function () {
			$(this).on('click',function(){
				// 현재 선택된 버튼에 클래스 추가
				$(this).addClass('filter-link-active');

				// 다른 버튼에서 클래스 제거
				size.not(this).removeClass('filter-link-active');
			})
		})
		sort.each(function () {
			$(this).on('click',function(){
				// 현재 선택된 버튼에 클래스 추가
				$(this).addClass('filter-link-active');

				// 다른 버튼에서 클래스 제거
				sort.not(this).removeClass('filter-link-active');
			})
		})
		price.each(function () {
			$(this).on('click',function(){
				// 현재 선택된 버튼에 클래스 추가
				$(this).addClass('filter-link-active');

				// 다른 버튼에서 클래스 제거
				price.not(this).removeClass('filter-link-active');
			})
		})
	 	
	 	btnTag.each(function () {
			$(this).on('click',function(){
				var filter = $(this).attr("data-filter");
			
				if($(this).hasClass("color")){
					
				
					if(currentUrl.indexOf('color_id') !== -1){
						currentUrl = currentUrl.replace(/color_id=[^&]*/,'color_id=' + filter);
					}else{
						currentUrl += '&color_id=' + filter;
					}
					localStorage.setItem("currentUrl",currentUrl);
				}
				if($(this).hasClass("size")){
					
					
					if(currentUrl.indexOf('size_id') !== -1){
						currentUrl = currentUrl.replace(/size_id=[^&]*/,'size_id=' + filter);
					}else{
						currentUrl += '&size_id=' + filter;
					}
					localStorage.setItem("currentUrl",currentUrl);
				
				}
				if($(this).hasClass("sort")){
					
					
					if(currentUrl.indexOf('sort') !== -1){
						currentUrl = currentUrl.replace(/sort=[^&]*/,'sort=' + filter);
					}else{
						currentUrl += '&sort=' + filter;
					}
					localStorage.setItem("currentUrl",currentUrl);
				}
				if($(this).hasClass("price")){
					
					
					if(currentUrl.indexOf('row') !== -1){
						currentUrl = currentUrl.replace(/row=[^&]*/,'row=' + filter);
						console.log("row : " + currentUrl);
					}else{
						currentUrl += '&row=' + filter;
						console.log("row : " + currentUrl);
					}
					var limit = $(this).attr("data-limit");
					if(currentUrl.indexOf('high') !== -1){
						currentUrl = currentUrl.replace(/high=[^&]*/,'high=' + limit);
						console.log("high : " + currentUrl);
					}else{
						currentUrl += '&high=' + limit;
						console.log("high : " + currentUrl);
					}
					localStorage.setItem("currentUrl",currentUrl);
				}
				
			})					
		})
		// 다른 페이지로 이동할 때 저장된 필터 삭제
		window.addEventListener('beforeunload', function() {
			localStorage.removeItem('selectedFilter');		
		});
		var searchBtn = $("#searchBtn");
	 	
	 	
		searchBtn.on("click",function(){
			var currentItem = localStorage.getItem('currentUrl')
			 if(currentItem){
				 localStorage.removeItem('currentUrl');
				 setTimeout(() => {
						location.href = currentItem;
						
					}, 0);
			 }else{
			
			 }
			
		}) 
		$("input[name='keyword']").on("keyup",function(key){
			if(key.keyCode === 13){
				
				if(href.indexOf('keyword') !== -1){
					location.href = location.href.replace(/keyword=[^&]*/,'keyword=' + $(this).val());
				}else{
				location.href = href + "&keyword=" + $(this).val();	
				}
				
			}
		})
		
});

		