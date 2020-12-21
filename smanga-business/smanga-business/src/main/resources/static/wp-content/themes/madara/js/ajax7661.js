(function () {
	"use strict";

	var _current_page;
	var _ajax_loading;
	var item_template;
	var data;
	var content_div;

	// Save current page
	if (typeof __madara_query_vars !== 'undefined') {
		_current_page = (typeof __madara_query_vars.paged !== 'undefined' ? __madara_query_vars.paged : 0);
	} else {
		_current_page = -1;
	}
	if (_current_page == 0) _current_page = 1;

	// flag to check if an ajax is executing
	_ajax_loading = false;

	jQuery(document).ready(function () {
		if (jQuery('#navigation-ajax').length > 0) {

		}

	});

})(jQuery);
