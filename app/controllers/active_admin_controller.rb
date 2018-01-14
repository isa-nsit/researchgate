class ActiveAdminController < ApplicationController
  def home
  	#ongoing projects
    relations = ProjectUserAdminRelation.where(admin_id: current_admin.id)
    projectIds=[]
    relations.each do |r|
      projectIds<<r.SelectedProject_id
    end
    @ongoingProjects=SelectedProject.where(id:projectIds)

    #completed projects
    complete=CompleteProject.where(Admin_id: current_admin.id)
    c_projectIds=[]
    complete.each do |c|
      c_projectIds<<c.SelectedProject_id
    end
    @completedProjects=SelectedProject.where(id:c_projectIds)

    #tasks
    @tasks = Task.where("admin_id=? AND accepted=?",current_admin.id,true)


  end

end
