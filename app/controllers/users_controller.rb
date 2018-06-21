class UsersController < ApplicationController

  def edit
    @user = current_user
  end


  def update #do we need save method for update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to root_path #fix redirect later
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :country, :description, :username, :email, :password, :photo, interest_ids: [])
    # params only accepts one thing at a time, so I had to add the [] after interest_ids to allow an entire array of interest ids to be passed into the update method
  end
end

