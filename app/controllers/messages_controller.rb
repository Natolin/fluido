class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end

  def index # render as a partial on the messages show page
   @messages = @conversation.messages
    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end

    if params[:m]
     @over_ten = false
     @messages = @conversation.messages
    end

  @message = @conversation.messages.new
   end

  def new # render form as a partial on the messages show page
   @message = @conversation.messages.new
  end

  def create # render as a partial on the messages show page
   @message = @conversation.messages.new(message_params)
   if @message.save
    redirect_to conversation_messages_path(@conversation)
   end
  end

  private

   def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
   end
end