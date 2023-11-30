$(document).ready(function(){
	 var modalImgList = $(".modalImgList");
	 var productPrice = $(".productPrice");
	 var productName = $(".productName");
	 
	 
	 $('.js-show-modal1').on('click',function(e){	 
     e.preventDefault();
     
     var aId = $(".js-addwish-b2");
     
     var product_id = $(this).data('product_id');
     
 	 modalImgList.empty();
 	 
     console.log(aId.data("product_id"));
        $.ajax({
        	url:"/productDetail/productDetailModal/" + product_id,
        	type:"GET",
        	dataType:"json",
        	success:function (data) {        	
        		var html = "";		
     				 html += '	<div class="item-slick3"';
					 html += '	data-thumb="/resources/images/product-detail-01.jpg">';
					 html += '		<div class="wrap-pic-w pos-relative">';
					 html += '			<img src="/resources/images/products/' + data.img + '" alt="IMG-PRODUCT">';
					 html += '				<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"';
					 html += '				href="/resources/images/products/' + data.img + '"> <i';
					 html += '				class="fa fa-expand"></i>';
					 html += '				</a>';
					 html += '		</div>';
					 html += '	</div>';
        		
        		modalImgList.html(html);
        		
        		productName.html(data.product_name);
        		
        		 aId.data("product_id", data.product_id);
           		 aId.data("product_name", data.product_name);

        		
        		$("input[data-product_id]").val(data.product_id);
        		$("input[data-product_name]").val(data.product_name);
        		
        		$("button[data-product_name]").val(data.product_name);
        		// $("button[data-product_id]").val(data.product_id);
        		
        		var price = data.price;
        		var formattedPrice = price.toLocaleString();
        		
        		productPrice.html(formattedPrice + " won");
        		
        		$('.js-modal1').addClass('show-modal1');        
		
				
        	},
        	error : function(){
        		console.log("error");
        	}
        })
    });

  
	
})