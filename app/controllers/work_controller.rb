class WorkController < ApplicationController
  before_action :authenticate_user!
  def index
  	@work=Work.new

  end

  def create

      @work=Work.new
      @work.name=params[:work][:name]
      @work.year=params[:work][:year]
      @work.branch=params[:work][:branch]
      @work.string=params[:work][:string]
      @work.sop=params[:work][:sop]
      
      
        respond_to do |format|
       if @work.save
        format.html { redirect_to active_user_home_path, notice: 'Response has been sent' }
       
      else
        format.html { redirect_to work_index_path , notice: 'You have not filled all the fields' }
     end
 end
  end
end
