$(document).on 'turbolinks:load', ->
  $('#photo-modal').on 'show.bs.modal', (event) ->
    url = $(event.relatedTarget).data('url')
    $('.modal-content').load url
