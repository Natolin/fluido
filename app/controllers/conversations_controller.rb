class ConversationsController < ApplicationController

# the lessons page passes (user_id: lesson.user.id)


  def index # will be rendered with a partial on the "show" page
    #@conversations = Conversation.where(conversation.messages.user_id == current_user.id)
    @my_convos = current_user.conversations
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
    # not on the conversation show page and the user can type a message.
    # message will show with username and content and message box will clear
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    # on left side we would like to display a list of user you have convo's with
    # username should be clickable to that it opens that conversation
    @convos = current_user.conversations

    both = @conversation.subscriptions.pluck(:user_id)
    other = both.find { |id| id != current_user.id }
    @display_other = User.find(other)


  end
end
