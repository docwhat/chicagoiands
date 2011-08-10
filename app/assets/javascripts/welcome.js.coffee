# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
        readmore = $('#read-more')
        readmore.click ->
                $('#next-meeting .body').fadeIn('slow')
                readmore.hide()
                false
        readless = $('#read-less')
        readless.click ->
                $('#next-meeting .body').fadeOut('slow')
                readmore.show()
                false
