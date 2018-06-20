class ConversationsController < ApplicationController

  def index # will be rendered with a partial on the "show" page
    #@conversations = Conversation.where(conversation.messages.user_id == current_user.id)
    @my_conversations = Conversation.all
    # only show all of the conversations that the user is in
  end

  def create # the user that you want to message is passed to this method
    
    # if a convo exists b/t these users already (how to get this to involve more than one)
    if Subscription.find_by(user_id: @user.id).present? && Subscription.find_by(user_id: current_user.id).present? 
      # then save that pre-existing convo into a variable for user later
      @conversation = Conversation.find(conversation_params)
    else
      @conversation = Conversation.new(conversation_params)
      if @conversation.save
        # create x new subscriptions for 
        sub1 = Subscription.create(conversation_id: @conversation.id, user_id: current_user.id)
        sub2 = Subscription.create(conversation_id: @conversation.id, user_id: @user.id)
        redirect_to conversation_messages_path(@conversation, @user.id)
      end
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(title: "#{@user.username} and #{current.user.username}")
    # i have written both names in the title so that in the display i can remove the one that matches the current_user
  end
end
