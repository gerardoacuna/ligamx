(function ($) {
	mixpanel.track_forms('.buy form', 'Acción comprada', function(form) { return { team: $(form).data('team') }; });
	mixpanel.track_forms('.sell form', 'Acción vendida', function(form) { return { team: $(form).data('team') }; });
	mixpanel.name_tag(user);
})(jQuery);