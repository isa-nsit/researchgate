class Eligibility < ActiveRecord::Base
	belongs_to :admin
	validates :percentage,:sems_complete,:branch,:period, presence: true
end
