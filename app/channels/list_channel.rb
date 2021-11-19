class ListChannel < ApplicationCable::Channel
  def subscribed
    stream_from "list_channel_#{params[:list_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
