class TasksController < ApplicationController

	before_filter :get_user
	before_filter :get_task, :only => [:edit, :update, :show, :destroy]

#Filter Actions
	def get_user
		@user = User.find(params[:user_id])
	end

	def get_task
		@task = @user.tasks.find(params[:id])
	end

#RESTful actions
	def index
		@tasks = @user.tasks
	end

	def new
		@task = Task.new
		
	end

	def create
		@task = Task.create(params[:task])
		@task.user_id = params[:user_id]
		@task.save
		flash[:notice] = " task created successfully"
		redirect_to new_user_task_path
	end

	def show
		#@task = @user.tasks.find(params[:id]) # with NESTING
	end
	
	def edit
	end

	def update
		@task.update_attributes(params[:task])
		redirect_to user_path(@user)
	end
	
	def destroy
		@task.destroy
		flash[:notice] = "task deleted successfully"
		redirect_to user_path(@user)
	end
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
