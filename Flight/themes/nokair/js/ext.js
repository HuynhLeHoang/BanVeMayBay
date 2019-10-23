function valid_total_pax(main_selector, sub_selector, depen_selector, max){
    var main_range, sub_range, dep_range;
    var main_value, sub_value, dep_value;
    main_range = parseInt($(main_selector).val());
    sub_range = max-main_range;
    dep_range = main_range;
    
    $(sub_selector).empty();
    for(var i = 0; i<=sub_range; i++){
        $(sub_selector).append($('<option>'+i+'</option>').val(i));
        $.uniform.update(sub_selector);
    }
    $(depen_selector).empty();
    for(var i = 0; i<=main_range; i++){
        $(depen_selector).append($('<option>'+i+'</option>').val(i));
        $.uniform.update(depen_selector);
    }
}

$(window).scroll(function () {
	if($('#detail-holder').length){
        var distance = ($('#detail-holder').offset().top - $(window).scrollTop());					
        if(distance < 0){
            if(! $('#detail-holder').hasClass('fly')){
                $('#detail-holder').addClass('fly');
                $('#detail-holder').width("213px");
            }
        }
    } 
    if($('.flight-info, .customer-information, .search-result').length){
        if(($('.flight-info, .customer-information, .search-result').eq(0).offset().top - $(window).scrollTop())>=0){
            $('#detail-holder').removeClass('fly');
            $('#detail-holder').width("213px");
        }
    }


});

$(document).ready(function(){
    if($('.book-form-passengers').length){
        $('.book-form-passengers').uniform();
    }
    

});



$('#adultNo').change(function(){
    valid_total_pax('#adultNo', '#childNo', '#infantNo', 9);
});