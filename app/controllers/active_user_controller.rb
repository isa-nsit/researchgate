class ActiveUserController < ApplicationController
  before_action :authenticate_user!
  def home

    if !current_user.profile_pic
      current_user.profile_pic = '/image.jpg'
      current_user.save!
    end
    
  	@countInstrumentation=Admin.where(division:"Instrumentation").count
  	@countAutomation=Admin.where(division:"Automation").count
    
    # finding all the ongoing projects in which current_user is involved 
    users = ProjectUserAdminRelation.where("user_id1=? OR user_id2=? OR user_id3=? OR user_id4=? OR user_id5=?",
      current_user.id.to_s,current_user.id.to_s,current_user.id.to_s,current_user.id.to_s,current_user.id.to_s)
    s_projectIds = []
    users.each do|project|
      s_projectIds<<project.selected_projects_id
    end
    @selectedProjects=SelectedProject.where(id:s_projectIds).reverse     
    
    # finding all the completed projects in which current_user is involved
    users = CompleteProject.where("user1=? OR user2=? OR user3=? OR user4=? OR user5=?",current_user.id.to_s,
      current_user.id.to_s,current_user.id.to_s,current_user.id.to_s.to_s,current_user.id.to_s)    
    c_projectIds = []

    users.each do|project|
      c_projectIds<<project.selected_projects_id
    end
    @completedProjects=SelectedProject.where(id:c_projectIds)
   
    # finding all projects
    @allProjects = []
    @selectedProjects.each do|project|
      @allProjects<<project
    end
    @completedProjects.each do|project|
      @allProjects<<project
    end
    @allProjects.shuffle!
  
    # finding all the tasks in which current_user is involved 
    users = UserTaskRelation.where(user_id:current_user.id).reverse    
    task_ids = []
    users.each do|t|
      task_ids<<t.task_id
    end
    @tasks=Task.where(id:task_ids)

  end

  def facultyIndex
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
  	@division=params[:division]
	  @faculty=Admin.where(:division=>@division).order(id: :asc)
  end

  def facultyShow
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
    @name=params[:name]
	  @faculty=Admin.where(:name=>@name).first
    
    @faculty.AOI.gsub!(/<br>()/,',')
    
    @interests = @faculty.AOI.split(',')
    @interests.delete('and')
    @interests.delete('&')

    @projects = []
    @ids = []
    selectedProjects = ProjectUserAdminRelation.where(admin_id: @faculty.id).reverse
    
    selectedProjects.each do|project|
      @ids<<project.selected_projects_id
    end

    @ids.each do|id|
      @projects<<SelectedProject.find_by_id(id)
    end
    @projects = @projects[0,8]
    @eligibility = Eligibility.find_by_faculty_name(@name)
    
    if @eligibility
      @eligible_branches = @eligibility.branch.split(','); 
    end

    @qualifications = @faculty.qualifications.split(',');
  end

  def profile
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
    @user=User.find_by_id(params[:id])
  end

  def edit_profile
    @countInstrumentation=Admin.where(division:"Instrumentation").count
    @countAutomation=Admin.where(division:"Automation").count
  end

  def update_profile
    name=params[:user][:name]
    branch=params[:user][:branch]
    year=params[:user][:year]
    percentage=params[:user][:percentage]
    if(name==""||branch==""||year==""||percentage=="")
      return redirect_to active_user_edit_profile_path, notice: 'You have not filled all the fields'
    end  

    current_user.name=name
    current_user.branch=branch
    current_user.year=year
    current_user.percentage=percentage
    uploaded_file = params[:user][:profile_pic]
    if(uploaded_file)
      filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
      filepath = Dir.pwd + "/uploads/" + filename
      File.open(filepath,'wb') do |file|
        file.write(uploaded_file.read())
      end
      current_user.profile_pic = filename
    end
    
    if(current_user.save)
      return redirect_to active_user_profile_path(id: current_user.id), notice: 'Profile has been saved'
    end
  end  
end