$(document).on 'turbolinks:load', ->
  return if App.notification
  App.notification = App.cable.subscriptions.create "NotificationChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log(data)

      iziToast.show
        color: 'white'
        image: data.icon
        title: data.name
        message: data.text
        position: 'bottomRight'
        progressBarColor: 'rgb(0, 255, 184)'