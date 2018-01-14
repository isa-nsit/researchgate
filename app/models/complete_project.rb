class CompleteProject < ActiveRecord::Base
  belongs_to :SelectedProject
  belongs_to :admin
end
