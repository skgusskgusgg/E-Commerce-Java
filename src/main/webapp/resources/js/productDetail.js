 $(document).ready(function(){
    var modalImgList = $(".modalImgList");
    var productPrice = $(".productPrice");
    var productName = $(".productName");
    var sizeSelect = $(".js-select2.size_id");
    var colorSelect = $(".js-select2.color_id");

    $('.js-show-modal1').on('click', function(e){	 
        e.preventDefault();
        
        var aId = $(".js-addwish-b2");
        
        var product_id = $(this).data('product_id');
        
        modalImgList.empty();
        	
        $.ajax({
            url: "/productDetail/productDetailModal/" + product_id,
            type: "GET",
            dataType: "json",
            success: function (data) {      
            	 console.log("Ajax success:", data);  	
                var html = "";		
                html += '    <div class="item-slick3"';
                html += '    data-thumb="/resources/images/product-detail-01.jpg">';
                html += '        <div class="wrap-pic-w pos-relative">';
                html += '            <img src="/resources/images/products/' + data.productDetail.img + '" alt="IMG-PRODUCT">';
                html += '                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"';
                html += '                href="/resources/images/products/' + data.productDetail.img + '"> <i';
                html += '                class="fa fa-expand"></i>';
                html += '                </a>';
                html += '        </div>';
                html += '    </div>';
                
                modalImgList.html(html);
                
                productName.html(data.productDetail.product_name);
                
                aId.data("product_id", data.productDetail.product_id);
                aId.data("product_name", data.productDetail.product_name);
        
                $("input[data-product_id]").val(data.productDetail.product_id);
                $("input[data-product_name]").val(data.productDetail.product_name);
                
                $("button[data-product_name]").val(data.productDetail.product_name);
                
                $("input[data-product_id]").attr("data-product_id",data.productDetail.product_id)
                $("input[data-product_name]").attr("data-product_name",data.productDetail.product_name)
                $("button[data-product_name]").attr("data-product_name",data.productDetail.product_name)
                var price = data.productDetail.price;
                var formattedPrice = price.toLocaleString();
                
                productPrice.html(formattedPrice + " won");
                
                $('.js-modal1').addClass('show-modal1');        
                
                var sizeSelector = "";
                for (var i = 0; i < data.sizeTotal.length; i++) {
                    sizeSelector += '<option value="' + data.sizeTotal[i] + '">Size ' + data.sizeTotal[i] + '</option>';
                }
               sizeSelect.append(sizeSelector);
               
                var colorSelector = "";
                for (var i = 0; i < data.colorTotal.length; i++) {
                    colorSelector += '<option value="' + data.colorTotal[i] + '">Color ' + data.colorTotal[i] + '</option>';
                }
               colorSelect.append(colorSelector);
               
            },
            error: function(xhr, status, error){
                 console.error("Ajax error:", status, error);
            }
        });

    });
});
