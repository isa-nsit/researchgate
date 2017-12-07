class ActiveUserController < ApplicationController
  def home
  	@countElectronic=Admin.all.where(division:"Electronic").count
  	@countElectrical=Admin.all.where(division:"Electrical").count
  	@countMechanical=Admin.all.where(division:"Mechanical").count
    @show=UserTaskRelation.where(:user_id=>current_user.id)
        
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
