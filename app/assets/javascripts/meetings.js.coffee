# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    select = $('#season')
    select.change (event) ->
        console.log("NARF %o", select.val())
        select.parent('form').submit()
        console.log("NARF %o", select.val())
        true
    $('.choose input[type=submit]').hide()
