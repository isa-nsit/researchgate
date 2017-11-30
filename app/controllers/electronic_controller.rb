class ElectronicController < ApplicationController
  
  def index
      
      @electronic=Project.where(:category=>"Electronic")
    
  end
end
