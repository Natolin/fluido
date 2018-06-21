Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
  user_ids = conv.subscriptions.pluck(:user_id)
      user_ids.include?(myself.id) && user_ids.include?(user.id)