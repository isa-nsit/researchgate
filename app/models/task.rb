class Task < ActiveRecord::Base
	validates :name,:branch, :year, :task_name, :task_desc, :percentage, :members_count, presence: true
	belongs_to :user
end
