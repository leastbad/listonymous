import consumer from "./consumer"
import CableReady from "cable_ready"

// get list ID from URL
let list_id = parseInt(window.location.href.split('/').pop());

consumer.subscriptions.create({ channel: "ListChannel", list_id }, {
  connected() {
    // Called when the subscription is ready for use on the server
    // list.update_viewers_counter();
    // perform("update_viewers_counter");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.cableReady) {
      CableReady.perform(data.operations);

      val = data.counter;

      console.log(val);
    }

    console.log(data);
    console.log("list channel");
    // Called when there's incoming data on the websocket for this channel

  }
});
