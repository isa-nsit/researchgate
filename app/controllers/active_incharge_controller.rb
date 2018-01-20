class ActiveInchargeController < ApplicationController
  before_action :authenticate_incharge!
  def home
  	# byebug
  	@faculties = Admin.select("id,name,pic")


  	@completed_projects = CompleteProject.all
  end
end
