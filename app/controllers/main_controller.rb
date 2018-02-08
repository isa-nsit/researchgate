class MainController < ApplicationController
	def index
	  	if signed_in?
	  		if user_signed_in?
	  			redirect_to active_user_home_path
	  		
	  		elsif admin_signed_in?
	  			redirect_to active_admin_home_path
	  		
	  		elsif incharge_signed_in?
	  			redirect_to active_incharge_home_path	
			end

		else
			@ongoing = SelectedProject.all.count
			@faculty_members = Admin.all.count
			@students = User.all.count
		end
	end
end
