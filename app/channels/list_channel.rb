class ListChannel < ApplicationCable::Channel
  def subscribed
    stream_from "list_channel_#{params[:list_id]}"
    # byebug
    ActionCable.server.broadcast("list_channel_#{params[:list_id]}", counter: count_unique_connections(params[:list_id]) )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast("list_channel_#{params[:list_id]}", counter: count_unique_connections(params[:list_id]) )
  end

  # https://stackoverflow.com/questions/46683252/actioncable-display-correct-number-of-connected-users-problems-multiple-tabs
  def update_viewers_counter
    # byebug
    ActionCable.server.broadcast("list_channel_#{params[:list_id]}", counter: count_unique_connections(params[:list_id]) )
  end

  def count_unique_connections(list_id)
    connected_users = {}
    # byebug
    # p ActionCable.server.connections
    # ActionCable.server.connections.each do |connection|
    #   connected_users[list_id].push(connection.current_user.id)
    # end
    # p ActionCable.server.connections
    # return connected_users.uniq.length
    return ActionCable.server.connections.length
  end

end
