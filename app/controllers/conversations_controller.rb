class ConversationsController < ApplicationController

# the lessons page passes (user_id: lesson.user.id)


  def index # will be rendered with a partial on the "show" page
    #@conversations = Conversation.where(conversation.messages.user_id == current_user.id)
    @my_conversations = Conversation.all
    # only show all of the conversations that the user is in
  end

  def create # the user that you want to message is passed to this method
    user_id = params[:user_id]
    other_sub = Subscription.find_by(user_id: user_id)
    my_sub = Subscription.find_by(user_id: current_user.id)
    # if a convo exists b/t these users already (how to get this to involve more than one)
    if (my_sub.present? && other_sub.present?) && (my_sub.conversation_id == other_sub.conversation_id)
      # then save that pre-existing convo into a variable for user later
        @convo = Conversation.find(my_sub.conversation_id)
    else
      @convo = Conversation.new()
      if @convo.save
        # create x new subscriptions for 
        sub1 = Subscription.create(conversation_id: @convo.id, user_id: current_user.id)
        sub2 = Subscription.create(conversation_id: @convo.id, user_id: params[:user_id])
      end
    end
    redirect_to conversation_path(@convo)
  end

  def show

    @conversation = Conversation.find(params[:id])
    @message = Message.new

    @list = []
    @other = []

    # get all subs I have
    @my_subs = Subscription.where(user_id: current_user.id)

    # for each of my subscriptions
    @my_subs.each do |sub|
      # extract the convo using the id stored in the sub
      @convo = Conversation.find(sub.conversation_id)

      # extract only subs that have this convo.id (>= 2)
      @both = Subscription.where(conversation_id: @convo.id)

      #this will be an array of two
      @other_subscription = @both.delete(Subscription.find_by(user_id: current_user.id))

      @list << @convo
      @other << @other_subscription

    end
    
  end

  private

  def conversation_params
    params.require(:conversation).permit(title: "#{@user.username} and #{current.user.username}")
    # i have written both names in the title so that in the display i can remove the one that matches the current_user
  end
end
