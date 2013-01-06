jQuery ->
	mixpanel.track_forms('.buy form', 'Acción comprada', (form) -> { team: $(form).data('team') };);
	mixpanel.track_forms('.sell form', 'Acción vendida', (form) -> { team: $(form).data('team') };);
	mixpanel.name_tag(user);