$(document).ready(function () {
    (function ($) {
    "use strict";

    /*==================================================================
    [ Search ]*/
  		var typingTimer;
    	var doneTypingInterval = 2000;
		var input = $('.search-input');
	    var CategoryColumns = [];
	    $('.search-Category-all').on('click', function(){
	    	$("#searchResultsContainer").empty();
	    	$("#searchResultsContainer").html(CategoryColumns[0]);
	    	showSearchResult();
	    });
	    $('.search-Category-outer').on('click', function(){
	    	$("#searchResultsContainer").empty();
	    	$("#searchResultsContainer").html(CategoryColumns[1]);
	    	showSearchResult();
	    });
	    $('.search-Category-top').on('click', function(){
	    	$("#searchResultsContainer").empty();
	    	$("#searchResultsContainer").html(CategoryColumns[2]);
	    	showSearchResult();
	    });
	    $('.search-Category-pants').on('click', function(){
	    	$("#searchResultsContainer").empty();
	    	$("#searchResultsContainer").html(CategoryColumns[3]);
	    	showSearchResult();
	    });
		
		$('.show-search-modal').on('click', function(){
			$('.search-grid-container').show();
	    });
		
		$('.hide-search-modal').on('click', function(){
			$('.search-grid-container').hide();
	    });

		function closeSearch(){
			$('.search-grid-item').css('background-color', 'rgba(255,255,255,0.9)');	
			   $('.search-grid-container').css('grid-template-columns', '0fr 1fr 0fr');
			   $('.search-grid-container').css('grid-template-rows', '1.2fr 0.8fr');
			   $('.search-input-height-div').css('height', '17.5%');
			   $('.search-input-sub-div').css('width', '100%');
			   $('.form-search-input').css('height', ' 100%');
			   $('.form-search-input input').css('font-size', '50px');
			   $('.form-search-input button').css('font-size', '50px');
			   $('.search-list-container').css('overflow-y', '');
			   $('.search-list-container').css('display', 'none');
			   $('.search-list-container').css('max-height', '40vh');
			   $('.search-list-sub-container').css('position', 'absolute');
			   $('.search-list-sub-container').css('top', '');
			   $('.search-list-sub-container').css('bottom', '101%');
			   $('.search-list-sub-container').css('display', 'none');
			   $('.search-product-dummy-item').css('display', 'none');
			   $('.search-product-item').css('display', 'none');
			   $('.search-left-bar-desktop').css('display', 'none');
			   $('.search-left-bar-desktop').removeClass('search-left-bar-desktop-browser');
			   $("#searchResultsContainer").empty();
			   resetShowSearchItem();
		}
		input.on("input", function (event) {
	     	event.preventDefault();
			inputSearchBar();
	    });
		function inputSearchBar(){
	     	clearTimeout(typingTimer);
	     	if (input.val().trim() !== '') {
	     		typingTimer = setTimeout(doneTyping, doneTypingInterval);
	     	}else {
				   closeSearch();
				 }
		}
		function doneTyping() { 	
		   $('.search-grid-item').css('background-color', 'rgba(255,255,255,0.9)');	
		   $('.search-grid-container').css('grid-template-columns', '0.5fr 2fr 0.5fr');
		   $('.search-grid-container').css('grid-template-rows', '0.5fr 1.5fr');
		   $('.search-input-height-div').css('height', '80%');
		   $('.search-input-sub-div').css('width', '30%');
		   $('.form-search-input').css('height', ' 75%');
		   $('.form-search-input input').css('font-size', '30px');
		   $('.form-search-input button').css('font-size', '40px');
		   $('.search-list-container').css('overflow-y', 'auto');
		   $('.search-list-container').css('display', 'flex');
		   $('.search-list-container').css('max-height', '80vh');
		   var inputKeyword = $("input[name='search']").val(); 
		   $.ajax({
	            url: '/search/list',
	            method: 'GET',
	            data: { keyword: inputKeyword },
	            success: function(response) {
	            	console.log(response);
	            	updatePage(response);
	            },
	            error: function(error) {
	                console.error('검색 결과를 가져오는 중 오류 발생:', error);
	            }
	   		});
		   searchPrepare();
		}
	function searchPrepare() {
		let timerInterval;
		Swal.fire({
		  title: "Searching item",
		  timer: 2000,
		  timerProgressBar: true,
		  didOpen: () => {
		    Swal.showLoading();
		    const timer = Swal.getPopup().querySelector("b");
		  },
		  willClose: () => {
		    clearInterval(timerInterval);
		    Swal.fire({
				  position: "center",
				  icon: "success",
				  title: "done",
				  showConfirmButton: false,
				  timer: 1500
				  
				});
		    setTimeout(function() {
				showSearchResult();
			}, 1500);
		  }
		})
	}
  	function updatePage(response) {
	    var listColumns = [];
	    var CategoryList = ['', 'outer', 'top', 'pants'];
	    for (let k = 0; k<4; k++){
	    	CategoryColumns[k] = [];
		    for (let i = 0; i < 5; i++) {
		        listColumns[i] = "<div class='search-list-sub-container search-column-" + (i+1) + "'>";
		        listColumns[i] += "<div class='search-product-dummy-item search-list-pull-up'>";
		        listColumns[i] += "<img src='/resources/images/dummy.jpg' alt='IMG'></div>";
		        $(response).find('item').each((index, item) => {
		        	if((index%5==i)&&(k==0)){
			            listColumns[i] += "<div class='search-product-item'>";
			            listColumns[i] += "<img src='/resources/images/products/"+$(item).find("img").text()+"' alt='IMG'>";
			            listColumns[i] += "<div class='block2-txt search-item-text-flex p-t-14'>";
			            listColumns[i] += "<div class='search-text-child flex-col-c'>";
			            listColumns[i] += "<a href='/product/productDetail?id="+$(item).find("product_id").text()+"' class='stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6'>"+$(item).find("product_name").text()+"</a>";
			            listColumns[i] += "<span class='stext-105 cl3'>"+$(item).find("price").text()+"</span>";
			            listColumns[i] += "</div></div></div>";
			        }
		        });
		        $(response).find('category_id').each((index, item) => {
		        	if($(item).text()==CategoryList[k]){
			        	if((index%5==i)&&(k!=0)){
				            listColumns[i] += "<div class='search-product-item'>";
				            listColumns[i] += "<img src='/resources/images/products/"+$(item).parent().find("img").text()+"' alt='IMG'>";
				            listColumns[i] += "<div class='block2-txt search-item-text-flex p-t-14'>";
				            listColumns[i] += "<div class='search-text-child flex-col-c'>";
				            listColumns[i] += "<a href='/product/productDetail?id="+$(item).parent().find("product_id").text()+"' class='stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6'>"+$(item).parent().find("product_name").text()+"</a>";
				            listColumns[i] += "<span class='stext-105 cl3'>"+$(item).parent().find("price").text()+"</span>";
				            listColumns[i] += "</div></div></div>";
				        }
		        	}
		        });
	
		        listColumns[i] += "</div></div>";
		        CategoryColumns[k].push(listColumns[i]);
		    }
		    
	    }
	    $("#searchResultsContainer").html(CategoryColumns[0]);
	}
		
		function showSearchResult() {
	        $('.search-list-sub-container').css('position', 'relative');
			$('.search-list-sub-container').css('bottom', '');
			$('.search-list-sub-container').css('top', '0px');
			$('.search-list-sub-container').css('display', 'flex');
			$('.search-left-bar-desktop').css('display', 'flex');
			$('.search-left-bar-desktop').addClass('search-left-bar-desktop-browser');
			$('.search-product-dummy-item').css('display', 'flex');
			$('.search-product-item').css('display', 'flex');

			
			setTimeout(function(){
				showSearchItem();
				
			},1000);
		}
		function showSearchItem() {
			 for (let i = 1; i <= 5; i++) {
			        let pullUp = $('.search-column-' + i + ' .search-list-pull-up');
			        let delay = i * 0.25;
			        let transitionTime = 2000;
			        let noneDelay = i*250+transitionTime;
			        pullUp.css('margin', '0');
			        pullUp.css('height', '0');
			        pullUp.css('transition-delay', delay + 's');
			        
			        $('.search-column-' + i).css('opacity', '1');
			        $('.search-column-' + i).css('transition-delay', delay + 's');

			        setTimeout(function(){
			        	pullUp.css('display', 'none');
			        }, noneDelay);
			    }
		}
		function resetShowSearchItem() {
			 for (let i = 1; i <= 5; i++) {
			        let pullUp = $('.search-column-' + i + ' .search-list-pull-up');
			        pullUp.css('display', 'flex');
			        pullUp.css('height', '100%');
			        pullUp.css('transition-delay', 0 + 's');
			        $('.search-column-' + i).css('opacity', '0');
			        $('.search-column-' + i).css('transition-delay', 0 + 's');
			    }
		}

    })(jQuery);
});