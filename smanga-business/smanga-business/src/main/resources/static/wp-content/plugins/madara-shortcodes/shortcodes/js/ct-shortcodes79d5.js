(function ($) {
	'use strict';
	/**
	 * Progress Bar Init
	 */

	//Testimonials
	var check_rtl = (jQuery("body").css('direction') === "rtl");

	jQuery('.c-testimonials').each(function () {
		var $this = jQuery(this);
		$this.imagesLoaded(function () {

			var testimonialsId = $this.attr('data-id');
			var dataBullets = $this.attr('data-bullets');
			var dataAutoplay = $this.attr('data-autoplay');
			var dataArrows = $this.attr('data-arrows');
			var dataStyle = $this.attr('data-style');
			var bm_slidesToShow = $this.attr('data-item-per-row');
			var breakpoint_1024_slidesToShow = 3;
			var breakpoint_768_slidesToShow = 2;
			var breakpoint_480_slidesToShow = 1;

			dataBullets = parseInt(dataBullets);
			dataAutoplay = parseInt(dataAutoplay);
			dataAutoplay = parseInt(dataAutoplay);
			bm_slidesToShow = parseInt(bm_slidesToShow);

			if (dataStyle != '1') {
				bm_slidesToShow = 1;
				breakpoint_1024_slidesToShow = 1;
				breakpoint_768_slidesToShow = 1;
				breakpoint_480_slidesToShow = 1;
			} else {
				if (bm_slidesToShow == 1) {
					breakpoint_1024_slidesToShow = 1;
					breakpoint_768_slidesToShow = 1;
					breakpoint_480_slidesToShow = 1;
				} else if (bm_slidesToShow == 2) {
					breakpoint_1024_slidesToShow = 2;
					breakpoint_768_slidesToShow = 2;
					breakpoint_480_slidesToShow = 1;
				} else {
					breakpoint_1024_slidesToShow = 1;
					breakpoint_768_slidesToShow = 1;
					breakpoint_480_slidesToShow = 1;
				}
			}


			var testimonialsInit = '#' + testimonialsId + ' ' + '.block-group';

			jQuery(testimonialsInit).slick({

				lazyLoad: 'ondemand',
				fade: bm_slidesToShow == 1 ? true : false,
				cssEase: 'ease-out',
				dots: dataBullets == 1 ? true : false,
				autoplay: dataAutoplay == 1 ? true : false,
				arrows: dataArrows == 1 ? true : false,
				autoplaySpeed: 5000,
				infinite: true,
				speed: 300,
				rtl: true,
				slidesToShow: bm_slidesToShow,
				slidesToScroll: 1,
				adaptiveHeight: true,
				responsive: [
					{
						breakpoint: 1024,
						settings: {
							slidesToShow: parseInt(breakpoint_1024_slidesToShow),
							slidesToScroll: parseInt(breakpoint_1024_slidesToShow),
							infinite: true,
							dots: true,
							fade: false,
						}
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: parseInt(breakpoint_768_slidesToShow),
							slidesToScroll: parseInt(breakpoint_768_slidesToShow),
							fade: false,
						}
					},
					{
						breakpoint: 480,
						settings: {
							slidesToShow: parseInt(breakpoint_480_slidesToShow),
							slidesToScroll: parseInt(breakpoint_480_slidesToShow),
							fade: false,
						}
					}
				]
			});
		});
	});

	var ct_progress_items = [];

	jQuery(document).ready(function () {
		//Progress

		if (typeof ProgressBar !== 'undefined') {
			jQuery('.c-progress-item').each(function () {
				var $this = jQuery(this);
				var progressItemID = $this.attr('data-id');
				var ProgressType = $this.attr('data-type');
				var ProgressPercent = $this.attr('data-percent');
				var valueText = $this.attr('data-value-text');
				var textColor = $this.attr('data-text-color');
				var bgColor = $this.attr('data-bg-color');
				var fontFamily = $this.attr('data-font-family');
				var fontSize = $this.attr('data-font-size');
				var bm_trailColor = $this.attr('data-trail-color');
				var bm_trailWidth = $this.attr('data-trail-width');
				var bm_strokeWidth = $this.attr('data-stroke-width');
				var bm_duration = $this.attr('data-duration');
				bm_trailWidth = parseInt(bm_trailWidth);
				bm_strokeWidth = parseInt(bm_strokeWidth);


				if (bm_trailColor == '') {
					if (ProgressType === 'bar') {
						bm_trailColor = '#eee';
					} else {
						bm_trailColor = '#32211c';
					}
				}

				if (fontSize == '') {
					if (ProgressType === 'bar') {
						fontSize = "14px";
					} else {
						fontSize = "36px";
					}
				}

				if (!bm_trailWidth || bm_trailWidth == '') {
					if (ProgressType === 'bar') {
						bm_trailWidth = 0.1;
					} else {
						bm_trailWidth = 8;
					}
				}

				if (!bm_strokeWidth || bm_strokeWidth == '') {
					if (ProgressType === 'bar') {
						bm_strokeWidth = 2;
					} else {
						bm_strokeWidth = 8;
					}
				}

				if (bm_duration == '') {
					if (ProgressType === 'bar') {
						bm_duration = 1400;
					} else {
						bm_duration = 2000;
					}
				}

				var progressInit;

				progressItemID = document.getElementById(progressItemID);
				var doProgress = $(progressItemID);

				if (progressItemID) {

					if (ProgressType === 'bar') {
						progressInit = new ProgressBar.Line(progressItemID, {
							color: bgColor,
							strokeWidth: bm_strokeWidth,
							trailWidth: bm_trailWidth,
							trailColor: bm_trailColor,
							easing: 'easeInOut',
							duration: bm_duration,
							svgStyle: {
								width: '100%',
								height: '100%'
							},

							text: {
								style: {
									color: textColor,
									position: 'absolute',
									right: '0',
									top: '30px',
									padding: 0,
									margin: 0,
									transform: null
								},
								autoStyleContainer: false
							},

							from: {
								color: bgColor,
								width: bm_strokeWidth,
							},
							to: {
								color: bgColor,
								width: bm_strokeWidth,
							},

							step: function (state, bar) {
								bar.setText(Math.round(bar.value() * 100));
							}

						});

						progressInit.path.style.strokeLinecap = 'round';

					} else if (ProgressType === 'circle') {
						progressInit = new ProgressBar.Circle(progressItemID, {


							color: textColor,
							strokeWidth: bm_strokeWidth,
							trailWidth: bm_trailWidth,
							trailColor: bm_trailColor,
							easing: 'easeInOut',
							duration: bm_duration,

							text: {
								autoStyleContainer: false
							},
							from: {
								color: bgColor,
								width: bm_strokeWidth,
							},
							to: {
								color: bgColor,
								width: bm_strokeWidth,
							},

							step: function (state, circle) {
								circle.path.setAttribute('stroke', state.color);
								circle.path.setAttribute('stroke-width', state.width);

								if (valueText === '') {
									var value = Math.round(circle.value() * 100);
									if (value === 0) {
										circle.setText('');
									} else {
										circle.setText(value);
									}
								} else {
									circle.setText(valueText);
								}


							}
						});
					}

					if (ProgressType === 'bar' || ProgressType === 'circle') {
						if (fontFamily != '') {
							progressInit.text.style.fontFamily = fontFamily;
						}
						progressInit.text.style.fontSize = fontSize;
					}

					ct_progress_items.push(['#' + $this.attr('data-id'), progressInit, ProgressPercent, false]);
				}

			});
		}

		// trigger the progressbar when scrolling
		$(document).bind('scroll', function () {
			var scrollOffset = $(document).scrollTop();

			for (var k in ct_progress_items) {
				var item_id = ct_progress_items[k][0];
				var item_progressbar = ct_progress_items[k][1];
				var item_percent = ct_progress_items[k][2];
				var item_progress_runned = ct_progress_items[k][3];

				if (!item_progress_runned) {
					var containerOffset = $(item_id).offset().top - window.innerHeight;
					if (scrollOffset > containerOffset) {
						item_progressbar.animate(item_percent);

						item_progress_runned = true;

						ct_progress_items[k][3] = true;
					}
				}
			}
		});

		jQuery('.c-icon-box').each(function () {

			var $this = jQuery(this);

			var itemDataCount = parseInt($this.attr('data-count'));

			var itemColumn = $this.find("li.c-column");

			if (itemColumn !== "undefined") {

				itemColumn.unwrap();

				itemColumn.unwrap();

				for (var i = 0; i < itemColumn.length; i++) {
					if (i % itemDataCount === 0) {
						itemColumn.slice(i, i + itemDataCount).wrapAll('<li class="block-group"><ul></ul></li>');
					}
				}
			}

		});

		/*Shortcode Countdown*/

		function isDate(strDate) {
			var scratch = new Date(strDate);
			if (scratch.toString() == 'NaN' || scratch.toString() == 'Invalid Date') {
				return false;
			} else {
				return true;
			}
		};

		var c_countdown = function () {

			$('.c-countdown__inner').each(function (index, element) {
				var $this = $(this);
				var $years_text = $this.attr('data-years-text');
				var $months_text = $this.attr('data-months-text');
				var $week_text = $this.attr('data-week-text');
				var $weeks_text = $week_text + 's';
				var $days_text = $this.attr('data-days-text');
				var $hours_text = $this.attr('data-hours-text');
				var $minutes_text = $this.attr('data-minutes-text');
				var $seconds_text = $this.attr('data-seconds-text');
				var $timer = $this.attr('data-countdown');

				var $format = $this.attr('data-format');
				if ($format == 'full') {
					$format = 'yodHMS';
				} else {
					$format = 'dHMS';
				}

				if (!isDate($timer)) {
					alert('You have entered an incorrect time value');
					return false;
				}
				;

				$this.countdown({
					until: new Date($timer),
					labels: [$years_text, $months_text, $weeks_text, $days_text, $hours_text, $minutes_text, $seconds_text],
					labels1: [$years_text, $months_text, $week_text, $days_text, $hours_text, $minutes_text, $seconds_text], //min
					format: $format,
					padZeroes: true,
				});


			});
		};
		c_countdown();

		// video lightbox
		if (jQuery().swipebox) {
			jQuery('.c-video-lightbox-item').swipebox();
		}

		//gallery lightbox
		if (jQuery().swipebox) {
			jQuery('.c-gallery-item').swipebox({
				loopAtEnd: false, // true will return to the first image after the last image is reached
				hideBarsDelay: 5000,
			});
		}

		// portfolio lightbox
		if (jQuery().swipebox) {
			jQuery('.c-portfolio-lightbox').swipebox({
				loopAtEnd: false, // true will return to the first image after the last image is reached
				hideBarsDelay: 5000,
			});
		}

		//Shortcode Counter
		jQuery('.c-counter__value').each(function () {

			var $this = jQuery(this);
			var counterID = $this.attr('data-id');
			var counterEndValue = $this.attr('data-value');
			var counterStartValue = 0;
			var counterDuration = $this.attr('data-time');
			var counterSeparator = $this.attr('data-separator');
			var counterSuffix = $this.attr('data-suffix');
			counterDuration = counterDuration / 1000;

			var options = {
				useEasing: false,
				useGrouping: true,
				separator: counterSeparator,
				decimal: '',
				suffix: counterSuffix
			};

			var c_counter = new CountUp(counterID, counterStartValue, counterEndValue, 0, counterDuration, options);

			// trigger the counter when scrolling
			$(document).bind('scroll', function () {
				var scrollOffset = $(document).scrollTop();
				var containerOffset = $('#' + counterID).offset().top - window.innerHeight;
				if (scrollOffset > containerOffset) {
					c_counter.start();
				}
			});

		});
		
		if($(window).width() <= 480){
			jQuery('.grid9').slick({
				lazyLoad: 'ondemand',
				fade: false,
				cssEase: 'ease-out',
				dots: false,
				autoplay: false,
				arrows: true,
				autoplaySpeed: 5000,
				infinite: true,
				speed: 300,
				slidesToShow: 2,
				slidesToScroll: 2,
				adaptiveHeight: false
			});
		} else {
			jQuery('.grid9').addClass('block');
		}
	});

})

(jQuery);