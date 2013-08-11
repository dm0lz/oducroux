# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('#premierButton').on 'click', clickPremier
	$('#deuxiemeButton').on 'click', clickDeuxieme
	$('#troisiemeButton').on 'click', clickTroisieme

clickPremier = (e) ->
	e.preventDefault()
	if $(".premier").css("display") == "none"
		switchPanel(e, ".premier")

clickDeuxieme = (e) ->
	e.preventDefault()
	if $(".deuxieme").css("display") == "none"
		switchPanel(e, ".deuxieme")

clickTroisieme = (e) ->
	e.preventDefault()
	if $(".troisieme").css("display") == "none"
		switchPanel(e, ".troisieme")

switchPanel = (e, clickedButton) ->
	e.preventDefault()
	if $(".premier").css("display") == "block"
		$(".premier").slideUp 500, ->
			$(clickedButton).slideDown()
	if $(".deuxieme").css("display") == "block"
		$(".deuxieme").slideUp 500, ->
			$(clickedButton).slideDown()
	if $(".troisieme").css("display") == "block"
		$(".troisieme").slideUp 500, ->
			$(clickedButton).slideDown()











