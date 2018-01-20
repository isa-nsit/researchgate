class ActiveInchargeController < ApplicationController
  before_action :authenticate_incharge!
  def home
  end
end
