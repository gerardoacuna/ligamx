# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Morris.Line
    element: 'perfomance_chart'
    data: $('#perfomance_chart').data('stocks')
    xkey: 'updated_at'
    ykeys: ['price']
    labels: ['Series a']