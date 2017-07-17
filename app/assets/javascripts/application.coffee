#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require_tree .
#= require iziToast

$(document).on 'turbolinks:load', ->
  $('#search').autocomplete
    source: "/search_suggestions"