class ConversationsController < ApplicationController

# the lessons page passes (user_id: lesson.user.id)


  def index # will be rendered with a partial on the "show" page
    #@conversations = Conversation.where(conversation.messages.user_id == current_user.id)
    @my_conversations = Conversation.all
    # only show all of the conversations that the user is in
  end

  def create # the user that you want to message is passed to this method
    
    # if a convo exists b/t these users already (how to get this to involve more than one)
    if Subscription.find_by(user_id: @user.id).present? && Subscription.find_by(user_id: current_user.id).present? 
      # then save that pre-existing convo into a variable for user later
      @convo = Conversation.find(conversation_params)
    else
      @convo = Conversation.new(conversation_params)
      if @convo.save
        # create x new subscriptions for 
        sub1 = Subscription.create(conversation_id: @convo, user_id: current_user)
        sub2 = Subscription.create(conversation_id: @convo, user_id: params[:user_id])
        redirect_to conversation_path(@convo)
      end
    end
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
