class TasksController < ApplicationController
	before_action :authenticate_user!

	def new  
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
    @email=params[:email]    #faculty email
		@task=Task.new
    @email_ids = []

    User.all.each do|user|
      @email_ids << user.email
    end
    
    @email_ids
    @size = @email_ids.size
	end 

	def create
    @email=params[:email]
	  @task=Task.new
    @task.name =params[:task][:name]
    @task.email1 =params[:task][:email1]
    @task.year =params[:task][:year]
    @task.branch =params[:task][:branch]
    @task.percentage =params[:task][:percentage]
    @task.task_name =params[:task][:task_name]
    @task.task_desc =params[:task][:task_desc]
    @task.members_count =params[:task][:members_count]
    @task.accepted = true;
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
    
     flag=true
     
   duplicacy={@task.email1=>1,@task.email2=>2,@task.email3=>3,@task.email4=>4,@task.email5=>5}.reject { |k,v|  k.nil? } 
.keys.uniq.count
   if(duplicacy!=count)
   flag=false
 end

    respond_to do |format| 
      if (count==@task.members_count and @task.save and flag==true)    
      
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
            Resque.enqueue(SendTaskWorker,@task.id,@email)
      else
        format.html { redirect_to tasks_new_path , notice: 'You have not filled all the fields or email id is not registered with us'}
      end
	  end
  end

  def edit 
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
    @task =Task.where(id: params[:id]).first
    
    @email=Admin.find_by_id(@task.admin_id).email
    @email_ids = []

    User.all.each do|user|
      @email_ids << user.email
    end
    
    @email_ids
    @size = @email_ids.size
    
    if(@task.update_count>=3)
      redirect_to active_user_home_path, notice: 'Update limit reached'
    end
  end

  def update
    @task=Task.where(id:params[:id]).first
    @email=params[:email]
    @task.name=params[:task][:name]
    @task.email1=params[:task][:email1]
    @task.year=params[:task][:year]
    @task.branch=params[:task][:branch]
    @task.percentage=params[:task][:percentage]
    @task.task_name=params[:task][:task_name]
    @task.task_desc=params[:task][:task_desc]
    @task.members_count=params[:task][:members_count]
    @task.admin_id = Admin.find_by_email(params[:email]).id
    @task.accepted = true
    @task.update_count+=1
    count=1

    @task.email2= nil;
    @task.email3= nil;
    @task.email4= nil;
    @task.email5= nil;
    
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
       flag=true
     
   duplicacy={@task.email1=>1,@task.email2=>2,@task.email3=>3,@task.email4=>4,@task.email5=>5}.reject { |k,v|  k.nil? } 
.keys.uniq.count
   if(duplicacy!=count)
      flag=false
 end
    if (count==@task.members_count and @task.save and flag==true)
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
      redirect_to active_user_home_path, notice: 'Response has been sent'
     # FormMailer.FormSubmission(@task,@email).deliver_now
      Resque.enqueue(SendTaskWorker,@task.id,@email)
    else
      redirect_to tasks_edit_path , notice: 'You have not filled all the fields or email id is not registered with us'
    end
  end

  def destroy
    task_id=params[:id]
    task=Task.find_by_id(task_id)
    user_relations=UserTaskRelation.where(task_id: task_id)
    user_relations.destroy_all
    task.destroy
    return redirect_to active_user_home_path, notice:'Idea successfully deleted'
  end

end
