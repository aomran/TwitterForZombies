# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('div#custom_phase2 form').submit (event) ->
		event.preventDefault()

		url = $(this).attr('action')
		custom_decomp = $('div#custom_phase2 #zombie_decomp').val()

		$.ajax
		  type: 'put'
		  url: url
		  data: {zombie: { decomp: custom_decomp} }
		  dataType: 'json'
		  success: (json) ->
		  	$('#decomp').text(json.decomp).effect('highlight')
		  	$("div#custom_phase2").fadeOut() if json.decomp == "Dead (again)"
	
	$("a.indexaddzombie").click (event) ->
  		event.preventDefault()
  		$("div#addzombie").fadeToggle('fast')

#caused interference with the delete button
 #  	$('tr.zombie').bind( 'click', ->
 #  		window.location = $(this).find('a').attr('href')
	# ).hover ->
	# 	$(this).toggleClass 'hover'