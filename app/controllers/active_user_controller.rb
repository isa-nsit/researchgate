class ActiveUserController < ApplicationController
  def home
  	@countElectronic=Admin.all.where(division:"Electronic").count
  	@countElectrical=Admin.all.where(division:"Electrical").count
  	@countMechanical=Admin.all.where(division:"Mechanical").count
    user1 = ProjectUserAdminRelation.where(user_id1:current_user.id)
    user2 = ProjectUserAdminRelation.where(user_id2:current_user.id)
    user3 = ProjectUserAdminRelation.where(user_id3:current_user.id)
    user4 = ProjectUserAdminRelation.where(user_id4:current_user.id)
    user5 = ProjectUserAdminRelation.where(user_id5:current_user.id)

    @projects = []
    user1.each do|projects|
      @projects<<projects
    end
    user2.each do|projects|
      @projects<<projects
    end
    user3.each do|projects|
      @projects<<projects
    end
    user4.each do|projects|
      @projects<<projects
    end
    user5.each do|projects|
      @projects<<projects
    end
    
    user1 = CompleteProject.where(user1:current_user.id)
    user2 = CompleteProject.where(user2:current_user.id)
    user3 = CompleteProject.where(user3:current_user.id)
    user4 = CompleteProject.where(user4:current_user.id)
    user5 = CompleteProject.where(user5:current_user.id)
    
    @completeProjects = []
    user1.each do|projects|
      @completeProjects<<projects
    end
    user2.each do|projects|
      @completeProjects<<projects
    end
    user3.each do|projects|
      @completeProjects<<projects
    end
    user4.each do|projects|
      @completeProjects<<projects
    end
    user5.each do|projects|
      @completeProjects<<projects
    end

    user1 = Task.where(email1:current_user.email)
    user2 = Task.where(email2:current_user.email)
    user3 = Task.where(email3:current_user.email)
    user4 = Task.where(email4:current_user.email)
    user5 = Task.where(email5:current_user.email)
    
    @tasks = []
    user1.each do|projects|
      @tasks<<projects
    end
    user2.each do|projects|
      @tasks<<projects
    end
    user3.each do|projects|
      @tasks<<projects
    end
    user4.each do|projects|
      @tasks<<projects
    end
    user5.each do|projects|
      @tasks<<projects
    end

  end

  def facultyIndex
  	@division=params[:division]
	  @faculty=Admin.where(:division=>@division)
  end

  def facultyShow

    @name=params[:name]
	  @faculty=Admin.where(:name=>@name).first
    
  end
end
