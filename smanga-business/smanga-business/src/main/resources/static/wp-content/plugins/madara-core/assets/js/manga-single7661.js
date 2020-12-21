(function ($) {

	$(document).on('wp_manga_after_load_chapters_list', function () {

		// accordion  view chap
		jQuery(".listing-chapters_wrap ul.main li.has-child").append('<i class="icon ion-md-add"></i>');

		$(".listing-chapters_wrap ul.main > li.has-child").on('click', function (e) {
			var $this = $(this);
			$(e.target).toggleClass("active").children("ul").slideToggle(300);
		});
	});

	$(document).on('mouseover', '.ratings_stars', function () {
		$(this).prevAll('.ratings_stars ').andSelf().removeClass('ion-ios-star-outline');
		$(this).prevAll('.ratings_stars ').andSelf().removeClass('ion-ios-star-half');
		$(this).prevAll('.ratings_stars ').andSelf().addClass('ion-ios-star');

		$(this).nextAll('.ratings_stars ').removeClass('ion-ios-star');
		$(this).nextAll('.ratings_stars ').removeClass('ion-ios-star-half');
		$(this).nextAll('.ratings_stars ').addClass('ion-ios-star-outline');
	});

	$(document).on('mouseout', '.ratings_stars', function () {
		$(this).prevAll().andSelf().removeClass('ion-ios-star').addClass('ion-ios-star-outline');
		var all = $('.ratings_stars');
		$.each(all, function (i, e) {
			if ($(e).hasClass('rating_current')) {
				$(e).removeClass('ion-ios-star-outline');
				$(e).addClass('ion-ios-star');
			}
			if ($(e).hasClass('rating_current_half')) {
				$(e).removeClass('ion-ios-star-outline');
				$(e).addClass('ion-ios-star-half');
			}
		})
	});

})(jQuery);
