class ElectricalController < ApplicationController
 
  def index

@electrical=Project.where(:category=>"Electrical")

  end
end
