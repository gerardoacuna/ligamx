jQuery ->
	mixpanel.track_forms('.buy form', 'Acción comprada');
	mixpanel.track_forms('.sell form', 'Acción vendida');