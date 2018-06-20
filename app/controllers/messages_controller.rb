class MessagesController < ApplicationController
 before_action do
  @conversation = Conversation.find(params[:conversation_id])
 end

  def create # render as a partial on the messages show page
  @conversation = Conversation.find(params[:conversation_id])
   @message = Message.new(message_params)
   @message.user = current_user
   @message.conversation = @conversation
   if @message.save
    redirect_to conversation_path(@conversation)
   end
  end

  private

   def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
   end
end