$(document).ready(function(){
	
	$('.js-show-cart').on('click',function(){
    var wish = $(".wish");

         $.ajax({
            url: "/wish/wishList",
            type: "GET",
            dataType: "json",
            success: function (data) {
                // 서버로부터 받은 HTML 데이터를 모달에 적용
                $(".js-panel-cart").addClass("show-header-cart");
                var html = "";
              
                 for (var i = 0; i < data.length; i++) {
		            html += '<li id="item-'+ data[i].product_id +'" class="header-cart-item flex-w flex-t m-b-12" style="display:flex; justify-content: space-between;" >';
		            html += '   <div   style="display: flex;justify-content: center;">';
		            html += ' 		<input class="check1" type="checkbox" name ="checkbox" data-product_id="' + data[i].product_id + '" data-product_name="'+data[i].product_name+'" data-color_id="'+data[i].color_id+'" data-size_id="'+data[i].size_id+'" style="margin-right: 10px">';
		            html += '       <img style="width: 50px;" src="/resources/images/products/' + data[i].img + '" alt="IMG">';
		            html += '   </div>';
		            html += '   <div class="p-t-8" style="width: 200px">';
		            html += '       <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">';
		            html += '           ' + data[i].product_name;
		            html += '       </a>';
		            html += '       <span class="header-cart-item-info">';
		            html += 	 data[i].price + ' won';
		            html += '       </span>';
		            html += '       <span class="header-cart-item-info">';
		            html += '         size : ' + data[i].size_id + ', color : ' + data[i].color_id;
		            html += '       </span>';
		            html += '   </div>';
		            html += '</li>';
                	
              
		        }		
		    	
		        wish.html(html);
              
            },
            error: function () {
                console.error("AJAX request failed");
            }
        });
    });

    $('.js-hide-cart').on('click',function(){
        $('.js-panel-cart').removeClass('show-header-cart');
        location.reload();
    });
    
  
	$('.delete-btn').on('click',function(){
		var $button = $(this);
		
		// 중복 클릭 방지
	    if ($button.hasClass('processing')) {
	        return;
	    }
	    
	    // 버튼 비활성화
    	$button.addClass('processing');
		
		var selected = [];
		 $('input[type="checkbox"]:checked').each(function () {
                selected.push($(this).data('product_id'));
            });
		
		 console.log(selected);
		
		$.ajax({
			    url: "/wish/deleteWishList",
			    type: "DELETE",
			    contentType: "application/json",
			    data: JSON.stringify(selected),
			    success: function (data) {
			    
			    	  console.log("success delete");
			        for(var i = 0; i < selected.length; i++){
			        	var itemId = selected[i];
			        	$('#item-'+itemId).remove();
			        }
			    	 Swal.fire("Removed from wishList.", "", "success");
			      
			        	console.log($('#item-' + itemId));
			       	
			        	$.ajax({
						type : 'GET',
						url : '/wish/wishTotal',
						dataType : 'json',
						success : function(data) {
							// data-notify
							$('.data-noti-wish').attr("data-notify",data);
							
						},
						error: function () {
							console.log("AJAX request failed")
							Swal.fire("Please try again.", "", "error");
						}

					})
			    },
			    error: function (error) {
			        console.error("error", error);
			    },
			    complete: function () {
		            // 버튼 활성화
		            $button.removeClass('processing');
		        }
			});
	})
	
	$('.add-btn').on("click",function(){
		/*var jsonData = {
					"product":[
						{	
							"color_id":"red",
							"size_id":"s",
							"product_name":"pants"
						}
					],
					"count":1
					};*/
			var $button = $(this);
			
			if ($button.hasClass('processing')) {
		        return;
		    }
		    
		    $button.addClass('processing');
		    
			var jsonData =[];
		
		 $('input[type="checkbox"]:checked').each(function () {
                var product={
                	"product_name" : ($(this).data('product_name')),
                	"color_id" : ($(this).data('color_id')),
                	"size_id" : ($(this).data('size_id'))
                };
                var addProduct = {
			        "product": product,
			        "count": 1
			    };
                jsonData.push(addProduct);
               
            });
            
          console.log(jsonData);
          
          $.ajax({
			    url: "/wish/addCart",
			    type: "POST",
			    contentType: "application/json",
			    data: JSON.stringify(jsonData),
			    success: function (data) {
			        console.log("success addCart");
			       	console.log(jsonData)
			       	 Swal.fire("Added to cart.", "", "success");
			       	 
			       	 $button.removeClass('processing');
			       	$.ajax({
						type : 'GET',
						url : '/wish/cartTotal',
						dataType : 'json',
						success : function(data) {
							// data-notify
							$('.data-noti-cart').attr("data-notify",data);
							
						},
						error: function () {
							console.log("AJAX request failed")
						}

					})
			    },
			    error: function (error) {
			        console.error("error", error);
			        Swal.fire("Please try again.", "", "error");
			    }
			});
	})
})
