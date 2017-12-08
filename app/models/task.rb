class Task < ActiveRecord::Base
	validates :name,:branch, :year, :task_name, :task_desc, :percentage, :members_count,:email1, presence: true
	has_and_belongs_to_many :users

end
