
	$('.js-addwish-b2').each(function() {
	var element = $(this);
	var nameProduct = $(this).parent().parent().find('.js-name-b2').html();

	 if (element.hasClass('js-addedwish-b2')) {
	 
         element.addClass('js-addedwish-b2');
    }
	
	$(this).on('click', function() {	

		var pId =element.data('product_id');
		var pName =element.data('product_name');
	
		
		        	   
		            $.ajax({
		                type: 'DELETE',
		                url: '/productDetail/deleteWish',
		                contentType: 'application/json',
		                data: JSON.stringify({ product_id: pId}),
		                success: function (response) {
		                    	Swal.fire({
			  					  position: "center",
			  					  icon: "success",
			  					  title: "Remove Product!",
			  					  showConfirmButton: false,
			  					  timer: 1500
			  					});     
		                  	
	                        element.removeClass('js-addedwish-b2');
	                        	$.ajax({
								type : 'GET',
								url : '/wish/wishTotal',
								dataType : 'json',
								success : function(data) {
									 
									$('.data-noti-wish').attr("data-notify",data);
									
								},
								error: function () {
									console.log("AJAX request failed")
								}
		
							})
	                        	
		                },
		                error: function (xhr, status, error) {
		                    Swal.fire("Please try again.", "", "error");
		                }
		        
		
	})
})
})

