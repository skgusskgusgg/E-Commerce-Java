$(document).ready(function(){
	 var slickInitialized = false;
	 var modalImgList = $(".modalImgList");
	 var productName = $(".productName");
	 var productPrice = $(".productPrice");
	 
	 $('.js-show-modal1').on('click',function(e){	 
     e.preventDefault();
     
 	 modalImgList.empty();
     
        $.ajax({
        	url:"/productDetail/productDetailModal",
        	type:"GET",
        	dataType:"json",
        	success:function (data) { 
        	
        		var html = "";
        		for(var i = 0; i <data.imagePath.length; i++){
     				 html += '	<div class="item-slick3"';
					 html += '	data-thumb="/resources/images/product-detail-01.jpg">';
					 html += '		<div class="wrap-pic-w pos-relative">';
					 html += '			<img src="' + data.imagePath[i] + '" alt="IMG-PRODUCT">';
					 html += '				<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"';
					 html += '				href="' + data.imagePath[i] + '"> <i';
					 html += '				class="fa fa-expand"></i>';
					 html += '				</a>';
					 html += '		</div>';
					 html += '	</div>';
        		}
        		modalImgList.html(html);
        		productName.html(data.name);
        		productPrice.html(data.price);
        		$('.js-modal1').addClass('show-modal1');        
        		
		        		
			    if (!slickInitialized) {
                    initializeSlick(data);
                    slickInitialized = true;
                }
     
        	},
        	error : function(){
        		console.log("eorror");
        	}
        })
    });
    
  $('.js-hide-modal1').on('click',function(){
	  if(slickInitialized){	  
  		destorySlick();
  		slickInitialized = false;
	  }
        $('.js-modal1').removeClass('show-modal1');
    });
   
   function destorySlick(){
	   	$('.wrap-slick3').each(function(){
	   		var slickInstance = $(this).find('.slick3');
	   		slickInstance.slick('unslick');
	   	})
   }
   
   function initializeSlick(data){
   	  $('.wrap-slick3').each(function(index, element) {
   	   var images = data.imagePath;
   	   
        $(this).find('.slick3').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            fade: true,
            infinite: true,
            autoplay: false,
            autoplaySpeed: 6000,
            arrows: true,
            appendArrows: $(this).find('.wrap-slick3-arrows'),
            prevArrow: '<button class="arrow-slick3 prev-slick3"><i class="fa fa-angle-left" aria-hidden="true"></i></button>',
            nextArrow: '<button class="arrow-slick3 next-slick3"><i class="fa fa-angle-right" aria-hidden="true"></i></button>',
            dots: true,
            appendDots: $(this).find('.wrap-slick3-dots'),
            dotsClass: 'slick3-dots',
            customPaging: function(slick, index) {
                var imgPath = images[index]
                return '<img src=" ' + imgPath + ' "/><div class="slick3-dot-overlay"></div>';
            },
        });
    });
   } 

})