jQuery ->
	$("#buy_stock").click ->
		mixpanel.track "Stock bought"

	$("#sell_stock").click ->
		mixpanel.track "Stock sold"