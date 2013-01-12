jQuery ->
	email = $('meta[name="user_email"]').attr('content');
	mixpanel.identify(email);
	mixpanel.people.set({
    "$email": email,
    "$last_login": new Date()
  });
	mixpanel.track_forms('.buy form', 'Acción comprada', (form) -> { Team: $(form).data('team') };);
	mixpanel.track_forms('.sell form', 'Acción vendida', (form) -> { Team: $(form).data('team') };);
	mixpanel.name_tag(email);