
	$('.js-addwish-b2').each(function() {
	var element = $(this);
	var nameProduct = $(this).parent().parent().find('.js-name-b2').html();

	 if (element.hasClass('js-addedwish-b2')) {
	 
         element.addClass('js-addedwish-b2');
    }
	
	$(this).on('click', function() {	

		var pId =element.data('product_id');
		var pName =element.data('product_name');
	
		Swal.fire({
			  title: "Do you want to save the WishLists?",
			  showDenyButton: true,
			  showCancelButton: true,
			  confirmButtonText: "Add",
			  denyButtonText: `Delete`
			}).then((result) => {
		        if (result.isConfirmed) {
		            $.ajax({
		                type: 'POST',
		                url: "/productDetail/postWish",
		                contentType: 'application/json',
		                data: JSON.stringify({ product_name: pName }),
		                success: function (response) {  
				            // 위시리스트에 아이템이 성공적으로 추가된 경우
				            Swal.fire("Added to your wishLists!", "", "success");
					     
					        element.addClass('js-addedwish-b2');
                   
		                },
		                error: function (xhr, status, error) {
		                	 console.error(xhr.responseText);  // 서버에서 보낸 에러 메시지 출력
		                    Swal.fire("This product has already been registered on WishList.", "", "error");
		                }
		            });
		        } else if (result.isDenied) {
		        	   
		            $.ajax({
		                type: 'DELETE',
		                url: '/productDetail/deleteWish',
		                contentType: 'application/json',
		                data: JSON.stringify({ product_id: pId}),
		                success: function (response) {
		                    Swal.fire("WishList에서 제거되었습니다.", "", "success");	
		                  
	                        element.removeClass('js-addedwish-b2');
	                        	
		                },
		                error: function (xhr, status, error) {
		                    Swal.fire("다시 시도하세요.", "", "error");
		                }
		            });
		        }
			});		
	});

})


