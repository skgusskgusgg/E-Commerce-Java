(function ($) {
    "use strict";

    /*==================================================================
    [ Search ]*/
    
    /*
    [ Show / hide modal search ]*/
    $('.show-search-modal').on('click', function(){
        $('.search-modal-header').addClass('show-search-modal');
        $(this).css('opacity','0');
    });

    $('.hide-search-modal').on('click', function(){
    	$("#searchResultsContainer").empty();
        $('.search-modal-header').removeClass('show-search-modal');
        $('.show-search-modal').css('opacity','1');
    });

    $('.search-grid-container').on('click', function(e){
        e.stopPropagation();
    });
    


})(jQuery);