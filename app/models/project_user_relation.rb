class ProjectUserRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :Selectedproject
end
