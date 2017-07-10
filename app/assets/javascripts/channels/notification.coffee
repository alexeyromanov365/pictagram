App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    console.log(data)
    iziToast.show
      color: 'dark'
      icon: 'icon-person'
      title: 'Hey'
      message: 'Welcome!'
      position: 'center'
      progressBarColor: 'rgb(0, 255, 184)'