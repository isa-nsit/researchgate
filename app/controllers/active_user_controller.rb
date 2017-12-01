class ActiveUserController < ApplicationController
  def home
  end

  def projectIndex
  	@category=params[:category]
	@project=Project.where(:category=>@category)
  end
end
