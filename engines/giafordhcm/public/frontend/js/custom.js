$(function() {
    // Get the form.
    var form = $('#ajax-contact-form');

    // Get the messages div.
    var formMessages = $('.form-notice');

    // Set up an event listener for the contact form.
	$(form).submit(function(event) {
		event.preventDefault(); // Stop the browser from submitting the form (prevent default action).
		var post_url = $(this).attr("action"); //get form action url
		var request_method = $(this).attr("method"); //get form GET/POST method
		var form_data = $(this).serialize(); //Encode form elements for submission
		
		$.ajax({
			url : post_url,
			type: request_method,
			data : form_data
		}).done(function(data){ //
			if (data.status == 'success') {
				if ($(formMessages).hasClass("error")) {
					$(formMessages).removeClass('error');
					$(formMessages).addClass('success');
				}
				
				$('form input, form textarea').val(''); // Clear the form.
                $("form select").val('default');
                $("form select").selectpicker("refresh");
                
				$(formMessages).html(
					'<div class="alert alert-success fade in alert-dismissible">' +
						'<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">&times;</a>' +
						data.notice +
					'</div>'
				);
			} else if (data.status == 'error') {
				if ($(formMessages).hasClass("success")) {
					$(formMessages).removeClass('success');
					$(formMessages).addClass('error');
				}
				$(formMessages).html(
					'<div class="alert alert-danger fade in alert-dismissible">' +
						'<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">&times;</a>' +
						data.notice +
					'</div>'
				);
			}
		});
	});
    
    //function showPopupAds()
    //{
    //    if(typeof($.cookie("ads_showed")) === 'undefined') {
    //        var date = new Date();
    //        var minutes = 60;
    //        date.setTime(date.getTime() + (minutes * 60 * 1000));
    //        $.cookie("ads_showed", true, { expires: date });
    //        
    //        $('#popup-ads').modal('show'); // Show popup
    //    }
    //}
    //
    //function callerPopupAds()
    //{
    //    setTimeout(showPopupAds, 10000);
    //}
    //
    //callerPopupAds();
});

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
        top = (window_top - box_top_init - 15) + 'px';
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

if ($('.contact-info-boxes').length > 0) {
    var box_top_init = $('.contact-info-boxes').offset().top;
    var dis = 160;
    $(window).scroll(function() {
        fixBox();
    });
    
    $(window).ready(function() {
        setTimeout(function() {fixBox();fixBox();}, 10);
    });
}

$(document).ready(function() {    
    // Apply js first load
    applyJs($('body'));
});