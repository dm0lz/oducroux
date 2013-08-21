
$ ->

	###### Gmaps setup ######

	map = new GMaps({ 
		div: '#map', 
		lat: 45.77280, 
		lng: 4.84580, 
		zoom: 6 
	})
	
	###### initialize Pretty Photos ######

	$("a[rel^='prettyPhoto']").prettyPhoto({
		deeplinking: false,
		social_tools: ''
		#changepicturecallback: ->
		#	window.location.href = "#portfolio"
		#callback: ->
			#alert 'hh'
			#window.location.href = "#portfolio"
	})
		
	###### easyTabs callback ######

	$('#tab-container').bind "easytabs:after", ->
    	progress()
    	$container.isotope({ filter: "*" })
    	#$('#map').fadeIn()
    	map.refresh()
    	#postMap()


    $('#tab-container').bind "easytabs:before", ->
    	$('.meter').animate { width: "0%" }, 0
    	$container.isotope({ filter: "aucun" })
    	#$('#map').hide()

    ###### easyTabs setup ######

    $('#tab-container').easytabs {
		transitionOut: "slideUp",
		transitionIn: "slideDown"
    }

    ###### reset Progress bars when switching panels ######

	#$('a#perfil').on 'click', resetProgressPerfil
	#$('a#portfo').on 'click', resetProgress
	#$('a#documentos').on 'click', resetProgress
	#$('a#contactos').on 'click', resetProgress

	###### isotope setup ######

	$container = $('#container')
	$container.isotope({ })
	$('#filters a').click ->
        selector = $(this).attr('data-filter')
        $container.isotope({ filter: selector })
        return false
    
    ###### Fonctions diverses ######

resetProgress = (e) ->
	e.preventDefault()
	$('.meter').animate { width: "0%" }, 0

resetProgressPerfil = (e) ->
	e.preventDefault()
	$('.meter').animate { width: "0%" }, 0

progress = ->
	#$('.meter').css { width: "0%" }
	$('.meter').animate({ width: "80%" }, 600)

window.startup = ->
	$('.meter.test').animate { width: "0%" }, 0, ->
		$('.meter.test').animate({ width: "80%" }, 600)
		$('.meter.test2').animate({ width: "80%" }, 600)


postMap = ->
	#setTimeout (-> google.maps.event.trigger(map, 'resize') ), 1000
	#setTimeout (-> alert "hh" ), 1000
	setTimeout (-> map.refresh() ), 10



	
            