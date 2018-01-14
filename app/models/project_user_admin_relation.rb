class ProjectUserAdminRelation < ActiveRecord::Base
  belongs_to :admin
  belongs_to :user
  belongs_to :SelectedProject
end
