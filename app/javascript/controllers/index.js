// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from './application_controller'
import list_controller from './list_controller'

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
application.consumer = consumer
StimulusReflex.initialize(application, {
  controller,
  isolate: true
})
// application.controllers.ListChannel = { channel: "ListChannel" };
// application.consumer.subscriptions.create(
//     { channel: "ListChannel", list_id: 2 },
//     {
//       connect() {},

//       disconnect() {},

//       received(data) {
//         // if (data.cableReady) {
//         //     CableReady.perform(data.operations)
//         // }
//         console.log(data);
//       },
//     }
//   );
// StimulusReflex.register(list_controller);
StimulusReflex.debug = process.env.RAILS_ENV === 'development'

// https://cableready.stimulusreflex.com/leveraging-stimulus#introducing-the-stimulus-cableready-controller
// application.consumer = consumer
