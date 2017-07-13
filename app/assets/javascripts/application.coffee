#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require_tree .
#= require iziToast

jQuery ->
  $('#search').autocomplete
    source: "search_suggestions"