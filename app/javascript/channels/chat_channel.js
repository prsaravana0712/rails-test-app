import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the chat channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the chat channel");
  },

  received(data) {
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
    console.log(`Data Received: ${data.content.message}`);
    $("#new_message").append(`<p>${data.content.message}</p>`);
    $("#chat_message").val('');
  }
});
