class ProjectsController < ApplicationController

	def new
		@project=Project.new
	end

	def create
		@project = Project.new(project_params)
    	@project.admin_id=current_admin.id
    	@project.save
    	return redirect_to active_admin_home_path
    	# respond_to do |format|
    	# 	if @project.save
    	# 		byebug
    	# 		format.html {redirect_to 'active_admin/home', notice: 'Project was successfully created'}
    	# 	else
    	# 		format.html { render :new }
    	# 	end
    	# end
	end

	def edit
		@project=Project.where(id: params[:id]).first
	end

	def update
		@project=Project.where(id: params[:id]).first
		@project.update(project_params)
		return redirect_to active_admin_home_path
		# respond_to do |format|
  #     		if @project.update(project_params)
  #     			format.html {redirect_to active_admin_home_path, notice: 'Project was successfully updated'}
  #     		else
  #     			format.html { render :edit}
  #     		end
  #     	end
	end

	def destroy
		@project=Project.where(id: params[:id]).first
		@project.destroy
		return redirect_to active_admin_home_path
	end

	private
		def project_params
	      params.require(:project).permit(:name, :desc, :category, :limit)
	    end
end
