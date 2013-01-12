Paloma.callbacks['teams/show'] = function(params){

	Morris.Line({
	  element: 'perfomance_chart',
	  data: $('#perfomance_chart').data('stocks'),
	  xkey: 'updated_at',
	  ykeys: ['price'],
	  labels: ['Compra'],
	  smooth: false,
    preUnits: '$'
	});

};
