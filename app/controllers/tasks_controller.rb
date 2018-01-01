class TasksController < ApplicationController
	before_action :authenticate_user!

	def new
    @email=params[:email]    #faculty email
		@task=Task.new
	end 

	def create
    @email=params[:email]
	  @task=Task.new
    @task.name=params[:task][:name]
    @task.email1=params[:task][:email1]
    @task.year=params[:task][:year]
    @task.branch=params[:task][:branch]
    @task.percentage=params[:task][:percentage]
    @task.task_name=params[:task][:task_name]
    @task.task_desc=params[:task][:task_desc]
    @task.members_count=params[:task][:members_count]
    @task.admin_id = Admin.find_by_email(@email).id
    
    count=1
    user2=User.where(:email=>params[:task][:email2]).first
    user3=User.where(:email=>params[:task][:email3]).first
    user4=User.where(:email=>params[:task][:email4]).first
    user5=User.where(:email=>params[:task][:email5]).first

    #checking if user exists or not 
    if(user2)
      count=count+1
      @task.email2=params[:task][:email2]
    end
    if(user3)
      count=count+1
      @task.email3=params[:task][:email3]
    end
    if(user4)
      count=count+1
      @task.email4=params[:task][:email4]
    end    
    if(user5)
      count=count+1
      @task.email5=params[:task][:email5]
    end
    
    respond_to do |format| 
      if (count==@task.members_count and @task.save )    
      
        #creating user_task_relations
        u=UserTaskRelation.new
        u.task_id=@task.id
        u.user_id=User.where(:email=>params[:task][:email1]).first.id
        u.save
        if(user2)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user2.id
          u.save
        end
        if(user3)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user3.id
          u.save
        end
        if(user4)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user4.id
          u.save
        end
        if(user5)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user5.id
          u.save
        end
        
        format.html { redirect_to active_user_home_path, notice: 'Response has been sent' }
        #FormMailer.FormSubmission(@task,@email).deliver_now

      else
        format.html { redirect_to tasks_new_path , notice: 'You have not filled all the fields or email id is not registered with us' }
      end
	  end
  end

  def edit 
    @task =Task.where(id: params[:id]).first
    @email=Admin.find_by_id(@task.admin_id).email
  end

  def update
    @task=Task.where(id:params[:id]).first
    @task.name=params[:task][:name]
    @task.email1=params[:task][:email1]
    @task.year=params[:task][:year]
    @task.branch=params[:task][:branch]
    @task.percentage=params[:task][:percentage]
    @task.task_name=params[:task][:task_name]
    @task.task_desc=params[:task][:task_desc]
    @task.members_count=params[:task][:members_count]
    @task.admin_id = Admin.find_by_email(params[:email]).id
    
    byebug
    count=1
    user2=User.where(:email=>params[:task][:email2]).first
    user3=User.where(:email=>params[:task][:email3]).first
    user4=User.where(:email=>params[:task][:email4]).first
    user5=User.where(:email=>params[:task][:email5]).first

    #checking if user exists or not 
    if(user2)
      count=count+1
      @task.email2=params[:task][:email2]
    end
    if(user3)
      count=count+1
      @task.email3=params[:task][:email3]
    end
    if(user4)
      count=count+1
      @task.email4=params[:task][:email4]
    end    
    if(user5)
      count=count+1
      @task.email5=params[:task][:email5]
    end

    respond_to do |format| 
      if (count==@task.members_count and @task.save )    
        
        oldRelations=UserTaskRelation.where(task_id: params[:id])
        oldRelations.destroy_all
        #creating user_task_relations
        u=UserTaskRelation.new
        u.task_id=@task.id
        u.user_id=User.where(:email=>params[:task][:email1]).first.id
        u.save
        if(user2)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user2.id
          u.save
        end
        if(user3)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user3.id
          u.save
        end
        if(user4)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user4.id
          u.save
        end
        if(user5)
          u=UserTaskRelation.new
          u.task_id=@task.id
          u.user_id=user5.id
          u.save
        end
   
        format.html { redirect_to active_user_home_path, notice: 'Response has been sent' }
        # FormMailer.FormSubmission(@task,@email).deliver_now

      else
        format.html { redirect_to tasks_edit_path , notice: 'You have not filled all the fields or email id is not registered with us' }
      end
    end
  end

end
