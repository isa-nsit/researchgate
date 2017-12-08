class ActiveAdminController < ApplicationController
  def home
  	  	 @projects = ProjectUserAdminRelation.where(admin_id: current_admin.id)
         @complete=CompleteProject.where(Admin_id: current_admin.id)
  end

  def new
  	@project = SelectedProject.new
  	@email = params[:selected_project][:email1]
  end

  def createProject
  	@project = SelectedProject.new
  
  end
end
