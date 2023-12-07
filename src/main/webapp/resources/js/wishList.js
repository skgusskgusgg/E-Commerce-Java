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
		            html += '<li class="header-cart-item flex-w flex-t m-b-12" style="display:flex; justify-content: space-between;" >';
		            html += '   <div   style="display: flex;justify-content: center;">';
		            html += ' 		<input type="checkbox" name="' + data[i].name + '" style="margin-right: 10px">';
		            html += '       <img src="' + data[i].imagePath + '" alt="IMG">';
		            html += '   </div>';
		            html += '   <div class="p-t-8" style="width: 200px">';
		            html += '       <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">';
		            html += '           ' + data[i].name;
		            html += '       </a>';
		            html += '       <span class="header-cart-item-info">';
		            html += '           1 x ' + data[i].price;
		            html += '       </span>';
		            html += '   </div>';
		            html += '</li>';
		        }		
		        wish.html(html);
                // 모달을 보여줌

                console.log(data);
            },
            error: function () {
                console.error("AJAX request failed");
            }
        });
    });

    $('.js-hide-cart').on('click',function(){
        $('.js-panel-cart').removeClass('show-header-cart');
    });
})