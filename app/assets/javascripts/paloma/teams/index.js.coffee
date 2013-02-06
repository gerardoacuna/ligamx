$ ->
	$('.slider').each ->
		team = $(this).data 'team'
		minValue = $(this).data 'initial-value'
		maxValue = $(this).data 'max-bid-value'
		$("#" + team).slider
			range: false
			min: +minValue
			max: +maxValue
			value: +minValue
			step: 0.01
			slide: (event, ui) ->
				$("." + team).val ui.value
		$("." + team).val $("#" + team).slider("value")
