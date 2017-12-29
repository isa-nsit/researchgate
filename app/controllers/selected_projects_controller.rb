class SelectedProjectsController < ApplicationController
 before_action :authenticate_admin!
  
  def create
  	respond_to do|format| 

      task=Task.where(id:params[:id]).first
      
 	    project = SelectedProject.new
  	  project.ProjectName = task.task_name
  	  project.Description = task.task_desc
  	  project.admin_id = current_admin.id
    	project.email1 = task.email1
    	project.email2 = task.email2
    	project.email3 = task.email3
    	project.email4 = task.email4
    	project.email5 = task.email5
    	
      user_id1 = 0
    	user_id2 = 0
    	user_id3 = 0
    	user_id4 = 0
    	user_id5 = 0

    	if(task.email1 and task.email1!="")
    			user_id1 = User.find_by_email(task.email1).id
    	end
      if(task.email2 and task.email2!="")
          user_id2 = User.find_by_email(task.email2).id
      end
      if(task.email3 and task.email3!="")
          user_id3 = User.find_by_email(task.email3).id
      end
      if(task.email4 and task.email4!="")
          user_id4 = User.find_by_email(task.email4).id
      end
      if(task.email5 and task.email5!="")
          user_id5 = User.find_by_email(task.email5).id
      end
  	
  		if project.save
  			relations = ProjectUserAdminRelation.new
  			relations.SelectedProject_id = project.id
  			relations.admin_id = current_admin.id
  			relations.user_id1 = user_id1
  			relations.user_id2 = user_id2
  			relations.user_id3 = user_id3
  			relations.user_id4 = user_id4
  			relations.user_id5 = user_id5
  			relations.save
  			
        task.destroy

  			format.html {redirect_to active_admin_home_path, notice: 'Project Added.' }  	
  		
  		else
  			format.html {redirect_to selected_projects_new_path, notice: 'Project Could not be Saved!'}	
  		end
    end
  end


  def complete
    id= params[:id]
    project=ProjectUserAdminRelation.where(:SelectedProject_id=> id).first
    val=CompleteProject.new
    val.SelectedProject_id=id
    val.Admin_id=current_admin.id
    val.user1=project.user_id1
    val.user2=project.user_id2
    val.user3=project.user_id3
    val.user4=project.user_id4
    val.user5=project.user_id5
    val.save
    project.destroy

    return redirect_to active_admin_home_path
  end

end
