class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
		
		respond_to do |format|
			format.html # new.html.erb
			format.json { render :json => @task }
		end
	end

	def create
		@task = Task.new(params[:task])
		@task.save

		redirect_to new_task_path
	end

end
