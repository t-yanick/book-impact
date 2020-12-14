class FollowingsController < ApplicationController
	before_action :set_user, only: %i[create destroy]
	before_action :authenticate_user!


	def create
		@following = Following.new
		if @following.confirm_following(@user, current_user)
			flash[:notice] = "You are now following #{@user.username}"
		else
			flash[:alert] = "Error to follow #{@user.username}"
		end
		redirect_to :back
	end

	def destroy
		@user = User.find(params[:id]
		if @user)
			current_user.unfollow(@user)
			flash[:notice] = "Unfolow #{@user.username}"
		else
			flash[:notice] 'Something went wrong, try again'
		end
		redirect_to :back
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def following_params
		params.fetch(:following, {})
	end
end