class MechanicalController < ApplicationController
  
  def index

  	@mechanical=Project.where(:category=>"Mechanical")
  end
end
