class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user])

		redirect_to users_path
	end

	def show
		@user = User.find(params[:id])
		@tasks = @user.tasks
	end


end
