class SelectedProjectsController < ApplicationController
 before_action :authenticate_admin!
  def new
 	@project = SelectedProject.new
  end

  def create
  	respond_to do|format| 

  	projectname = params[:selected_project][:ProjectName]
  	description = params[:selected_project][:Description]
  	email1 = params[:selected_project][:email1]
  	email2 = params[:selected_project][:email2]
  	email3 = params[:selected_project][:email3]
  	email4 = params[:selected_project][:email4]
  	email5 = params[:selected_project][:email5]
 	
 	@project = SelectedProject.new
  	@project.ProjectName = projectname
  	@project.Description = description
  	@project.admin_id = current_admin.id
  	@project.email1 = email1
  	@project.email2 = email2
  	@project.email3 = email3
  	@project.email4 = email4
  	@project.email5 = email5
	
  	user_id1 = 0
  	user_id2 = 0
  	user_id3 = 0
  	user_id4 = 0
  	user_id5 = 0

  	if(email1!="")
  		if(User.find_by_email(email1) == nil)
  			user_id1 = nil
  			format.html {return redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
  		else
  			user_id1 = User.find_by_email(email1).id
  		end
  	end

  	if(email2!="")
  		if(User.find_by_email(email2) == nil)
  			user_id2 = nil
  			format.html {return redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
  		else
  			user_id2 = User.find_by_email(email2).id
  		end
  	end
  	
  	if(email3!="")
  		if(User.find_by_email(email3) == nil)
  			user_id3 = nil
  			format.html {return redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
  		else
  			user_id3 = User.find_by_email(email3).id
  		end
  	end
  	
  	if(email4!="")
  		if(User.find_by_email(email4) == nil)
  			user_id4 = nil
  			format.html {return redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
  		else
  			user_id4 = User.find_by_email(email4).id
  		end
  	end
  	
  	if(email5!="")
  		if(User.find_by_email(email5) == nil)
  			user_id5 = nil
  			format.html {return redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
  		else
  			user_id5 = User.find_by_email(email5).id
  		end
  	end
  	
  	
  	if(user_id1!=nil && user_id2!=nil && user_id3!=nil && user_id4!=nil && user_id5!=nil)
		if @project.save
			@relations = ProjectUserAdminRelation.new
			@relations.SelectedProject_id = @project.id
			@relations.admin_id = current_admin.id
			@relations.user_id1 = user_id1
			@relations.user_id2 = user_id2
			@relations.user_id3 = user_id3
			@relations.user_id4 = user_id4
			@relations.user_id5 = user_id5
			@relations.save
			
			format.html {redirect_to active_admin_home_path, notice: 'Project Added.' }  	
		
		else
			format.html {redirect_to selected_projects_new_path, notice: 'Project Could not be Saved! Please Make Sure All the Email Fields are filled Correctly!'}	
		end
	else
	format.html {redirect_to selected_projects_new_path, notice: 'Project Could Not be Saved, Please Check if All Fields Are filled Correctly!' }  	
  	end
  end
  end


   def complete
  
     @id= params[:id]
     @complete=ProjectUserAdminRelation.where(:admin_id=>current_admin.id , :SelectedProject_id=> @id).first
     @val=CompleteProject.new
     @val.SelectedProject_id=@id
     @val.Admin_id=current_admin.id
     @val.user1=@complete.user_id1
     @val.user2=@complete.user_id2
     @val.user3=@complete.user_id3
     @val.user4=@complete.user_id4
     @val.user5=@complete.user_id5
     @val.save
     @complete.destroy

     return redirect_to active_admin_home_path
 
   end

end
