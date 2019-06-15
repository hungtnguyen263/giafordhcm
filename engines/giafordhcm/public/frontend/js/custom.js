function uniqueId() {
    return 'id-xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

function applyJs(container) {
    //container.find('.select2').select2();
    
    if (container.find('.select2').length > 0) {

        $('.select2').selectpicker({
          style: 'ui-select',
          styleBase: '',
          size: "auto",
          "data-live-search": "true"
        });
    }
}

var box_top_init = $('.contact-info-boxes').offset().top;
var dis = 160;
$(window).scroll(function() {
    var box_top = $('.contact-info-boxes').offset().top;
    var window_top = $('body, html').scrollTop() + dis;
    
    if (window_top > box_top_init) {
        $('.contact-info-boxes').css('top', (window_top - box_top_init) + 'px');
    } else {
        $('.contact-info-boxes').css('top', '60px');
    }
});