require 'twilio-ruby'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :teachers]
  before_action :disable, only: [:home]


  def home
  end

  def teachers
  end


  # This is to disable the original navbar on the homepage
  # See the before action
  def disable
    @disabled = true
  end
end
