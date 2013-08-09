class TasksController < ApplicationController

	before_filter :get_user

	def get_user
		@user = User.find(params[:user_id])
	end

	before_filter :get_task, :only => [:edit, :update, :show, :destroy]

	def get_task
		@task = @user.tasks.find(params[:id])
	end
=begin BEFORE NESTING TASKS with USERS
	before_filter :get_task, :only => [:edit, :update, :show, :destroy]
	before_filter :get_users, :only => [:edit, :new]
	

	def get_task
		@task = Task.find(params[:id])
	end

	def get_users
		@users = User.all # selecting user_id in forms
	end
=end
	def index
		@tasks = @user.tasks
		#@tasks = Task.all BEFORE NESTING
	end

	def new
		@task = Task.new
		
	end

	def create
		@task = Task.create(params[:task])
		@task.user_id = params[:user_id]
		@task.save
		redirect_to user_path(@user)
	end

	def show
		#@task = @user.tasks.find(params[:id]) # with NESTING
		#@task = Task.find(params[:id])
	end
	
	def edit
		#@task = Task.find(params[:id])
	end

	def update
		#@task = Task.find(params[:id])
		@task.update_attributes(params[:task])
		redirect_to user_path(@user)
	end
	
	def destroy
		#task = Task.find(params[:id])
		@task.destroy
		#Task.find(params[:id]).destroy
		redirect_to user_path(@user)
	end
end
