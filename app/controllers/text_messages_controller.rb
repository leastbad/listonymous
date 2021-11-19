class TextMessagesController < ApplicationController
    include CableReady::Broadcaster

    def create
        @message = TextMessage.create(text_message_params)
        # byebug
        cable_ready["list_channel_#{params[:text_message][:list_id]}"].insert_adjacent_html(
            selector: "#messages",
            position: "afterbegin",
            html: render_to_string(partial: "message", locals: {message:@message})
          )
        cable_ready["list_channel_#{params[:text_message][:list_id]}"].broadcast
        redirect_to list_path(params[:text_message][:list_id])
        # @message.save
        # redirect_to @message.list
        # if @message.save
        #     redirect_to @message
        # end

        # respond_to do |format|
        #     if @message.save
        # end
    end


    private
    def text_message_params
        # params.require(:list).permit(:title, :categories_id)
        params.require(:text_message).permit(:content, :list_id)
    end
end
