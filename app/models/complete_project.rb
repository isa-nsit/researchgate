class CompleteProject < ActiveRecord::Base
  belongs_to :SelectedProject
  belongs_to :Admin
end
