class TextMessagesController < ApplicationController

    def create
        @message = TextMessage.new(text_message_params)
        @message.save
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
