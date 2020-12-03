class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.ordered_by_most_recent
  end
end
