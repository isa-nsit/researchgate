class ActiveAdminController < ApplicationController
  before_action :authenticate_admin!
  def home
    
  	#ongoing projects
    relations = ProjectUserAdminRelation.where(admin_id: current_admin.id)
    projectIds=[]
    relations.each do |r|
      projectIds<<r.SelectedProject_id
    end
    @ongoingProjects=SelectedProject.where(id:projectIds).reverse

    #completed projects
    complete=CompleteProject.where(Admin_id: current_admin.id)
    c_projectIds=[]
    complete.each do |c|
      c_projectIds<<c.SelectedProject_id
    end
    @completedProjects=SelectedProject.where(id:c_projectIds).reverse

    #tasks
    @tasks = Task.where("admin_id=? AND accepted=?",current_admin.id,true).reverse

  end

  def facultyProfile
    @name=params[:name]
    @faculty=Admin.where(:name=>@name).first
    
    @faculty.AOI.gsub!(/<br>()/,',')
    
    @interests = @faculty.AOI.split(',')
    @interests.delete('and')
    @interests.delete('&')

    @projects = []
    @ids = []
    selectedProjects = ProjectUserAdminRelation.where(admin_id: @faculty.id).order("created_at DESC")
    
    selectedProjects.each do|project|
      @ids<<project.SelectedProject_id
    end

    @ids.each do|id|
      @projects<<SelectedProject.find_by_id(id)
    end
    @projects = @projects[0..5]
    @eligibility = Eligibility.find_by_faculty_name(@name)
    
    if @eligibility
      @eligible_branches = @eligibility.branch.split(',');
    end
    @qualifications = @faculty.qualifications.split(',');
  end

  def student_profile
    @user=User.find_by_id(params[:id])
  end
end
