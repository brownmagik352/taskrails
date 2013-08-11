class UsersController < ApplicationController

	before_filter :get_user, :only => [:show, :edit, :update, :destroy]

	def get_user
		@user = User.find(params[:id])
	end

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
		#@user = User.find(params[:id])
		@tasks = @user.tasks
	end

	def edit
	end

	def update
		@user.update_attributes(params[:user])
		redirect_to users_path
	end

	def destroy
		
		@user.tasks.each do |t|
			t.destroy
		end
		@user.destroy
		redirect_to users_path
	end



end
