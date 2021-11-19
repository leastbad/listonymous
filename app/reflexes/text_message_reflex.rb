# frozen_string_literal: true

class TextMessageReflex < ApplicationReflex
  include AbstractController::Rendering
  # Add Reflex methods in this file.
  #
  # All Reflex instances include CableReady::Broadcaster and expose the following properties:
  #
  #   - connection  - the ActionCable connection
  #   - channel     - the ActionCable channel
  #   - request     - an ActionDispatch::Request proxy for the socket connection
  #   - session     - the ActionDispatch::Session store for the current visitor
  #   - flash       - the ActionDispatch::Flash::FlashHash for the current request
  #   - url         - the URL of the page that triggered the reflex
  #   - params      - parameters from the element's closest form (if any)
  #   - element     - a Hash like object that represents the HTML element that triggered the reflex
  #     - signed    - use a signed Global ID to map dataset attribute to a model eg. element.signed[:foo]
  #     - unsigned  - use an unsigned Global ID to map dataset attribute to a model  eg. element.unsigned[:foo]
  #   - cable_ready - a special cable_ready that can broadcast to the current visitor (no brackets needed)
  #   - reflex_id   - a UUIDv4 that uniquely identies each Reflex
  #
  # Example:
  #
  #   before_reflex do
  #     # throw :abort # this will prevent the Reflex from continuing
  #     # learn more about callbacks at https://docs.stimulusreflex.com/lifecycle
  #   end
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com/reflexes#reflex-classes

  before_reflex do
    # throw :abort # this will prevent the Reflex from continuing
    # learn more about callbacks at https://docs.stimulusreflex.com/lifecycle

    @message = TextMessage.new
  end

  def submit
    @message.update(content: params[:text_message][:content], list_id: params[:text_message][:list_id])
    @message.save
    # byebug
    cable_ready["list_channel_#{params[:text_message][:list_id]}"].text_content(
      selector: "#messages",
      position: "afterbegin",
      html: render_to_string(partial: "text_message/message", locals: {message: @message})
    )
    cable_ready.broadcast
  end

  def create
    m = TextMessage.create(content: params[:text_message][:content], list_id: params[:text_message][:list_id])
    cable_ready["list_channel_#{params[:text_message][:list_id]}"].text_content(
      selector: "#messages",
      position: "afterbegin",
      html: render_to_string(partial: "text_message/message", locals: {message: m})
    )
  end 
end
