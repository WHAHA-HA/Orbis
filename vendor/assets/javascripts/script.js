(function($) {
	
	'use strict';
	
	var Appro = {
		
		// Initialization the functions
		init: function() {
			var navHeight = 71;
			
			Appro.Preloader();
			Appro.AffixMenu(navHeight);
			Appro.ScrollSpy(navHeight);
			Appro.SmoothScroll(navHeight);
			Appro.FitVids();
			Appro.PlaceHolder();
			Appro.Carousel();
			Appro.Lightbox();
			Appro.CounterUp();
			Appro.Parallax();
			//Appro.Form();
		},
		
		// Page loading process
		Preloader: function() {
			$(window).load(function() {
				$('#preloader .spinner').delay(100).fadeOut(300, function() {
					$('.stickem-container, #header').animate({
						opacity: 1
					}, 300);
					$(this).parent().delay(300).fadeOut(500, function() {
						Appro.Animated();
					});
				});
			});
		},
		
		// Navigation menu affix
		AffixMenu: function(navHeight) {
			$('.stickem-container').stickem({
				offset: navHeight
			});
		},
		
		// Navigation menu scrollspy to anchor section
		ScrollSpy: function(navHeight) {
			$('body').scrollspy({
				target: '#navigation.scrollspy',
				offset: navHeight
			});
		},
		
		// Smooth scrolling to anchor section
		SmoothScroll: function(navHeight) {
			$('a.smooth-scroll').on('click', function(event) {
				var $anchor		= $(this);
				var offsetTop	= '';
				
				if (window.Response.band(768)) {
					offsetTop = parseInt($($anchor.attr('href')).offset().top - navHeight, 0);
				} else {
					offsetTop = parseInt($($anchor.attr('href')).offset().top, 0);
				}
				
				$('html, body').stop().animate({
					scrollTop: offsetTop
				}, 1500,'easeInOutExpo');
				
				event.preventDefault();
			});
		},
		
		// Responsive video size
		FitVids: function() {
			$('body').fitVids();
		},
		
		// Placeholder compatibility for IE8
		PlaceHolder: function() {
			$('input, textarea').placeholder();
		},
		
		// Slider with Slick carousel
		Carousel: function() {
			// Teams carousel
			$('.carousel-slider.affa-team-row').each(function() {
				$(this).slick({
					slidesToShow: 3,
					infinite: false,
					speed: 300,
					draggable: false,
					responsive: [
						{
							breakpoint: 1440,
							settings: {
								slidesToShow: 2
							}
						},
						{
							breakpoint: 992,
							settings: {
								slidesToShow: 1
							}
						},
						{
							breakpoint: 768,
							settings: {
								slidesToShow: 3,
								draggable: true
							}
						},
						{
							breakpoint: 540,
							settings: {
								slidesToShow: 2
							}
						},
						{
							breakpoint: 340,
							settings: {
								slidesToShow: 1
							}
						}
					]
				});
			});
			
			// Testimonials carousel
			$('.carousel-slider.affa-testimonials-carousel').each(function() {
				$(this).slick({
					arrows: false,
					dots: true,
					fade: true,
					cssEase: 'linear',
					speed: 300,
					draggable: false,
					responsive: [{
						breakpoint: 768,
						settings: {
							draggable: true
						}
					}]
				});
			});
			
			// Gallery slider
			$('.carousel-slider.gallery-slider').each(function() {
				$(this).slick({
					arrows: false,
					dots: true,
					slidesToShow: 7,
					slidesToScroll: 2,
					speed: 300,
					draggable: false,
					responsive: [
						{
							breakpoint: 1200,
							settings: {
								slidesToShow: 5
							}
						},
						{
							breakpoint: 992,
							settings: {
								slidesToShow: 3
							}
						},
						{
							breakpoint: 768,
							settings: {
								slidesToShow: 2,
								draggable: true
							}
						},
						{
							breakpoint: 400,
							settings: {
								arrows: true,
								dots: false,
								slidesToShow: 1,
								slidesToScroll: 1
							}
						}
					]
				});
			});
			
			// General slider
			$('.carousel-slider.general-slider').each(function() {
				$(this).slick({
					dots: true,
					speed: 300,
					adaptiveHeight: true,
					draggable: false,
					responsive: [{
						breakpoint: 768,
						settings: {
							draggable: true
						}
					}]
				});
			}).on('afterChange', function() {
				$(window).trigger('resize.px.parallax');
			});
		},
		
		// Preview images popup gallery with Fancybox
		Lightbox: function() {
			$('.fancybox').fancybox({
				loop: false
			});
			
			$('.fancybox-media').attr('rel', 'media-gallery').fancybox({
				openEffect: 'none',
				closeEffect: 'none',
				prevEffect: 'none',
				nextEffect: 'none',
				arrows: false,
				helpers: {
					media: {},
					buttons : {}
				}
			});
		},
		
		// Number counter ticker animation
		CounterUp: function() {
			$('.affa-counter-text > h4 > span').counterUp({
				delay: 10,
				time: 3000
			});
		},
		
		// Background with parallax effect
		Parallax: function() {
			$(window).resize(function() {
				setTimeout(function() {
					$(window).trigger('resize.px.parallax');
				}, 100);
			});
			
			$('#navigation .navbar-toggle').on('click', function() {
				setTimeout(function() {
					$(window).trigger('resize.px.parallax');
				}, 300);
			});
		},
		
		// Form submit function
		Form: function() {
			var pattern = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i;
			
			// Checking form input when focus and keypress event
			$('.affa-form-contact input[type="text"], .affa-form-contact input[type="email"], .affa-form-contact textarea').on('focus keypress', function() {
				var $input = $(this);
				
				if ($input.hasClass('error')) {
					$input.removeClass('error');
				}
			});
			
			// Contact form when submit button clicked
			$('.affa-form-contact').submit(function() {
				var $form		= $(this);
				var submitData	= $form.serialize();
				var $name		= $form.find('input[name="name"]');
				var $email		= $form.find('input[name="email"]');
				var $subject	= $form.find('input[name="subject"]');
				var $message	= $form.find('textarea[name="message"]');
				var $submit		= $form.find('input[name="submit"]');
				var status		= true;
				
				if ($email.val() === '' || pattern.test($email.val()) === false) {
					$email.addClass('error');
					status = false;
				}
				if ($message.val() === '') {
					$message.addClass('error');
					status = false;
				}
				
				if (status) {
					$name.attr('disabled', 'disabled');
					$email.attr('disabled', 'disabled');
					$subject.attr('disabled', 'disabled');
					$message.attr('disabled', 'disabled');
					$submit.attr('disabled', 'disabled');
					
					$.ajax({
						type: 'POST',
						url: 'process-contact.php',
						data: submitData + '&action=add',
						dataType: 'html',
						success: function(msg) {
							if (parseInt(msg, 0) !== 0) {
								var msg_split = msg.split('|');
								if (msg_split[0] === 'success') {
									$name.val('').removeAttr('disabled').removeClass('error');
									$email.val('').removeAttr('disabled').removeClass('error');
									$subject.val('').removeAttr('disabled').removeClass('error');
									$message.val('').removeAttr('disabled').removeClass('error');
									$submit.removeAttr('disabled');
									$form.find('.submit-status').html('<div class="submit-status-text"><span class="success"><i class="ion ion-ios-checkmark-outline"></i> ' + msg_split[1] + '</span></div>').fadeIn(300).delay(3000).fadeOut(300);
								} else {
									$name.removeAttr('disabled').removeClass('error');
									$email.removeAttr('disabled').removeClass('error');
									$subject.removeAttr('disabled').removeClass('error');
									$message.removeAttr('disabled').removeClass('error');
									$submit.removeAttr('disabled').removeClass('error');
									$form.find('.submit-status').html('<div class="submit-status-text"><span class="error"><i class="ion ion-ios-close-outline"></i> ' + msg_split[1] + '</span></div>').fadeIn(300).delay(3000).fadeOut(300);
								}
							}
						}
					});
				}
				
				status = true;
				
				return false;
			});
		},
		
		// Embed animation effects to HTML elements with CSS3
		Animated: function() {
			$('.animation, .animation-visible').each(function() {
				var $element = $(this);
				$element.waypoint(function() {
					var delay = 0;
					if ($element.attr('data-delay')) delay = parseInt($element.attr('data-delay'), 0);
					if (!$element.hasClass('animated')) {
						setTimeout(function() {
							$element.addClass('animated ' + $element.attr('data-animation'));
						}, delay);
					}
					delay = 0;
				}, {
					offset: '85%'
				});
			});
		}
		
	};
	
	// Run the main function
	$(function() {
		Appro.init();
	});
	
})(window.jQuery);
