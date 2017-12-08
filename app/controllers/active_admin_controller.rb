class ActiveAdminController < ApplicationController
  def home
  	  	 @selected_projects = SelectedProject.where(admin_id: current_admin.id)
  end

  def new
  	@project = SelectedProject.new
  	@email = params[:selected_project][:email1]
  end

  def createProject
  	@project = SelectedProject.new
  	byebug
  end
end
