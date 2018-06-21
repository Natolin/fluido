class ConversationsController < ApplicationController

# the lessons page passes (user_id: lesson.user.id)


  def index # will be rendered with a partial on the "show" page
    #@conversations = Conversation.where(conversation.messages.user_id == current_user.id)
    @my_conversations = Conversation.all
    # only show all of the conversations that the user is in
  end

  def create # the user that you want to message is passed to this method
    user = User.find(params[:user_id].to_i)
    my_id = current_user.id
    myself = User.find(my_id)
    convo = user.conversations.find do |conv|
      user_ids = conv.subscriptions.pluck(:user_id)
      user_ids.include?(myself.id) && user_ids.include?(user.id)
    end

    if convo.nil? 
      convo = Conversation.create
      other_sub = Subscription.create(user_id: user.id, conversation_id: convo.id)
      my_sub = Subscription.create(user_id: myself.id, conversation_id: convo.id)
    end
   redirect_to conversation_path(convo)
   end

  def show

    @conversation = Conversation.find(params[:id])
    @message = Message.new

    
  end

  private

  def conversation_params
    params.require(:conversation).permit(title: "#{@user.username} and #{current.user.username}")
    # i have written both names in the title so that in the display i can remove the one that matches the current_user
  end
end
