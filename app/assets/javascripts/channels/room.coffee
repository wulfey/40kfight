App.room = App.cable.subscriptions.create "RoomChannel",
    connected: ->
        # Called when the subscription is ready for use on the server

    disconnected: ->
        # Called when the subscription has been terminated by the server

    received: (data) ->
        unless data.content.blank?
            $('#messages-table').append '<div class="message">' +
                '<div class="message-user">' + data.username + ":" + '</div>' +
                '<div class="message-content">' + data.content + '</div>' + '</div>'
            scroll_bottom()
            console.log(data)
        # alert data.username

        # Called when there's incoming data on the websocket for this channel
        # data is:  content:  message.content, username: message.user.username

# # ActionCable.server.broadcast 'room_channel',
#                                    content:  message.content,
#                                    username: message.user.username

    scroll_bottom = () ->
        $('#messages').scrollTop($('#messages')[0].scrollHeight)

    submit_message = () ->
        $('#message_content').on 'keydown', (event) ->
            if event.keyCode is 13
                $('input').click()
                event.target.value = ""
                event.preventDefault()


    $(document).on 'turbolinks:load', ->
        submit_message()
        
