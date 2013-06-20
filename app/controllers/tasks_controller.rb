class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
		
	end

	def create
		@task = Task.create(params[:task])

		redirect_to new_task_path
	end

	def show
		@task = Task.find(params[:id])
	end
	
	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update_attributes(params[:task])
		redirect_to tasks_path
	end
	
	def destroy
		Task.find(params[:id]).destroy
		redirect_to tasks_path
	end
end
