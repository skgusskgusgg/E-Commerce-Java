$(document).ready(function () {
(function ($) {
    "use strict";
    
    /*==================================================================
    [ Cart ]*/
   
	var cartSelectList = [];
	$('.shopping-cart-delete-btn').on("click",function(){
		cartSelectList = [];
		$('.table_row').each(function () {
		const cartSelectItem = new Map();
	    var isChecked = $(this).find('.cart-check .cart-checkbox').prop('checked');
		
	    if (isChecked) {
	        var cart_id = $(this).find('.shopping-cart-cart_id').val();
			cartSelectList.push(cart_id);
			}
		});
		if(cartSelectList.length !== 0){
			$.ajax({
		            url: '/cart/delete',
		            method: 'POST',
		            traditional: true,
			        data: {
			            "cartSelectList": cartSelectList,
			            "memberId": parseInt($('#memberId').val())
			        },
		            success: function(data, textStatus, xhr) {
				        var redirectUrl = xhr.getResponseHeader("Location");
				        console.log(redirectUrl);
				        if (redirectUrl) {
				            window.location.href = redirectUrl;
				        } else {
				            console.error("리다이렉션 Location 획득 실패");
				        }
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
			        console.error("에러 발생:", errorThrown);
			    	}
		   		});
	   	}else{
	   		Swal.fire("Please check the item to be deleted.", "", "error");
	   	}
	});
	/*==================================================================
    [ +/- num product ]*/
    $('.num-product-down-btn').on('click', function(){
        var numProduct = Number($(this).next().val());
        var findTableRow = $(this).parent().parent().parent();
        if(numProduct > 1){
        	var cartId = findTableRow.find('.shopping-cart-cart_id').val();
        	numProduct -= 1;
        	var itemPrice = parseInt(findTableRow.find('.item-price').text().replace(/,/g, ''));
        	var calcItemTotalPrice = numProduct * itemPrice;
        	findTableRow.find('.item-total-price').html(calcItemTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        	$(this).next().val(numProduct);
	        updateCount(numProduct,cartId);
        }
       
    });

    $('.num-product-up-btn').on('click', function(){
        var numProduct = Number($(this).prev().val());
        var findTableRow = $(this).parent().parent().parent();
        if(numProduct > 0){
        	var cartId = findTableRow.find('.shopping-cart-cart_id').val();
        	numProduct += 1;
        	var itemPrice = parseInt(findTableRow.find('.item-price').text().replace(/,/g, ''));
        	var calcItemTotalPrice = numProduct * itemPrice;
        	findTableRow.find('.item-total-price').html(calcItemTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        	$(this).prev().val(numProduct);
	        updateCount(numProduct,cartId);
	   		}
    });
    function updateCount(numProduct,cartId){
   			$.ajax({
		            url: '/cart/update',
		            method: 'POST',
			        data: {
			            "numProduct": numProduct,
			            "cart_id" : cartId
			        },
		            success: function(data, status, xhr) {
					    var redirectUrl = xhr.getResponseHeader("Location");
					    if (xhr.status === 404) {
					        window.location.href = redirectUrl;
					    }else{
					    	updateSubtotal(data);
					    	updateTotalPrice(data);
					    }
					},
					error: function(jqXHR, textStatus, errorThrown) {
					    console.error("에러 발생:", errorThrown);
					}
		   		});
   	}
    
    function updateSubtotal(data){
    	var subItemColumns = "";
		subItemColumns += "<span class='mtext-110 cl2'>";
		$(data).find('item').each((index, item) => {
					subItemColumns += "<span class='stext-110 cl2 cart-list-subtotal-content'>"
					subItemColumns += (parseInt(($(item).find("count").text()) * parseInt($(item).find("price").text(), ","))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					subItemColumns += "</span>";
		        });
		subItemColumns += "</span>";
		
	    $(".cart-sub-total-div").html(subItemColumns);
    }

    function updateTotalPrice(data) {
	    var addItemPrice = 0;
		$(data).find('item').each((index, item) => {
			addItemPrice += (parseInt($(item).find("count").text()) * parseInt($(item).find("price").text()));
		});
	    var subItemColumns = "<span class='mtext-110 cl2'>" + numRoundNComma(addItemPrice) + "</span>";

	
	    $(".cart-total-price-div").html(subItemColumns);
	}
	
	function numRoundNComma(number) {
    	number = Math.floor(number);
    	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
})(jQuery);
});