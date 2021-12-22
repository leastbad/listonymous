import { Controller } from "stimulus";
import CableReady from "cable_ready";

export default class extends Controller {
  connect() {
    this.channel = this.application.consumer.subscriptions.create(
      { channel: "ListChannel", list_id },
      {
        connect() {},

        disconnect() {},

        received(data) {
          // if (data.cableReady) {
          //     CableReady.perform(data.operations)
          // }
          console.log(data);
        },
      }
    );
    console.log("list controller");
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
