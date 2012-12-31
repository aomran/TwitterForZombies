# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('a.indexaddtweet').click (event) ->
    	event.preventDefault()
    	$('div#addtweet').fadeToggle('fast')

    $("tr.tweet").bind("click", ->
    	window.location = $(this).find('a').attr('href')
    ).hover ->
    	$(this).toggleClass "hover"