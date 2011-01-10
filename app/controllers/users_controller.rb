class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user.save
    redirect_to(new_message_url)
  end
end
