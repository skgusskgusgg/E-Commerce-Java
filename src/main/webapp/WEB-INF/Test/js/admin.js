
(function ($) {
    "use strict";

    /*==================================================================
    [ ADMIN Menu ]*/
    
	var arrowMainMenu = $('.arrow-turn-admin-menu');
	
	arrowMainMenu.on('click', function(){
        $('.div-left-1').toggleClass('hide-admin-menu');
        $('.div-left-1').toggleClass('w-15per');
        $('.div-left-1').toggleClass('w-0per');
        $('.div-right-1').toggleClass('w-85per');
        $('.div-right-1').toggleClass('w-100per');
    });
	
    var arrowMainMenu = $('.admin-main-menu');
	
	arrowMainMenu.on('click', function(){
        var subMenu = $(this).find('.admin-sub-menu');
        subMenu.slideToggle();
        /*
        arrowMainMenu.not($(this)).find('.admin-sub-menu').slideUp();
        arrowMainMenu.not($(this)).removeClass('turn-arrow-admin-menu-bar-main');
        */
        $(this).toggleClass('turn-arrow-admin-menu-bar-main');
    });
	
})(jQuery);