var daterangestartdate;
var daterangeenddate;
(function ($) {
	"use strict";
	
	// ______________ PAGE LOADING
	$(window).on("load", function(e) {
		$("#global-loader").fadeOut("slow");
	})
	
	// ______________ BACK TO TOP BUTTON
	$(window).on("scroll", function(e) {
		if ($(this).scrollTop() > 0) {
			$('#back-to-top').fadeIn('slow');
		} else {
			$('#back-to-top').fadeOut('slow');
		}
	});
	$(document).on("click", "#back-to-top", function(e) {
		$("html, body").animate({
			scrollTop: 0
		}, 600);
		return false;
	});
	
	
	const DIV_CARD = 'div.card';
	// ______________Tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// ______________Popover
	$('[data-toggle="popover"]').popover({
		html: true
	});
	
	// ______________Remove Card
	$(document).on('click', '[data-toggle="card-remove"]', function(e) {
		let $card = $(this).closest(DIV_CARD);
		$card.remove();
		e.preventDefault();
		return false;
	});
	
	// ______________Card Collapse
	$(document).on('click', '[data-toggle="card-collapse"]', function(e) {
		let $card = $(this).closest(DIV_CARD);
		$card.toggleClass('card-collapsed');
		e.preventDefault();
		return false;
	});
	
	// ______________Card Fullscreen
	$(document).on('click', '[data-toggle="card-fullscreen"]', function(e) {
		let $card = $(this).closest(DIV_CARD);
		$card.toggleClass('card-fullscreen').removeClass('card-collapsed');
		e.preventDefault();
		return false;
	});
	
	// ______________Chart-circle
	if ($('.chart-circle').length) {
		$('.chart-circle').each(function() {
			let $this = $(this);
			$this.circleProgress({
				fill: {
					color: $this.attr('data-color')
				},
				size: $this.height(),
				startAngle: -Math.PI / 4 * 2,
				emptyFill: '#f9f9f9',
				lineCap: 'round'
			});
		});
	}
	
	/*----GlobalSearch----*/
	$(document).on("click", "[data-toggle='search']", function(e) {
		var body = $("body");

		if(body.hasClass('search-gone')) {
			body.addClass('search-gone');
			body.removeClass('search-show');
		}else{
			body.removeClass('search-gone');
			body.addClass('search-show');
		}
	});
	var toggleSidebar = function() {
		var w = $(window);
		if(w.outerWidth() <= 1920) {
			$("body").addClass("sidebar-gone");
			$(document).off("click", "body").on("click", "body", function(e) {
				if($(e.target).hasClass('sidebar-show') || $(e.target).hasClass('search-show')) {
					$("body").removeClass("sidebar-show");
					$("body").addClass("sidebar-gone");
					$("body").removeClass("search-show");
				}
			});
		}else{
			$("body").removeClass("sidebar-gone");
		}
	}
	toggleSidebar();
	$(window).resize(toggleSidebar);
	
	
	try {
		//Date range as a button
		$('#daterange-btn').daterangepicker({
			ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			},
			startDate: moment().subtract(29, 'days'),
			endDate: moment(),
			locale: {
				format: 'DD/MM/YYYY'
			}
		}, function (start, end) {
			$('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
		})
	} catch (e) { }

	try {
		//Date range as a button
		$('.fc-daterange').daterangepicker({
			ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			},
			startDate: moment().subtract(29, 'days'),
			endDate: moment(),
			locale: {
				format: 'DD/MM/YYYY'
			}
		}, function (start, end) {
			daterangestartdate = start;
			daterangeenddate = end;
		})
	} catch (e) { }
	
	// ______________Active Class
	/*$(".app-sidebar #parentVerticalTab a").each(function() {
		var pageUrl = window.location.href.split(/[?#]/)[0];
		if (this.href == pageUrl) {
			$(this).addClass("active");
			$(this).parent().parent().parent().addClass("active"); // add active to li of the current link
			$(this).parent().parent().prev().addClass("active"); // add active class to an anchor
			$(this).parent().parent().prev().click(); // click the item to make it drop
		}
	});*/
	
	
	// ______________ body-horizontal-left-icon
	$('.horizontal-left-icon').click(function () {      /* box Switch*/
		$('body').removeClass('body-horizontal-right-icon');
		$('body').addClass('body-horizontal-left-icon');
	});
	
	
	// ______________ body-horizontal-right-icon
	$('.horizontal-right-icon').click(function () {    
		$('body').addClass('body-horizontal-right-icon');
		$('body').removeClass('body-horizontal-left-icon');
	});
	
	
	// ______________Horizontal-menu
	$("a[data-theme]").click(function() {
		$("head link#theme").attr("href", $(this).data("theme"));
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	$("a[data-font]").click(function() {
		$("head link#font").attr("href", $(this).data("font"));
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	$("a[data-effect]").on("click", function(e) {
		$("head link#effect").attr("href", $(this).data("effect"));
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	
	// ______________Headerfixed
	$(window).on("scroll", function(e){
		if ($(window).scrollTop() >= 66) {
			$('.header').addClass('fixed-header');
		}
		else {
			$('.header').removeClass('fixed-header');
		}
    });
	
	// ______________Cover Image
	$(".cover-image").each(function() {
		var attr = $(this).attr('data-image-src');
		if (typeof attr !== typeof undefined && attr !== false) {
			$(this).css('background', 'url(' + attr + ') center center');
		}
	});
	
	// ______________Ms Menu Trigger
	$(function() {
		if ($('#ms-menu-trigger')[0]) {
			$('body').on('click', '#ms-menu-trigger', function() {
				$('.ms-menu').toggleClass('toggled');
			});
		}
	});
	
	// ______________VerticalTab
	$('#parentVerticalTab').easyResponsiveTabs({
		type: 'vertical',
		width: 'auto', 
		fit: true, 
		closed: 'accordion',
		tabidentify: 'hor_1',
		activate: function(event) {
			var $tab = $(this);
			var $info = $('#nested-tabInfo2');
			var $name = $('span', $info);
			$name.text($tab.text());
			$info.show();
		}
	});
	// ______________Full Screen
	$(document).on("click", "#fullscreen-button", function toggleFullScreen() {
		$('html').addClass('fullscreenie');
		if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
			if (document.documentElement.requestFullScreen) {
				document.documentElement.requestFullScreen();
			} else if (document.documentElement.mozRequestFullScreen) {
				document.documentElement.mozRequestFullScreen();
			} else if (document.documentElement.webkitRequestFullScreen) {
				document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
			} else if (document.documentElement.msRequestFullscreen) {
				document.documentElement.msRequestFullscreen();
			}
		} else {
			$('html').removeClass('fullscreenie');
			if (document.cancelFullScreen) {
				document.cancelFullScreen();
			} else if (document.mozCancelFullScreen) {
				document.mozCancelFullScreen();
			} else if (document.webkitCancelFullScreen) {
				document.webkitCancelFullScreen();
			} else if (document.msExitFullscreen) {
				document.msExitFullscreen();
			}
		}
	})
	
	
	// ______________ SWITCHER
	
	// $('body').addClass('light-mode);
	
	// ______________ SWITCHER01
	
	// $('body').addClass('dark-mode);
	
	
	// ______________ SWITCHER1
	
	// $('body').addClass('left-menu-dark');
	
	// ______________ SWITCHER2

	// $('body').addClass('left-menu-light');
	
	// ______________ SWITCHER3

	// $('body').addClass('boxed');
	
	// ______________ SWITCHER4
	
	// $('body').addClass('horizontal-menudark');
			
	// ______________ SWITCHER5
	
	// $('body').addClass('cardcolor-light');
			
	
	// ______________ SWITCHER6

	// $('body').addClass('body-background');
	
	// ______________ SWITCHER7

	// $('body').addClass('body-card-shadow');
				
	// ______________ SWITCHER8

	// $('body').addClass('container-fullwidth');
	
})(jQuery);

$(function (e) {
	$(".btn-save").on("click", function () {
		saveItem();
	});

	$(".btn-add-new").on("click", function () {
		addClick();
	});

	$(".btn-back").on("click", function () {
		$('.dv-detail').slideUp();
		$('.dv-list').slideDown();
	});

	//$(".btn-edit").on("click", function () {
	//    editMode(parseInt($(this).attr("data-value")));
	//});

	//$(".btn-disableview").on("click", function () {
	//    viewMode(parseInt($(this).attr("data-value")));
	//});

	//$(".btn-delete").on("click", function () {
	//    deleteItemConfirmation(parseInt($(this).attr("data-value")));
	//});

	$(".btn-underdevelopment").on("click", function () {
		showInfo("", "Under Development");
	});

	$(".go-search").on("click", function () {
		goSearch($('#GoSearchQuery').val());
	});

	// $(".decimalonly").blur(function () {
	//     var fixedNo = (isNaN(parseInt($(this).attr("data-tofixed"))) ? 0 : parseInt($(this).attr("data-tofixed")));
	//     var value = (isNaN(parseFloat($(this).val())) ? 0.00 : parseFloat($(this).val()).toFixed(fixedNo));
	//     $(this).val(value);
	// });

	applyDecimal();

});

function applyDecimal() {
	$(".decimalonly").on("input", function (evt) {
		var self = $(this);
		self.val(self.val().replace(/[^0-9.]/g, ''));
		if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
			evt.preventDefault();
		}
	});

	$(".decimalonly").blur(function () {
		if ($(this).val() == '' && $(this).attr("data-allowblank") == 'true')
			return;
		// Get the desired number of decimal places from the data-tofixed attribute
		var fixedNo = isNaN(parseInt($(this).attr("data-tofixed"))) ? 0 : parseInt($(this).attr("data-tofixed"));

		// Get the current value and remove any leading zeros before the decimal point
		var currentValue = $(this).val().replace(/^0+(?=\d)/, '');

		// If the input is empty or starts with a ".", add a "0" before it
		if (currentValue === '' || currentValue === '.') {
			currentValue = '0' + currentValue;
		}

		// Validate and format the input value
		var value = isNaN(parseFloat(currentValue)) ? '0.00' : parseFloat(currentValue).toFixed(fixedNo);

		// Update the input value
		$(this).val(value);
	});
}
function setCookie(name, value) {
	document.cookie = `${name}=${value}; path=/`;
}

function getCookie(name) {
	const cookieArray = document.cookie.split(';');
	for (let i = 0; i < cookieArray.length; i++) {
		const cookiePair = cookieArray[i].split('=');
		if (cookiePair[0].trim() === name) {
			return decodeURIComponent(cookiePair[1]);
		}
	}
	return null;
}