import consumer from "./consumer"
import CableReady from "cable_ready"

// get list ID from URL
let list_id = parseInt(window.location.href.split('/').pop());

consumer.subscriptions.create({ channel: "ListChannel", list_id }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.cableReady) {
      CableReady.perform(data.operations);
    }
    // Called when there's incoming data on the websocket for this channel
  }
});
