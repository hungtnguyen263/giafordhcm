
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
    
    var dang_ky_modal = new giafordhcmModal({size: 'md'});
    var dang_ky_callback;
    
    $('.dang-ky-button').click(function(e) {
        e.preventDefault();
        var button = $(this);
        
        dang_ky_modal.load(button.attr('href'));
        
        dang_ky_callback = function(response) {
            console.log(response.status);
            console.log(response.redirect);
            if (typeof(response.status) !== 'undefined') {
                //showNotification(response.status, response.message);
                dang_ky_modal.hide();
                location.reload();
                alert("Cảm ơn Quý vị đã gửi yêu cầu. Chúng tôi sẽ sớm liên hệ lại với Quý vị.");
            } else if (typeof(response.redirect) !== 'undefined') {
                window.location = response.redirect;
                alert("Cảm ơn Quý vị đã gửi yêu cầu. Chúng tôi sẽ sớm liên hệ lại với Quý vị.");
            } else {
                // validation error
                dang_ky_modal.renderHtml(response);
                alert("Yêu cầu chưa được gửi. Vui lòng cung cấp đầy đủ thông tin và thử lại.");
            }
        };
    });
    
    function showFormBaoGia()
    {
        //if(typeof($.cookie("baogia_showed")) === 'undefined') {
        //    var date = new Date();
        //    var minutes = 0.5;
        //    date.setTime(date.getTime() + (minutes * 60 * 1000));
        //    $.cookie("baogia_showed", true, { expires: date });
        //    
        //    $('.dang-ky-button').click();
        //}
        $('.dang-ky-button').click();
    }
    
    setTimeout(
        function() {
            showFormBaoGia();
        },
        10000
    );
    
    //$(document).on('click', '.close-bao-gia', function() {
    $(document).on('hidden.bs.modal', function () {
        setTimeout(function(){
            showFormBaoGia();
        }, 40000);
    });
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

// Banner slider
(function ($) {
    //Function to animate slider captions
    function doAnimations(elems) {
        //Cache the animationend event in a variable
        var animEndEv = 'webkitAnimationEnd animationend';
        elems.each(function () {
            var $this = $(this),
                $animationType = $this.data('animation');
            $this.addClass($animationType).one(animEndEv, function () {
                $this.removeClass($animationType);
            });
        });
    }

    //Variables on page load
    var $myCarousel = $('#carousel-example-generic')
    var $firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");
    //Initialize carousel
    $myCarousel.carousel();

    //Animate captions in first slide on page load
    doAnimations($firstAnimatingElems);
    //Pause carousel
    $myCarousel.carousel('pause');
    //Other slides to be animated on carousel slide event
    $myCarousel.on('slide.bs.carousel', function (e) {
        var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
        doAnimations($animatingElems);
    });
    $('#carousel-example-generic').carousel({
        interval: 3000,
        pause: "false"
    });
})(jQuery);