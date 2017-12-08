class SelectedProject < ActiveRecord::Base
	belongs_to :admin
	validates :email1,presence: true
	validates :ProjectName,presence: true
	validates :Description,presence: true
end
