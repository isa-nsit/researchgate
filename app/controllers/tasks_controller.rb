class TasksController < ApplicationController
	before_action :authenticate_user!

	def new
		@task=Task.new
	end

	def create
	  @task=Task.new
      @task.name=params[:task][:name]
      @task.year=params[:task][:year]
      @task.branch=params[:task][:branch]
      @task.percentage=params[:task][:percentage]
      @task.task_name=params[:task][:task_name]
      @task.task_desc=params[:task][:task_desc]
      @task.members_count=params[:task][:members_count]
      
    respond_to do |format|
      if @task.save
        format.html { redirect_to active_user_home_path, notice: 'Response has been sent' }
       
      else
        format.html { redirect_to tasks_new_path , notice: 'You have not filled all the fields' }
      end
	end
end
end
