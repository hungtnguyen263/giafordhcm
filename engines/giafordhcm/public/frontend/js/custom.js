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

function fixBox() {
    var box_top = $('.contact-info-boxes').offset().top;
    var window_top = $('body, html').scrollTop() + dis;
    
    var top;
    var bottom = '';
    
    if (window_top > box_top_init) {
        top = (window_top - box_top_init) + 'px';
        // $('.contact-info-boxes').css('top', (window_top - box_top_init) + 'px');
    } else {
        top = '60px';
        // $('.contact-info-boxes').css('top', '60px');
    }
    
    var ftop = $('footer').offset().top;
    var bbottom = $('.contact-info-boxes').offset().top + $('.contact-info-boxes').outerHeight();
    
    //console.log(ftop - window_top);
    
    if (ftop <= (bbottom + 50) && ftop - window_top < 550) {
        top = '';
        bottom = '20px';
    }
    
    $('.contact-info-boxes').css('top', top);
    $('.contact-info-boxes').css('bottom', bottom);
}

var box_top_init = $('.contact-info-boxes').offset().top;
var dis = 160;
$(window).scroll(function() {
    fixBox();
});

$(window).ready(function() {
    setTimeout(function() {fixBox();fixBox();}, 10);
});