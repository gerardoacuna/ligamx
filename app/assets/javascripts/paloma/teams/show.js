Paloma.callbacks['teams/show'] = function(params){

	Morris.Line({
	  element: 'perfomance_chart',
	  data: $('#perfomance_chart').data('stocks'),
	  xkey: 'created_at',
	  ykeys: ['price'],
	  labels: ['Compra', 'Venta'],
	  smooth: false,
    preUnits: '$'
	});

};
