class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :teachers]


  def home
  end

  def teachers
  end
end
