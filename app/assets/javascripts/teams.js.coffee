jQuery ->
	$('form.button_to').submit ->
		$("input[type=submit]", this).attr "disabled", "disabled"