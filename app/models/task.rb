class Task < ActiveRecord::Base
	validates :name,:branch, :year, :task_name, :task_desc, :percentage, :members_count,:email1, presence: true
	belongs_to :admin

	def getUserName user_email
		User.find_by_email(user_email).name
	end

	def getUserId email
		User.find_by_email(email).id
	end
<<<<<<< HEAD
=======

	
>>>>>>> f1b47212c65f2467f37c5d1155bab7bb3e9e018b
end
