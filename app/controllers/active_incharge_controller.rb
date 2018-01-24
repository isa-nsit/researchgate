class ActiveInchargeController < ApplicationController
  before_action :authenticate_incharge!
  def home
  	@faculties = Admin.select("id,name,pic")
  end

  def student_profile
    @user=User.find_by_id(params[:id])
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
  end
end
