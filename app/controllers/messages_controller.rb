class MessagesController < ApplicationController
 before_action :set_conversation

  def create # render as a partial on the messages show page
   @conversation = Conversation.find(params[:conversation_id])
   @message = Message.new(message_params)
   @message.user = current_user
   @message.conversation = @conversation
   if @message.save
    respond_to do |format|
      format.html {redirect_to conversation_path(@conversation)}
      format.js
    end
  else
    respond_to do |format|
      # format.html {render "conversations/show"}
      format.js
    end
   end
  end

  private

   def message_params
    params.require(:message).permit(:content)
   end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
